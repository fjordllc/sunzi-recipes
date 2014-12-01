# configure ufw
if ufw status | grep -q 'Status: active'; then
  echo "ufw already configured, skipping."
else
  ufw allow ssh #to make sure ssh connection is not dropped
  ufw --force enable
  ufw allow ssh
  ufw allow 3306
fi

source recipes/mysql.sh
