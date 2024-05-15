# MDE_Extraction_Script

## MDE Live response file extraction script

## Description

- Powershell script to safely extract potentially malicious files from an endpoint by combining 7-Zip and MDE's live response getfile feature. 
- This script combats the issues faced by using the 'getfile' feature which directly downloads potentially malicious files by using a safer approach of creating a zipped & password protected version before using 'getfile' to retrieve.

## Setup

1. Download powershell script
2. Upload to live response library within MDE
3. Check file has been uploaded by running the command 'library' in a live response session

## Usage

1. Initiate live response session with the device
2. Enter the command - run mde_zip_encrypt.ps1 -parameters "-FilePath 'FILE PATH' -Password 'ENTER PASSWORD'"    # Example command: run mde_zip_encrypt.ps1 -parameters "-FilePath 'C:\Users\Bray\Documents\test.txt' -Password '123'"
3. This will then run the powershell script to create a temp directory, use 7-Zip to zip and encrypt, output zipped file to temp directory.
4. Once the script has finished executing it will then output at the very end a line stating use the command - getfile "FILE PATH" 
5. This will then extract the zipped copy to your device which can then be uploaded to a malware analysis sandbox/opened with the password you set

## Prerequisite

- This script assumes 7-Zip is installed on the endpoint and located in the path - C:\Program Files\7-Zip\7z.exe for this to work.

Created by Brayden.
