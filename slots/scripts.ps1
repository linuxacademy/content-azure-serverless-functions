az login

$funcappname = $(az functionapp list --query "name" -o tsv)
$funcappname

$group = "functions"

az functionapp deployment slot create --name $funcappname -g $group
az functionapp deployment slot create --name $funcappname -g $group --slot staging

# modify code (A)
dotnet clean
dotnet build

func azure functionapp publish $funcappname

# modify code (B)
dotnet clean
dotnet build

func azure functionapp publish $funcappname --slot staging 

# swap B into prod, A into staging
az functionapp deployment slot swap -g $group -n $funcappname --slot staging --target-slot production 

# swap B into staging, A into prod
az functionapp deployment slot swap -g $group -n $funcappname --slot staging --target-slot production 
