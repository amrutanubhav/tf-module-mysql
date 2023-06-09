resource "aws_security_group" "allow_mysql" {
  name        = "roboshop-${var.ENV}-mysql-sg"
  description = "allow 3306 inbound traffic from intranet only"
  vpc_id      = data.terraform_remote_state.vpc.outputs.VPC_ID


  ingress {
    description      = "alow RDS from local network"
    from_port        = var.RDS_MYSQL_PORT
    to_port          = var.RDS_MYSQL_PORT
    protocol         = "tcp"
    cidr_blocks      = [data.terraform_remote_state.vpc.outputs.VPC_CIDR]
    
  }

  ingress {
    description      = "alow RDS from default vpc network"
    from_port        = var.RDS_MYSQL_PORT
    to_port          = var.RDS_MYSQL_PORT
    protocol         = "tcp"
    cidr_blocks      = [data.terraform_remote_state.vpc.outputs.DEFAULT_VPC_CIDR]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "roboshop-${var.ENV}-mysql-sg"
  }
}