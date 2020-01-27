$location = "centralus"
$group = "functions"
$stgname = "funcsstg"
$funcappname = "laazfuncs1"
az group create -l $location -n $group 
az storage account create -n $stgname -g $group -l $location --sku Standard_LRS
az functionapp create `
  --consumption-plan-location $location `
  --name $funcappname `
  --os-type Windows `
  --resource-group $group `
  --runtime dotnet `
  --storage-account $stgname

func azure functionapp publish $funcappname
