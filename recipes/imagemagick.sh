if apt-cache search '~i ^imagemagick$' | grep -q imagemagick; then
  echo 'imagemagick already installed, skipping.'
else
  apt-get -y install imagemagick  
fi
