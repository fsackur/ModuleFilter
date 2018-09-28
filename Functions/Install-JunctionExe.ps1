function Install-JunctionExe
{
    [CmdletBinding()]
    param ()


    Invoke-WebRequest https://live.sysinternals.com/junction.exe -OutFile (Get-JunctionFilePath)
}