
# Factory setting: $env:PSModulePath = "$env:USERPROFILE\Documents\WindowsPowerShell\Modules;C:\Program Files\WindowsPowerShell\Modules;C:\Windows\system32\WindowsPowerShell\v1.0\Modules\"


$Script:DefaultAutoloadFolder = Join-Path (
    Join-Path (
        Join-Path $env:USERPROFILE "Documents") "WindowsPowerShell") "AutoloadModules"


Get-ChildItem $PSScriptRoot\Functions -Filter '*.ps1' | ForEach-Object {. $_.FullName}

$JunctionFilePath = Get-JunctionFilePath
if (-not (Test-Path $JunctionFilePath))
{
    Install-JunctionExe
}

try
{
    $AutoloadFolder = Get-AutoloadFolder
}
catch [Microsoft.PowerShell.Commands.WriteErrorException]
{
    $AutoloadFolder = $Script:DefaultAutoloadFolder

    if (-not (Test-Path $AutoloadFolder -PathType Container))
    {
        $null = New-Item $AutoloadFolder -ItemType Directory -ErrorAction Stop
    }

    if (Get-ChildItem $AutoloadFolder)
    {
        Set-AutoloadFolder $AutoloadFolder
    }
    else
    {
        Set-AutoloadFolder $AutoloadFolder -Populate
        Write-Host "Opening autoload folder; delete modules that you don't want to autoload."
        Show-AutoloadFolder
    }
}



#Unloading the module, or restarting the session, will remove any filtering.
$Script:StashedPSModulePath = $env:PSModulePath
$MyInvocation.MyCommand.ScriptBlock.Module.OnRemove = {
    $env:PSModulePath = $Script:StashedPSModulePath
}
