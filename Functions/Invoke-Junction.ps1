function Invoke-Junction
{
    [CmdletBinding()]
    param
    (
        $Junction,
        $ModuleBase
    )

    $Result = & (Get-JunctionFilePath) $Junction $ModuleBase
}