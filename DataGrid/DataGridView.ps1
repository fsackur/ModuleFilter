#function New-DataGrid
& {
    <#
        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose()
            }
            base.Dispose(disposing)
        }
    #>

        $Form = New-Object System.Windows.Forms.Form

    $Dgv = New-Object System.Windows.Forms.DataGridView
    $CheckBoxCol = New-Object System.Windows.Forms.DataGridViewCheckBoxColumn
    $Column1 = New-Object System.Windows.Forms.DataGridViewTextBoxColumn

    $OkButton = New-Object System.Windows.Forms.Button
    $CancelButton = New-Object System.Windows.Forms.Button
    $LayoutPanel = New-Object System.Windows.Forms.TableLayoutPanel

    $Components = New-Object System.ComponentModel.Container

    #region Initialize components
            ([System.ComponentModel.ISupportInitialize]($Dgv)).BeginInit()
            $LayoutPanel.SuspendLayout()
            $Form.SuspendLayout()

            $Dgv.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
            $Dgv.Columns.AddRange((New-Object System.Windows.Forms.DataGridViewColumn[] {
            $CheckBoxCol,
            $Column1}))
            $LayoutPanel.SetColumnSpan($Dgv, 2)
            $Dgv.Dock = System.Windows.Forms.DockStyle.Fill
            $Dgv.Location = New-Object System.Drawing.Point(3, 3)
            $Dgv.Name = "Dgv"
            $Dgv.Size = New-Object System.Drawing.Size(574, 340)
            $Dgv.TabIndex = 0
            $Dgv.CellContentClick += New-Object System.Windows.Forms.DataGridViewCellEventHandler($Dgv_CellContentClick)

            $CheckBoxCol.HeaderText = "Column1"
            $CheckBoxCol.Name = "CheckBoxCol"

            $Column1.HeaderText = "Column1"
            $Column1.Name = "Column1"

            $CancelButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)))
            $CancelButton.Location = New-Object System.Drawing.Point(503, 349)
            $CancelButton.Name = "CancelButton"
            $CancelButton.Size = New-Object System.Drawing.Size(74, 22)
            $CancelButton.TabIndex = 2
            $CancelButton.Text = "Cancel"
            $CancelButton.UseVisualStyleBackColor = true

            $OkButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)))
            $OkButton.Location = New-Object System.Drawing.Point(422, 349)
            $OkButton.Name = "OkButton"
            $OkButton.Size = New-Object System.Drawing.Size(75, 22)
            $OkButton.TabIndex = 1
            $OkButton.Text = "OK"
            $OkButton.UseVisualStyleBackColor = true

            $LayoutPanel.ColumnCount = 2
            $LayoutPanel.ColumnStyles.Add((New-Object System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100)))
            $LayoutPanel.ColumnStyles.Add((New-Object System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 80)))
            $LayoutPanel.Controls.Add($Dgv, 0, 0)
            $LayoutPanel.Controls.Add($OkButton, 0, 1)
            $LayoutPanel.Controls.Add($CancelButton, 1, 1)
            $LayoutPanel.Dock = System.Windows.Forms.DockStyle.Fill
            $LayoutPanel.Location = New-Object System.Drawing.Point(0, 0)
            $LayoutPanel.Name = "LayoutPanel"
            $LayoutPanel.RowCount = 2
            $LayoutPanel.RowStyles.Add((New-Object System.Windows.Forms.RowStyle([System.Windows.Forms.SizeType]::Percent, 100)))
            $LayoutPanel.RowStyles.Add((New-Object System.Windows.Forms.RowStyle([System.Windows.Forms.SizeType]::Absolute, 28)))
            $LayoutPanel.Size = New-Object System.Drawing.Size(580, 374)
            $LayoutPanel.TabIndex = 3

            $AutoScaleDimensions = New-Object System.Drawing.SizeF(6, 13)
            $AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
            $ClientSize = New-Object System.Drawing.Size(580, 374)
            $Controls.Add($LayoutPanel)
            $MinimumSize = New-Object System.Drawing.Size(300, 400)
            $Name = "Form1"
            $Text = "Form1"
            $Load += New-Object System.EventHandler($Form1_Load)
            ([System.ComponentModel.ISupportInitialize]$Dgv).EndInit()
            $LayoutPanel.ResumeLayout($false)
            $Form.ResumeLayout($false)


        #endregion Initialize components
    }