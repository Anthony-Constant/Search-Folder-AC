#---------------------------------------------------------------------------------------#
# Title:          Folder Search                                                         #
# Description:    Searches for Folders and sub folders. searches Hidden Folders         #
#                                                                                       #
# Author:         Anthony Constant                                                      #
#---------------------------------------------------------------------------------------#



Clear-Host

# clear terminal
cls

# Read user input
echo "Please ensure the folder path exists. `n"
$folderPath = Read-Host "Enter folder path to locate*"  # Store the user input in folderPath to locate. 

echo "`nPlease ensure the folder name exists. `n"
$folderName =  Read-Host "Enter folder name to locate*"    # Store the user input in folderName to locate. 

Write-Host "`nSearching for '$folderName' folder in '$folderPath' Directories and Subdirectories..." # show this message to the host. (the shorter the path with the folder to locate, the less time it takes.) 


# begin searching the specified target
$output = Get-ChildItem -Force $folderPath -recurse | # Use -Force to locate hidden folders. (from $folderName variable) 
Where-Object {$_.PSIsContainer -eq $true -and $_.Name -like $folderName} | 
Select-Object FullName, LastWriteTime, Name | Sort-Object FullName # Pull selected variables from the search criteria



# output the result inside PowerShell Interface
$count = ($output).Count ## store the count of the output

echo "`nFound $count results." # output the count result.



#$output | Out-GridView -Title "Folder Directory Search Results - Total Count: $count" # output the result in PS Gridview
echo $output # output the results in the PowerShell interface to copy the file path. (cannot copy from Gridview) 

Read-Host "`nPress Enter to continue"

Read-Host "`nPress Enter to continue"


