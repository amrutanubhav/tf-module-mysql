# resource "null_resource" "mysql" {

#     depends_on = [
#       aws_db_instance.mysql
#     ]

#   provisioner "local-exec" {
#             command =  <<EOF
#             curl -s -L -o /tmp/mysql.zip "https://github.com/stans-robot-project/mysql/archive/main.zip"
#             cd /tmp
#             unzip mysql.zip
#             cd mysql-main
#             mysql -h aws_db_instance.mysql.address -u admin1 -p RoboShop1 < shipping.sql  
#             EOF
#   }
# }

resource "null_resource" "mysql-schema" {
  
  # This is how we can create depenency and ensure this will only run after the creation if the RDS Instance.
  depends_on = [aws_db_instance.mysql]

  provisioner "local-exec" {
        command = <<EOF
        cd /tmp 
        curl -s -L -o /tmp/mysql.zip "https://github.com/stans-robot-project/mysql/archive/main.zip"
        unzip -o mysql.zip 
        cd mysql-main 
        mysql -h ${aws_db_instance.mysql.address} -u${local.RDS_USER} -p${local.RDS_PASS} <shipping.sql
        EOF
  }  
}