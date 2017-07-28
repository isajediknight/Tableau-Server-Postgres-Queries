# ===== Authors ======================
# Originally written by Andrew Macy
# https://community.tableau.com/message/646689
# Tweaked by Luke Brady, Cerner Corporation
#
# ===== Change Log ===================
# July 27th, 2017
#   Added paging capability as well as user prompting user for details rather than hard coding
#
# July 28th, 2017
#   Fixed issue where users were only being pulled back for Default Site
#   Output file now includes Site
#   Password for user is now hidden when entered
#
# ===== Compatibility ===============
# Tested against Tableau Server 10.3.1 run from Windows 7 locally
#
# ===== How To Use ==================
# 1) Open Powershell
# 2) Change to directory this file is located
# 3) Enter this command:
#    .\get_Tableau_Publishers.ps1 | Out-File Tableau_User_Roles.csv
# 4) When prompted enter your Tableau Server Address, Username, Password
# 5) Open Tableau_User_Roles.csv with your favorite text editor and validate
#
# ===== Known Issues ================
# None
# If you find one, comment with it in this Git Repo or comment on this thread in Tableau Forums:
# https://community.tableau.com/thread/238244
#
# ===== Did this help you? ==========
# If you find this code useful please mark this reply as helpful on Tableau Communiy Forum:
# https://community.tableau.com/message/647650#647650
# 
# ===== Begin Main Code =============
# Prompt user for details to connect
$tabserver = Read-Host -prompt 'Enter your Domain (ie: https://your.tableau.domain)'
$usr = Read-Host -Prompt 'Username'
$pass = Read-Host -assecurestring 'Password'
$pass = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($Pass))

# No longer need to prompt for Site as this code will pull all users from all Sites
$siteshortname = ''

# Relative Path to use for connecting to API
# If you would like to use a newer API do a find and replace for example to 2.6 for all references
$loginurl = '/api/2.3/auth/signin'

# Connect
[xml]$xml_loginpayload = '<tsRequest><credentials name="'+$usr+'" password="'+$pass+'" ><site contentUrl="'+$siteshortname+'" /></credentials></tsRequest>'

# login once to list sites
[xml]$x = invoke-WebRequest -Uri $tabserver/$loginurl -Method POST -ContentType "text/xml" -Body $xml_loginpayload
$token = $x.tsResponse.credentials.token
$siteid = $x.tsResponse.credentials.site.id
$sitelisturl = '/api/2.3/sites?pageSize=1000&pageNumber=1'
[xml]$sitelistresp = invoke-WebRequest -Uri $tabserver/$sitelisturl -Method GET -ContentType "text/xml" -Headers @{"X-Tableau-Auth"=$token}

# Header for Output file
"""Username"",""Role"",""Site"""

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
       
       # Get the number of users in Tableau Server for this Site
       [int]$intNum = [convert]::ToInt32($TotCnt, 10)
       
       # Get the number of Pages we will have to loop through
       $last_page = ([int]$intNum / 1000)
       
       # Start at 0 inside the loop we increment immediately to start at 1 for Paging
       $next_page = 0
       
       # Get the current Site to output
       $current_site_name = $row.contentUrl

       # Checking and reassigning if we are on the Default Site
       if ([string]::IsNullOrWhiteSpace($current_site_name)) {
          $current_site_name = 'Default'
       }
       
       # Page through the results
       While ($next_page -le $last_page) {
       
          $next_page = $next_page + 1

          # Somewhere in the API documentation it only lets you pull down 1000 rows of data at a time
          $ListUsersUrl = "/api/2.3/sites/$siteid/users?pageSize=1000&pageNumber=$next_page&sort=name:asc"
          [xml]$SiteUsers = invoke-WebRequest -Uri $tabserver/$ListUsersUrl -Method GET -ContentType "text/xml" -Headers @{"X-Tableau-Auth"=$token}
          $TotCnt=$SiteUsers.tsResponse.pagination.totalAvailable
          [array]$SiteUserLst = $SiteUsers.tsResponse.users.user

          # Loop through each user from the current page 1000 results
          ForEach ($subrow in $SiteUserLst) {
              $row_user_name = $subrow | select name
              $row_site_role = $subrow | select siteRole
              """$($row_user_name.name)"",""$($row_site_role.siteRole),""$($current_site_name)"""
          }
      }
}
# Signout
$signouturl = '/api/2.3/auth/signout'
[xml]$x = invoke-WebRequest -Uri $tabserver/$signouturl -Method POST -ContentType "text/xml" -Headers @{"X-Tableau-Auth"=$token}
