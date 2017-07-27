# Originally written by Andrew Macy
# https://community.tableau.com/message/646689
# Tweaked by Luke Brady, Cerner Corporation, July 27th, 2017
# Added paging capability as well as user prompting user for details rather than hard coding
# Tested against Tableau Server 10.3.1 run from Windows 7 locally
#
# How to use:
# 1) Open Powershell
# 2) Change to directory this file is located
# 3) Enter this command:
#    .\get_Tableau_Publishers.ps1 | Out-File Tableau_User_Roles.csv
# 4) When prompted enter your Tableau Server Address, Username, Password and Site
# 5) Open Tableau_User_Roles.csv with your favorite text editor and validate

# Prompt user for details to connect
$tabserver = Read-Host -prompt 'Enter your Domain (ie: https://your.tableau.domain)'
$usr = Read-Host -Prompt 'Username'
$pass = Read-Host -Prompt 'Password'
$siteshortname = Read-Host -prompt 'Site (Hit Enter for Default Site)'

# Powershell does not accept a goog non-value here so checking and reassigning
if ([string]::IsNullOrWhiteSpace($siteshortname)) {
    $siteshortname = ''
}

# Relative Path to use for connecting to API
$loginurl = '/api/2.3/auth/signin'

# Connect
[xml]$xml_loginpayload = '<tsRequest><credentials name="'+$usr+'" password="'+$pass+'" ><site contentUrl="'+$siteshortname+'" /></credentials></tsRequest>'

# login once to list sites
[xml]$x = invoke-WebRequest -Uri $tabserver/$loginurl -Method POST -ContentType "text/xml" -Body $xml_loginpayload
$token = $x.tsResponse.credentials.token
$siteid = $x.tsResponse.credentials.site.id
$sitelisturl = '/api/2.3/sites?pageSize=1000&pageNumber=1'
[xml]$sitelistresp = invoke-WebRequest -Uri $tabserver/$sitelisturl -Method GET -ContentType "text/xml" -Headers @{"X-Tableau-Auth"=$token}

ForEach ($row in $sitelistresp.tsResponse.sites.ChildNodes) {
    $siteshortname = $row.contentUrl
    [xml]$xml_loginpayload = '<tsRequest><credentials name="'+$usr+'" password="'+$pass+'" ><site contentUrl="'+$siteshortname+'" /></credentials></tsRequest>'
    
       # login to site to list users
       [xml]$x = invoke-WebRequest -Uri $tabserver/$loginurl -Method POST -ContentType "text/xml" -Body $xml_loginpayload
       $token = $x.tsResponse.credentials.token
       $siteid = $x.tsResponse.credentials.site.id
       
       # Need to get a total count of users...theres probably a better way to do this
       $ListUsersUrl = "/api/2.3/sites/$siteid/users?pageSize=1000&pageNumber=1&sort=name:asc"
       [xml]$SiteUsers = invoke-WebRequest -Uri $tabserver/$ListUsersUrl -Method GET -ContentType "text/xml" -Headers @{"X-Tableau-Auth"=$token}
       $TotCnt=$SiteUsers.tsResponse.pagination.totalAvailable
       
       # Get the number of users in Tableau Server
       [int]$intNum = [convert]::ToInt32($TotCnt, 10)
       
       # Get the number of Pages we will have to loop through
       $last_page = ([int]$intNum / 1000)
       
       # Header for Output file
       """Username"",""Role"""
       
       While ($next_page -le $last_page) {
       
       $next_page = $next_page + 1

       $ListUsersUrl = "/api/2.3/sites/$siteid/users?pageSize=1000&pageNumber=$next_page&sort=name:asc"
       [xml]$SiteUsers = invoke-WebRequest -Uri $tabserver/$ListUsersUrl -Method GET -ContentType "text/xml" -Headers @{"X-Tableau-Auth"=$token}
       $TotCnt=$SiteUsers.tsResponse.pagination.totalAvailable
       [array]$SiteUserLst = $SiteUsers.tsResponse.users.user
          $SiteUserLst | select name, siteRole | ConvertTo-CSV -NoTypeInformation | select -Skip 1
       }
}
# Signout
$signouturl = '/api/2.3/auth/signout'
[xml]$x = invoke-WebRequest -Uri $tabserver/$signouturl -Method POST -ContentType "text/xml" -Headers @{"X-Tableau-Auth"=$token}
