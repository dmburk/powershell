# PSCustomObject Notes

$myObject = [PSCustomObject]@{
    Name = 'Iceman'
    Language = 'PowerShell'
    Location = 'Local'
}

$Path = '.\myobject.json'
$myObject | ConvertTo-Json -depth 1 | Set-Content -Path $Path
$myObject = Get-Content -Path $Path | ConvertFrom-Json