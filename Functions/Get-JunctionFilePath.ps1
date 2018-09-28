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

    return $Script:JunctionFilePath
}