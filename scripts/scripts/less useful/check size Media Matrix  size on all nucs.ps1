
$dsp = Get-Content C:\TTG\scripts\dsp.txt

foreach ($d in $dsp)
{
Write-Host $d 

gci \\$d\TTG\mediaMATRIX | Measure-Object -Property length -sum | select -Property sum

}