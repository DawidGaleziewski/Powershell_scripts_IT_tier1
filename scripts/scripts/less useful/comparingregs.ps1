get-service | Select-Object -Property name , status
gci hkcu: |Where-Object -Property name -Like *SOFTWARE* | select -Property name  |ForEach-Object {Write-Host ("Done $_")} 

 gci hkcu: | select -Property name |where -Property name -Like *test 

regedit C:\test.reg







######compare regedit

#selection by name
 $Model= gci HKCU:\  -Recurse| ? -Property name -like  *test* 

## changable testing path
$test = gci HKCU:\testA -Recurse 

## non changable
$compare= Compare-Object -ReferenceObject $Model -DifferenceObject $test
if ($compare.sideindicator -contains "=>" -or $compare.sideindicator -contains "<=" )

{Write-Host ("Wrong Regedit") -BackgroundColor red}

else
{Write-Host ("All fine here") -BackgroundColor green;
$AlertReg += " $v"
}




#selection by name
 $Model= gci HKCU:\  -Recurse| ? -Property name -like  *test* 



 
###variables
##to files
$path1= "\\$v\"
##Files to check
$file1=""
$file2=""
$file3=""

 ####### check path
$C= Get-ChildItem $path
if ($C.name -contains $file1 -and $C.name -contains $file2 -and $C.name -contains $file3 )
{Write-Host ("Spoko") -BackgroundColor Green}
elseif ($C.name -notcontains "Nowy Folder1")
{Write-Host ("Brak") -BackgroundColor RED;
$alertfile += "  $v"
}



Write-Host ("Brak w regedit  $AlertReg") -BackgroundColor RED;
Write-Host ("Brak pliku  $alerfile") -BackgroundColor RED;


Clear-Variable AlertReg
Clear-Variable alerfile