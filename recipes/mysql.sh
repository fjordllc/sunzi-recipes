if apt-cache search '~i ^mysql-server$' | grep -q mysql-server; then
  echo 'mysql-server already installed, skipping.'
else
  apt-get -y install mysql-server mysql-client 
  mysqladmin -uroot create <%= @attributes.mysql_database %>
  mysql -uroot -e "grant all on <%= @attributes.mysql_database %>.* to <%= @attributes.mysql_user %> identified by '<%= @attributes.mysql_password %>';"
  mysql -uroot -e "set password for root@localhost=password('<%= @attributes.mysql_password %>');"
  service mysql reload
fi
