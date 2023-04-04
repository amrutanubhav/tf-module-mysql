#this block provisions rds

resource "aws_db_instance" "mysql" {
  allocated_storage    = 10
  identifier           = "roboshop-${var.ENV}-mysql"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "admin1"
  password             = "RoboShop1"
  parameter_group_name = aws_db_parameter_group.mysql.name
  db_subnet_group_name = aws_db_subnet_group.mysql.name
  vpc_security_group_ids = [aws_security_group.allow_mysql.id]
  skip_final_snapshot  = true
}

# creates a parameter group
resource "aws_db_parameter_group" "mysql" {
  name   = "roboshop-${var.ENV}-mysql-pg"
  family = "mysql5.7"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
}

# creates a subnet group
resource "aws_db_subnet_group" "mysql" {
  name       = "roboshop-${var.ENV}-rds-pg"
  subnet_ids = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_IDS

  tags = {
    Name = "roboshop-${var.ENV}-mysql-subnet-grp"
  }
}

# resource "aws_docdb_cluster" "docdb" {
#   cluster_identifier      = "roboshop-${var.ENV}-docdb"
#   engine                  = "docdb"
#   master_username         = "admin1"
#   master_password         = "roboshop1"
#   db_subnet_group_name    = aws_docdb_subnet_group.docdb.name
#   vpc_security_group_ids  = [aws_security_group.allow_mongodb.id]
# #   backup_retention_period = 5
# #   preferred_backup_window = "07:00-09:00"  #uncheck all 3 in production
# skip_final_snapshot     = true
# }

# #creates subnet group
# resource "aws_docdb_subnet_group" "docdb" {
#   name       = "roboshop-${var.ENV}-docdb-subnet-grp"
#   subnet_ids = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_IDS

#   tags = {
#     Name = "roboshop-${var.ENV}-docdb-subnet-grp"
#   }
# }

# #create cluster instances
# resource "aws_docdb_cluster_instance" "cluster_instances" {
#   count              = 1
#   identifier         = "roboshop-${var.ENV}-docdb-nodes"
#   cluster_identifier = aws_docdb_cluster.docdb.id
#   instance_class     = "db.t3.medium"
# }

# # our app is not designed to work with doc db
# # catalogue and cart is not designed to talk to mongodb with creds