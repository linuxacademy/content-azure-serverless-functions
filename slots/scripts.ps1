$funcappname = "laazfuncs2"
$group = "functions"

az functionapp deployment slot create --name $funcappname -g $group
Invoke-WebRequest -Uri https://laazfuncs2.azurewebsites.net/api/myhttpfunction?code=QcbPXNmq0FWsW9wH5xTfFNJnB8ymUmLYZiGDjUKdhEJKNEWACTRcKQ==

az functionapp deployment slot create --name $funcappname -g $group --slot staging

# modify code
dotnet clean
dotnet build

func azure functionapp publish laazfuncs2 --slot staging 

Invoke-WebRequest -Uri https://laazfuncs2.azurewebsites.net/api/myhttpfunction?code=QcbPXNmq0FWsW9wH5xTfFNJnB8ymUmLYZiGDjUKdhEJKNEWACTRcKQ==
Invoke-WebRequest -Uri https://laazfuncs2-staging.azurewebsites.net/api/myhttpfunction?code=yg6yD1ezlgBfNKCrLdBHN2Ne9YnsU2RHdmX5zPBsjTdvSSXDNcpZqQ==

az functionapp deployment slot swap -g $group -n $funcappname --slot staging --target-slot production 

Invoke-WebRequest -Uri https://laazfuncs2.azurewebsites.net/api/myhttpfunction?code=QcbPXNmq0FWsW9wH5xTfFNJnB8ymUmLYZiGDjUKdhEJKNEWACTRcKQ==
Invoke-WebRequest -Uri https://laazfuncs2-staging.azurewebsites.net/api/myhttpfunction?code=yg6yD1ezlgBfNKCrLdBHN2Ne9YnsU2RHdmX5zPBsjTdvSSXDNcpZqQ==

az functionapp deployment slot swap -g $group -n $funcappname --slot staging --target-slot production 

Invoke-WebRequest -Uri https://laazfuncs2.azurewebsites.net/api/myhttpfunction?code=QcbPXNmq0FWsW9wH5xTfFNJnB8ymUmLYZiGDjUKdhEJKNEWACTRcKQ==
Invoke-WebRequest -Uri https://laazfuncs2-staging.azurewebsites.net/api/myhttpfunction?code=yg6yD1ezlgBfNKCrLdBHN2Ne9YnsU2RHdmX5zPBsjTdvSSXDNcpZqQ==

