function Get-JunctionFilePath
{
    [CmdletBinding()]
    param ()

    if (-not $Script:JunctionFilePath)
    {
        $ModuleBase              = $MyInvocation.MyCommand.Module.ModuleBase
        $ResourceFolder          = Join-Path $ModuleBase 'Resource'
        if (-not (Test-Path $ResourceFolder)) {$null = New-Item $ResourceFolder -ItemType Directory}

        $Script:JunctionFilePath = Join-Path $ResourceFolder 'junction.exe'
    }

    if (-not (Test-Path $Script:JunctionFilePath -PathType Leaf))
    {
        Install-JunctionExe -ErrorAction Stop
    }

    $Script:JunctionFilePath
}