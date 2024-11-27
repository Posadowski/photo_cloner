# PowerShell Photo Cloner 

## Overview
A PowerShell script for batch cloning JPG images by capturing full-screen screenshots.

## Features
- Searches current directory for JPG files
- Opens each image in default viewer
- Captures full-screen screenshots
- Saves screenshots to desktop in "cloned_photos" directory

## Requirements
- Windows operating system
- PowerShell
- Execution policy allowing script run

## Usage
1. Place script in folder with JPG images
2. Run PowerShell as administrator
3. Set execution policy: `Set-ExecutionPolicy RemoteSigned`
4. Execute script: `.\photo_cloner.ps1`

## Notes
- Each original image is screenshot in full screen
- Screenshots saved with "cloned_" prefix
- Creates "cloned_photos" on desktop

## Troubleshooting
- Ensure script has .ps1 extension
- Check PowerShell execution policy
- Close other applications during script run

## License
MIT License
