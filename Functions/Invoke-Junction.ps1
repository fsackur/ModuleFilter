function Invoke-Junction
{
    [CmdletBinding()]
    param
    (
        $Junction,
        $ModuleBase
    )

    & (Get-JunctionFilePath) $Junction $ModuleBase
}