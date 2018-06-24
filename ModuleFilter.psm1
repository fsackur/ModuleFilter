
#Stash the current PSMOdulePath for restoration when user unloads module
$Script:StashedPSModulePath = $env:PSModulePath

$Script:ConfigPath = $PSScriptRoot
if (-not (Test-Path $Script:ConfigPath -PathType Container))
{
    $null = New-Item $Script:ConfigPath -ItemType Directory -Force
}
$Script:ConfigFile = Join-Path $Script:ConfigPath 'ModuleFilter.csv'
if (-not (Test-Path $Script:ConfigFile -PathType Leaf))
{
    $null = New-Item $Script:ConfigFile -ItemType File -Force
}


Get-ChildItem $PSScriptRoot\Functions | foreach {. $_.FullName}


#On load, apply previous filter
Select-AutoloadModules (Read-AutoloadSelection)


#Unloading the module, or restarting the session, will remove any filtering.
$MyInvocation.MyCommand.ScriptBlock.Module.OnRemove = {
    $env:PSModulePath = $Script:StashedPSModulePath
}