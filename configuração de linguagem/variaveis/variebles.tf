# Variáveis do Terraform
variable "teste" {
  type = bool # string / número / bool / list() / map() / object() / tuple() / set() 
  default = true # Valor padrão
  description = "Variável de teste" # Informação adicional sobre a variável
}

# Variáveis Locais
locals {
    ami = "ami-0c55b159cbfafe1f0"
    type = "t2.micro"
    tags = {
        Name = "Terraform-EC2"
        Environment = "Dev"
    }
    subnet = "subnet-0bb1c79de3EXAMPLE"
    nic = aws_network_interface.example.id
}

resource "aws_instance" "example" {
    ami           = local.ami
    instance_type = local.type
    tags          = local.tags
    network_interface {
        network_interface_id = local.nic
        device_index = 0
    }
}

# Variáveis de entrada

variable "instance_type"{
    type = string                           # Tipo da variável
    default = "t2.micro"                    # Valor padrão
    description = "Tipo da instância EC2"   # Informação adicional sobre a variável
    validation {
        condition = contains(["t2.micro", "t2.small", "t2.medium"], var.instance_type)
        error_message = "O tipo de instância deve ser t2.micro, t2.small ou t2.medium."
    }                                       # Realiza a validação tendo como base a lista de tipos de instância colocados no contains()
    sensitive = false                       # Se for true, a variável não será exibida no output do Terraform
}

variable "Teste" {
    type = string
    default = <<EOT
    Este é um teste de variável do Terraform.
    Olá Pessoal, tudo bem? Espero que sim!
    EOT
}

variable "list" {
    type = list(list(string))                     # Tipo da variável
    default = [["Lista 1"], ["Lista 1, Lista 2"], ["Lista 3, Lista 4"]]   # Valor padrão
    description = "Lista de itens"           # Informação adicional sobre a variável
}

## Tuplas
### Diferente de uma lista, uma tupla tem um tamanho fixo
### É possivel ter varios tipos de dados em uma tupla, diferente de uma lista que só pode ter um tipo de dado
### Os valores possuem ordem

variable "Tupla"{
    type = tuple([string, number, bool, list(string)])          # Tipo da variável
    default = ["Tupla 1", 2, true, ["Item 1", "Item 2"]]        # Valor padrão
    description = "Tupla de itens"                              # Informação adicional sobre a variável
}

## Set
### Diferente de uma lista, não permite valores duplicados

variable "set" {
    type = set(string)                      # Tipo da variável
    default = ["Item 1", "Item 2", "Item 3"]   # Valor padrão
    description = "Set de itens"           # Informação adicional sobre a variável
}

## Mapas
### Diferente de uma lista, um mapa tem chave e valor
### Uma estrura parecido com HashMap do Java, ou dicionário do Python

variable "map" {
    type = map(string)                      # Tipo da variável
    default = {                             # Valor padrão
        Name = "Terraform-EC2"
        Environment = "Dev"
    }
    description = "Tags para a instância EC2" # Informação adicional sobre a variável
}

variable "map-list" {
    type = map(any)                      # Tipo da variável
    default = { 
        12 = "Valor 12"  
        "Valor 13" = 13                          # Valor padrão
    }
}

## Objetos

variable "object-Aluno" {
    type = object({
        nome = string
        idade = number
        notas = list(number)
        enabled = bool
    })
    default = {
        nome = "João"
        idade = 30
        notas = [8.5, 9.0, 7.5]
        enabled = true
    }
}

## Map - Object juntos

variable "map-object" {
    description = "Map com Object" # Informação adicional sobre a variável
    type = map(object({
        nome = string
        endereco_rede = string
        mascara = string
    }))
    default = {
        "subnet-1" = {
            nome = "subnet-1"
            endereco_rede = "10.10.1.0/24"
            mascara = "255.255.255.0"
        }
        "subnet-2" = {
            nome = "subnet-2"
            endereco_rede = "10.10.1.1/24"
            mascara = "255.255.255.0"
        }
        "subnet-3" = {
            nome = "subnet-3"
            endereco_rede = "10.10.1.2/32"
            mascara = "255.255.255.225"
        }  
    }
}

# Variáveis de saída

output "instance_id" {
    value = aws_instance.example.id
    description = "ID da instância EC2 criada"
    sensitive = false
}

# Variaveis de ambiente

## Precedência de variáveis de ambiente sobre variáveis definidas no arquivo .tfvars, que por sua vez tem precedência sobre variáveis definidas no arquivo .tf

# Variáveis de ambiente podem ser definidas de 3 formas: por meio da opção -var, por meio de variáveis de ambiente do sistema e pelo arquivo de definição de variáveis .tfvars

variable "random_length" {
  default = 16
}

variable "random_separator" {
  default = "-"
}

resource "random_pet" "olá" {
  length = var.random_length
  separator = var.random_separator
}