if apt-cache search '~i ^mysql-client$' | grep -q mysql-client; then
  echo 'mysql-server already installed, skipping.'
else
  apt-get -y install mysql-client  
fi
