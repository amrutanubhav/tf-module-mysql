variable "ENV" {}

# RDS
variable "RDS_MYSQL_PORT" {}
variable "RDS_MYSQL_STORAGE" {}
variable "RDS_MYSQL_ENGINE_VERSION" {}
variable "RDS_INSTANCE_TYPE" {}

# DocDB 
variable "DOCDB_PORT" {}
variable "DOCDB_INSTANCE_CLASS" {}
variable "DOCDB_INSTANCE_COUNT" {}

# Elastic Cache
variable "REDIS_PORT" {}
variable "REDIS_INSTANCE_NODETYPE" {}
variable "REDIS_INSTANCE_COUNT" {}
variable "REDIS_ENGINE_VERSION" {}

# RabbitMQ

# variable "RABBITMQ_PORT" {}