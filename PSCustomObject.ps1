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


# convert PSCUstomObject into a hashtable
$hashtable = @{}
foreach( $property in $myobject.psobject.properties.name )
{
    $hashtable[$property] = $myObject.$property
}

# testing for properties
if( $null -ne $myObject.ID )
# if value could be $null check if it exists instead
if( $myobject.psobject.properties.match('ID').Count )


# Adding object methods
$ScriptBlock = {
    $hashtable = @{}
    foreach( $property in $this.psobject.properties.name )
    {
        $hashtable[$property] = $this.$property
    }
    return $hashtable
}

$memberParam = @{
    MemberType = "ScriptMethod"
    InputObject = $myobject
    Name = "ToHashtable"
    Value = $scriptBlock
}
Add-Member @memberParam

$myObject.ToHashtable()