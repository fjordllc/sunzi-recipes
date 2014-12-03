if sunzi.installed imagemagick; then
  echo 'imagemagick already installed, skipping.'
else
  apt-get -y install imagemagick
fi
