# JPG photo cloning script in slide mode
$currentDir = Get-Location
$desktopPath = [Environment]::GetFolderPath("Desktop")
$cloneDir = Join-Path $desktopPath "cloned_photos"

if (!(Test-Path -Path $cloneDir)) {
    New-Item -ItemType Directory -Path $cloneDir | Out-Null
}

$jpgFiles = Get-ChildItem -Path $currentDir -Filter *.jpg

foreach ($file in $jpgFiles) {
    # Launch the photo in your default browser
    Start-Process $file.FullName
    
    Start-Sleep -Seconds 2
    
    # enter full screen mode
    [System.Windows.Forms.SendKeys]::SendWait("{F11}")
    Start-Sleep -Seconds 1
    
    # Screen Shoot
    $screenshotPath = Join-Path $cloneDir ("cloned_" + $file.Name + ".png")
    Add-Type -AssemblyName System.Windows.Forms
    $bounds = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
    $bitmap = New-Object System.Drawing.Bitmap($bounds.Width, $bounds.Height)
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.CopyFromScreen($bounds.X, $bounds.Y, 0, 0, $bounds.Size)
    $bitmap.Save($screenshotPath)
	
    # Close Window
    [System.Windows.Forms.SendKeys]::SendWait("{ESC}")
    Start-Sleep -Seconds 1    

    # Close file
    [System.Windows.Forms.SendKeys]::SendWait("%{F4}")
    Start-Sleep -Seconds 1
}

Write-Host "$($jpgFiles.Count) photos cloned"
