function Select-AutoloadModules
{
    <#
    .SYNOPSIS
    Choose modules to enable for autoloading.

    .DESCRIPTION
    Updates the PSModulePath environment variable for the current session to prevent unwanted modules from being autoloaded.

    .PARAMETER Config
    Modules which should be enabled for autoloading.

    Elements in this collection must have ShouldAutoload, Name and ModuleBase properties.
    #>
    param
    (
        [Parameter(Position = 0)]
        [ValidateScript({
            $_.ShouldAutoload -is [bool] -and
            $_.Name -is [string] -and -not [string]::IsNullOrWhiteSpace($_.Name) -and
            $_.ModuleBase -is [string] -and -not [string]::IsNullOrWhiteSpace($_.ModuleBase)
        })]
        [psobject[]]$Config
    )

    if (-not $Config)   #Execute clause if config is present but empty
    {
        $AvailableModules = Get-Module -ListAvailable

        $SelectedModules = $AvailableModules | Out-GridView -Title "Select modules to be enabled for autoloading" -OutputMode Multiple

        $Config = $AvailableModules | foreach {
            [PSCustomObject]@{
                ShouldAutoload = $_ -in $SelectedModules
                Name = $_.Name
                ModuleBase = $_.ModuleBase -replace '\\(\d+\.){0,3}\d+$'   #remove version string, if present
            }
            Add-Member -InputObject $_ NoteProperty -Name 'ShouldAutoload' -Value ($_ -in $Selection)
        }

        Write-AutoloadSelection $Config
    }

    $env:PSModulePath = ($Config | where {$_.ShouldAutoload} | select -ExpandProperty ModuleBase) -join [System.IO.Path]::PathSeparator
}