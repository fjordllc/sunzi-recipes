apt-get -y install mysql-client

# configure ufw
if ufw status | grep -q 'Status: active'; then
  echo "ufw already configured, skipping."
else
  ufw allow ssh #to make sure ssh connection is not dropped
  ufw --force enable
  ufw allow ssh
  ufw allow http
  #ufw allow https
fi

source recipes/nginx.sh
source recipes/git.sh
source recipes/nodejs.sh
source recipes/imagemagick.sh
source recipes/rbenv.sh <%= @attributes.ruby_version %>
