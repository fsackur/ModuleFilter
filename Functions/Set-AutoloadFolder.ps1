function Set-AutoloadFolder
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory, Position = 0, ValueFromPipeline)]
        [string]$AutoloadFolder,

        [Parameter()]
        [switch]$Populate
    )

    if (-not (Test-Path $AutoloadFolder -PathType Container))
    {
        $null = New-Item $AutoloadFolder -ItemType Directory
    }

    $Script:AutoloadFolder = $AutoloadFolder
    [Environment]::SetEnvironmentVariable('PSPruneAutoloadModulePath', $Script:AutoloadFolder, 'User')
    $env:PSModulePath = $AutoloadFolder

    if ($Populate)
    {
        $ModulesToPopulate = Get-AvailableModules -Unique
        $ModulesToPopulate | New-Autoload
    }
}