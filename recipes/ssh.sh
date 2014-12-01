if [ -d ~/.ssh/authorized_keys ]; then
  echo "ssh already created skipping"
else
  if [ ! -d ~/.ssh ]; then
    mkdir ~/.ssh 
  fi
  mv files/deploy_key ~/.ssh/authorized_keys
  chmod 400 ~/.ssh/authorized_keys

  sed -i 's/.*PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
  service ssh reload
fi
