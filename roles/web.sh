source recipes/mysql-client.sh

# configure ufw
if ufw status | grep -q 'Status: active'; then
  echo "ufw already configured, skipping."
else
  ufw allow ssh #to make sure ssh connection is not dropped
  ufw --force enable
  ufw allow ssh
  ufw allow http
  ufw allow https
fi

source recipes/nginx.sh
source recipes/nodejs.sh
source recipes/imagemagick.sh
source recipes/build-essential.sh
source recipes/rbenv.sh <%= @vars.ruby_version %>
source recipes/certbot.sh
source recipes/cron.sh
