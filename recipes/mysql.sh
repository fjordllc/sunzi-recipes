if sunzi.installed mysql-server; then
  echo 'mysql-server already installed, skipping.'
else
  sunzi.install mariadb-server mariadb-client libmariadb-dev
  mysqladmin -uroot create <%= @vars.mysql_database %>
  mysql -uroot -e "grant all on <%= @vars.mysql_database %>.* to <%= @vars.mysql_user %> identified by '<%= @vars.mysql_password %>';"
  mysql -uroot -e "set password for root@localhost=password('<%= @vars.mysql_password %>');"
  service mysql reload
fi
