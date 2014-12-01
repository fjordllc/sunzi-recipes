if aptitude search '~i ^nodejs$' | grep -q nodejs; then
  echo "nodejs already installed, skipping."
else
  apt-get -y install nodejs nodejs-legacy 
fi
