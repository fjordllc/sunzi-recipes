if sunzi.installed nginx; then
  echo 'nginx already installed, skipping.'
else
  sunzi.install nginx
  mv files/nginx.conf /etc/nginx/sites-available/<%= @vars.app_name %>
  ln -s /etc/nginx/sites-available/<%= @vars.app_name %> /etc/nginx/sites-enabled/<%= @vars.app_name %>
  rm /etc/nginx/sites-enabled/default
  service nginx restart
fi
