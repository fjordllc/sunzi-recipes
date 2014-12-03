if sunzi.installed ufw; then
  echo 'ufw already installed, skipping.'
else
  sunzi.install ufw
fi
