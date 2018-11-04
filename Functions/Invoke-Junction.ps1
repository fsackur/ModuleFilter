function Invoke-Junction
{
    [CmdletBinding()]
    param
    (
        $Junction,
        $ModuleBase
    )

    $Header = (
        "Junction v1.06 - Windows junction creator and reparse point viewer",
        "Copyright (C) 2000-2010 Mark Russinovich",
        "Sysinternals - www.sysinternals.com"
    ) -join [Environment]::NewLine
  

    $SuccessPattern = "Created: .*\r\nTargetted at: .*"


    $Result = & (Get-JunctionFilePath) $Junction $ModuleBase | Out-String

    $Message = $Result -replace [regex]::Escape($Header)
    $Message = $Message.Trim()

    if ($Result -match $SuccessPattern)
    {
        Write-Verbose $Message
    }
    else
    {
        Write-Error $Message
    }
}