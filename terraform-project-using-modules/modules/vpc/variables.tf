variable "cidr"{
	description="The main CIDR block for network"
	type=string
	default="15.0.0.0/16"
}
variable "cidr_public_subnet"{
        description="The main CIDR block for Public subnet"
        type=string
        default="15.1.0.0/16"
}
variable "cidr_private_subnet"{
        description="The main CIDR block for Private subnet"
        type=string
        default="15.2.0.0/16"
}
