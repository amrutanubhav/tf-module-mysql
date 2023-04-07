resource "null_resource" "mysql" {

    depends_on = [
      aws_db_instance.mysql
    ]

  provisioner "local-exec" {
    command =  <<EOF

    curl -s -L -o /tmp/mysql.zip "https://github.com/stans-robot-project/mysql/archive/main.zip"
    cd /tmp
    unzip mysql.zip
    cd mysql-main
    mysql -u admin1 -pRoboShop1 < shipping.sql

    EOF
  }
}