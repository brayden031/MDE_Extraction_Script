# MDE live response powershell script to safely extract files in a zipped & encrypted format
# NOTE: This script assumes 7-Zip is installed on the endpoint and located in the path - C:\Program Files\7-Zip\7z.exe 
# Created by Brayden

# --------------------------------------- #

# Arguements passed when running the script
param (
    [string]$FilePath,
    [string]$Password
)

# Creation of the temporary directory to store the zipped copy
$TempDir = New-Item -ItemType Directory -Path "$env:TEMP\ZipTemp" -Force

# Extracts the file name from the provided file path
$FileName = Split-Path $FilePath -Leaf

# Construct the output path for the zipped file
$ZipFilePath = Join-Path -Path $TempDir.FullName -ChildPath "$FileName.zip"

# Uses 7-zip for compressing and encrypting the file
$SevenZipPath = "C:\Program Files\7-Zip\7z.exe"
$SevenZipArgs = @("a", "-tzip", "-p$Password", "`"$ZipFilePath`"", "`"$FilePath`"")
& $SevenZipPath $SevenZipArgs

# Error checking
if (-not (Test-Path $ZipFilePath)) {
    Write-Host "Failed to create the zip file."
    exit
}

# Output terminal message to indicate script successfully executed
Write-Host "Zipped file created successfully at: $ZipFilePath"
Write-Host "To extract the zipped and encrypted file use: getfile $ZipFilePath"

exit