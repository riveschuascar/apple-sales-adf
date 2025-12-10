# Template de automatizacion infraestructura para ETL con ADF
## Modo de uso
1. crear archivo 'terraform.tfvars' en el directorio 'terraform'
```touch terraform/terraform.tfvars```
2. llenar el archivo 'terraform.tfvars' con el contenido de 'terraform.tfvars.template.txt' y completar los campos
```
# Azure Authentication Configuration
subscription_id = "qwerty12345" # ESTO ES UN EJEMPLO
client_id       = "67890uiop" # USA TUS CREDENCIALES DE AZURE CLI
```
3. inicializar terraform
* asegurate de estar en la carpeta donde este 'main.tf'
```cd terraform/```
* inicializa terraform
```terraform init```

4. empezar proceso de creacion
```terraform apply```