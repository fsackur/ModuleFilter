
$Properties = "Name", "ID", "Description", "Memory"



$CheckBoxCol = New-Object System.Windows.Forms.DataGridViewCheckBoxColumn
#$Col1 = New-Object System.Windows.Forms.DataGridViewTextBoxColumn
$OkButton = New-Object System.Windows.Forms.Button
$CancelButton = New-Object System.Windows.Forms.Button


$Form = New-Object System.Windows.Forms.Form
$Form.Size = New-Object System.Drawing.Size(900,720)
$Dgv = New-Object System.Windows.Forms.DataGridView
$Dgv.Size = New-Object System.Drawing.Size(900,720)

$Form.Controls.Add($Dgv)
$Dgv.ColumnCount = $Properties.Count
$Dgv.ColumnHeadersVisible = $true

<#
$Dgv.Anchor = (
[System.Windows.Forms.AnchorStyles]::Top -bor
[System.Windows.Forms.AnchorStyles]::Left -bor
[System.Windows.Forms.AnchorStyles]::Bottom -bor
[System.Windows.Forms.AnchorStyles]::Right
)
#>


$Dgv.Dock = [System.Windows.Forms.DockStyle]::Fill










for ($i = 0; $i -lt $Properties.Length; $i++)
{
    $Dgv.Columns[$i].Name = $Properties[$i]
}

$Rows = get-process | select -First 50

foreach ($Row in $Rows)
{    
    $null = $Dgv.Rows.Add(
    $(
        for ($i = 0; $i -lt $Properties.Length; $i++)
        {
            $row.$($Properties[$i])
        }
    ))
}
$Form.ShowDialog()