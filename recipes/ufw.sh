# setup ufw
if aptitude search '~i ^ufw$' | grep -q ufw; then
  echo 'ufw already installed, skipping.'
else
  apt-get -y install ufw       
fi
