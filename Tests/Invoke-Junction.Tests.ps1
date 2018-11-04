$ModuleName = 'Prune'
$FunctionName = 'Invoke-Junction'
Remove-Module $ModuleName -Force -ErrorAction SilentlyContinue
$Module = Import-Module $ModuleName -Force -PassThru


Describe $FunctionName {

    Mock "Get-JunctionFilePath" -ModuleName $ModuleName -MockWith {
        $MockScriptblock = {
            if (-not $Global:JunctionAlreadyExists)
            {
"
Junction v1.06 - Windows junction creator and reparse point viewer
Copyright (C) 2000-2010 Mark Russinovich
Sysinternals - www.sysinternals.com

Created: PATH_TO_JUNCTION
Targetted at: PATH_TO_MODULE
"
            }
            else
            {
"
Junction v1.06 - Windows junction creator and reparse point viewer
Copyright (C) 2000-2010 Mark Russinovich
Sysinternals - www.sysinternals.com

Error creating JUNCTION_FILENAME:
Cannot create a file when that file already exists.
"
            }
        }
        return $MockScriptblock
    }

    $Global:JunctionAlreadyExists = $false
    $TestPath = "TestDrive:\JunctionTest"

    $Result = Invoke-Junction $TestPath C:\Temp -ea Stop

    It "Gets the path to junction.exe" {
        Assert-MockCalled -CommandName "Get-JunctionFilePath" -ModuleName $ModuleName -Times 1
    }

    It "Swallows output from junction.exe" {
        $Result | Should -BeNullOrEmpty
    }

    It "Errors on junction.exe error" {
        $Global:JunctionAlreadyExists = $true

        {$Result = Invoke-Junction $TestPath $PSScriptRoot -ErrorAction Stop} |
            Should -Throw "Cannot create a file when that file already exists."
    }
}

Remove-Variable JunctionAlreadyExists -Scope Global