if apt-cache search '~i ^nginx$' | grep -q nginx; then
  echo 'nginx already installed, skipping.'
else
  apt-get -y install nginx  
  mv files/nginx.conf /etc/nginx/sites-available/<%= @attributes.app_name %>
  ln -s /etc/nginx/sites-available/<%= @attributes.app_name %> /etc/nginx/sites-enabled/<%= @attributes.app_name %>
  service nginx restart
fi
