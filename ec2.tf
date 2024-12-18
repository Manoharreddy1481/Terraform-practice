resource "aws_security_group" "allow_ssh_terraform" {
    name="allow_ssh_terraform"
    description = "created this sg from terraform script"

    egress {
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    ingress {
        from_port = "22"
        to_port = "22"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]

    }
    tags = {
      Name="Allow_ssh"
    }
}
resource "aws_instance" "expense" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

    tags = {
      Name="Terraform"
    }
  
}