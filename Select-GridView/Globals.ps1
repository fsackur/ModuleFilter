#--------------------------------------------
# Declare Global Variables and Functions here
#--------------------------------------------


#Sample function that provides the location of the script
function Get-ScriptDirectory
{
<#
	.SYNOPSIS
		Get-ScriptDirectory returns the proper location of the script.

	.OUTPUTS
		System.String
	
	.NOTES
		Returns the correct path within a packaged executable.
#>
	[OutputType([string])]
	param ()
	if ($null -ne $hostinvocation)
	{
		Split-Path $hostinvocation.MyCommand.path
	}
	else
	{
		Split-Path $script:MyInvocation.MyCommand.Path
	}
}

#Sample variable that provides the location of the script
[string]$ScriptDirectory = Get-ScriptDirectory


#Base directory of the Prune project
$ModuleBase = Split-Path (Get-ScriptDirectory)
Import-Module (Join-Path $ModuleBase 'Prune.psd1') -ArgumentList $true	#SkipEnvironmentChange


#Just to have something to test
Import-Module 'C:\windows\system32\WindowsPowerShell\v1.0\Modules\ISE\ISE.psm1' -ea ignore
Import-Module 'C:\windows\system32\WindowsPowerShell\v1.0\Modules\Microsoft.PowerShell.Management\Microsoft.PowerShell.Management.psd1' -ea ignore
Import-Module 'C:\windows\system32\WindowsPowerShell\v1.0\Modules\Microsoft.PowerShell.Security\Microsoft.PowerShell.Security.psd1' -ea ignore
Import-Module 'C:\windows\system32\WindowsPowerShell\v1.0\Modules\Microsoft.PowerShell.Utility\Microsoft.PowerShell.Utility.psd1' -ea ignore
Import-Module 'C:\windows\system32\WindowsPowerShell\v1.0\Modules\Microsoft.WSMan.Management\Microsoft.WSMan.Management.psd1' -ea ignore
Import-Module 'C:\windows\system32\WindowsPowerShell\v1.0\Modules\NetAdapter\NetAdapter.psd1' -ea ignore
Import-Module 'C:\windows\system32\WindowsPowerShell\v1.0\Modules\NetConnection\NetConnection.psd1' -ea ignore
Import-Module 'C:\Users\mich8638\Documents\WindowsPowerShell\Modules\XmlRpc\1.0.1.1\XmlRpc.psm1' -ea ignore
