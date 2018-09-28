function Show-AutoloadFolder
{
    [CmdletBinding()]
    param ()

    Invoke-Item (Get-AutoloadFolder)
}