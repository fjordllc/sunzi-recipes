if sunzi.installed mysql-client; then
  echo 'mysql-server already installed, skipping.'
else
  sunzi.install mariadb-client libmariadb-dev
fi
