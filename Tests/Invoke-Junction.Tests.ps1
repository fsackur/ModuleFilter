$ModuleName = 'Prune'
$FunctionName = 'Invoke-Junction'

$Module = Import-Module $ModuleName -Force -PassThru

Describe $FunctionName {

    Mock "Get-JunctionFilePath" -ModuleName $ModuleName -MockWith {
        return "Write-Output"
    }

    $Result = & $Module {Invoke-Junction "a" "b"}

    It "Gets the path to junction.exe" {
        Assert-MockCalled -CommandName "Get-JunctionFilePath" -ModuleName $ModuleName -Times 1

    }

    It "Swallows output from junction.exe" {
        $Result | Should -Be $null

    }
}