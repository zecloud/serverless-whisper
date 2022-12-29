az group create --name whisper --location westeurope
az storage account create \
  --name whisper \
  --resource-group whisper \
  --location westeurope \
  --sku Standard_LRS \
  --kind StorageV2
az container create --resource-group whisper --file aci.yml