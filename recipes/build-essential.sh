if sunzi.installed build-essential; then
  echo 'build-essential already installed, skipping.'
else
  sunzi.install build-essential
fi
