# PSCustomObject Notes

$myObject = [PSCustomObject]@{
    Name = 'Iceman'
    Language = 'PowerShell'
    Location = 'Local'
}

# save object to json
$Path = '.\myobject.json'
$myObject | ConvertTo-Json -depth 1 | Set-Content -Path $Path
# load object from json
$myObject = Get-Content -Path $Path | ConvertFrom-Json

# add properties
$myObject | Add-Member -MemberType NoteProperty -Name 'ID' -Value 'KevinMarquette'
$myObject.ID
# remove properties
$myObject.psobject.properties.remove('ID')
# dynamically accessing properties
$myObject.Name
# or
$myObject.'Name'
# or
$property = 'Name'
$myObject.$property
