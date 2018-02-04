
$viscin1= Get-Content "C:\copydll\viscin1.txt"

$domainuser = 'domain\dga'
$domainpassword = 'Kochamplacki1' | ConvertTo-SecureString -AsPlainText -Force
$domaincredentials = New-Object System.Management.Automation.PSCredential ($domainuser, $domainpassword)

foreach
($v in $viscin1)
{
write-host ("Entering $v") -BackgroundColor green;

Invoke-Command -ComputerName $v -Credential $domaincredentials -ScriptBlock {



regedit  "G:\VISTA\PaymentsModule\visCommIdeaWebV2_32bit Gdrive Codebase.reg";


}
;

Invoke-Command -ComputerName $v -Credential $domaincredentials -ScriptBlock {



regedit "G:\VISTA\PaymentsModule\visCommIdeaWebV2_64bit Gdrive Codebase.reg";


}

}


New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT


###wortks

Invoke-Command -ComputerName ucabep-viscin1 -Credential $domaincredentials -ScriptBlock {
New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT;
Get-ChildItem  -path HKCR:\ |select-object name -like "*visCommIdeaWebV2*"
}


cls
