function Get-DefaultModulePath
{
    <#
        .SYNOPSIS
        Gets the default values for the PSModulePath environment variable, by scope.

        .DESCRIPTION
        The current value of the PSModulePath environment variable can be considered as the default path
        or paths for PowerShell modules. However, this environment variable may be changed.

        This command finds the original value of the environment variable, as it exists on a default
        installation of Windows PowerShell or PowerShell Core.

        .PARAMETER Scope
        Parameter description

        .EXAMPLE
        An example

        .NOTES
        Author: https://github.com/rjmholt
    #>
    [CmdletBinding()]
    [OutputType([string])]
    param
    (
        [Parameter()]
        [ValidateSet('AllUsers', 'CurrentUser', 'System', 'WindowsPSSystem')]
        [string[]]$Scope
    )

    if ($Scope -eq 'WindowsPSSystem' -and ($IsLinux -or $IsMacOs))
    {
        throw "The scope '$Scope' does not exist on non-Windows platforms"
    }

    if (-not $Scope)
    {
        $Scope = 'AllUsers','CurrentUser','System'
        if (-not ($IsLinux -or $IsMacOS))
        {
            $Scope += 'WindowsPSSystem'
        }
    }

    $invokeModuleMethod = {
        $bindingFlags = [System.Reflection.BindingFlags]'static,nonpublic'
        $m = [System.Management.Automation.ModuleIntrinsics].GetMethod($args[0], $bindingFlags)
        $m.Invoke($null, @())
    }

    $paths = @{}
    switch ($Scope)
    {
        'CurrentUser'
        {
            $p = & $invokeModuleMethod 'GetPersonalModulePath'
            $paths.CurrentUser = $p
        }

        'AllUsers'
        {
            $p = & $invokeModuleMethod 'GetSharedModulePath'
            $paths.AllUsers = $p
        }

        'System'
        {
            $p = & $invokeModuleMethod 'GetPSHomeModulePath'
            $paths.System = $p
        }

        'WindowsPSSystem'
        {
            $p = & $invokeModuleMethod 'GetWindowsPowerShellPSHomeModulePath'
            $paths.WindowsSystem = $p
        }
    }

    return $paths
}