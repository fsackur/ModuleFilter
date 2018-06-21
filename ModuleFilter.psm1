
#Stash the current PSMOdulePath for restoration when user unloads module
$Script:StashedPSModulePath = $env:PSModulePath


#function Select-AutoloadModules
#$AvailableModules = Get-Module -ListAvailable

#$Selection = $AvailableModules | Out-GridView -Title "Select modules to be available" -OutputMode Multiple

#Code to save selection to local config file

#$env:PSModulePath = ($Selection | select -ExpandProperty ModuleBase) -join [System.IO.Path]::PathSeparator


#Unloading the module, or restarting the shell, will remove any filtering.
$MyInvocation.MyCommand.ScriptBlock.Module.OnRemove = {
    $env:PSModulePath = $Script:StashedPSModulePath
}