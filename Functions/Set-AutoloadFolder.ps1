function Get-AutoloadFolder
{
    [CmdletBinding()]
    param ()

    if (-not $Script:AutoloadFolder)
    {
        $Script:AutoloadFolder = [Environment]::GetEnvironmentVariable('PSPruneAutoloadModulePath', 'User')

        if (-not $Script:AutoloadFolder)
        {
            Write-Error "The autoload folder has not been set. Use 'Set-AutoloadFolder'." -ErrorAction Stop
        }
    }

    return $Script:AutoloadFolder
}