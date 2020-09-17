if sunzi.installed certbot; then
  echo "certbot already installed, skipping."
else
  sunzi.install certbot python-certbot-nginx
fi
