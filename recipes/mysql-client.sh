if sunzi.installed mysql-client; then
  echo 'mysql-server already installed, skipping.'
else
  sunzi.install mysql-client
fi
