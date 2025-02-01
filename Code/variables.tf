variable "vpc_cidr"{
    type = string
    description = "Public VPC CIDR values"
    default = "10.0.0.0/16"
}

variable "cidr_public_subnet"{
    type = string
    description = "Public subnet CIDR values"
    default = "10.0.0.0/24"
}

variable "cidr_private_subnet"{
    type = string
    description = "Private subnet CIDR values"
    default = "10.0.1.0/24"
}

variable "us_az"{
    type = list(string)
    description = "Availability Zones"
    default = ["us-east-1a","us-east-1b"]
}
