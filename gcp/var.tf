# pour GCP

variable "region" {
    description = "Region voulue"
    type        = string    
}

variable "zone" {
    description = "Zone voulue"
    type        = string  
}

variable "project"{
    description = "nom du project"
    type = string
}
variable "credentials" {
    description = "emplacement du fichier json generer par google cloud pour le compte de service"
    type = string
}