

$viscin1= Get-Content "C:\copydll\viscin1.txt"

$domainuser = 'domain\dga'
$domainpassword = 'Kochamplacki1' | ConvertTo-SecureString -AsPlainText -Force
$domaincredentials = New-Object System.Management.Automation.PSCredential ($domainuser, $domainpassword)

foreach
($v in $viscin1)
{

Invoke-Command -ComputerName $v -Credential $domaincredentials -ScriptBlock {
write-host ("Entering $v") -BackgroundColor green;

regedit /s "G:\VISTA\PaymentsModule\visCommIdeaWebV2_32bit Gdrive Codebase.reg" -recurse -force;
regedit /s "G:\VISTA\PaymentsModule\visCommIdeaWebV2_64bit Gdrive Codebase.reg" -recurse -force;

write-host ("exiting $v") -ForegroundColor green;
}
}




{

Enter-PSSession $v

write-host ("Entering $v") -BackgroundColor green;

regedit /s "G:\VISTA\PaymentsModule\visCommIdeaWebV2_32bit Gdrive Codebase.reg" -recurse -force;

regedit /s "G:\VISTA\PaymentsModule\visCommIdeaWebV2_64bit Gdrive Codebase.reg" -recurse -force;

write-host ("exiting $v") -BackgroundColor green;

Exit-PSSession

}





$domainuser = 'domain\dga'
$domainpassword = 'Kochamplacki1' | ConvertTo-SecureString -AsPlainText -Force
$domaincredentials = New-Object System.Management.Automation.PSCredential ($domainuser, $domainpassword)

Invoke-Command -ComputerName ucnecp-viscin1 -Credential $domaincredentials -ScriptBlock {
regedit /s "G:\VISTA\PaymentsModule\visCommIdeaWebV2_32bit Gdrive Codebase.reg" -recurse -force;
}



