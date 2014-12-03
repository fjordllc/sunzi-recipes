if [ -d /root/.ssh/authorized_keys ]; then
  echo "ssh already created skipping"
else
  if [ ! -d /root/.ssh ]; then
    mkdir /root/.ssh
  fi
  mv files/deploy_key /root/.ssh/authorized_keys
  chown -R root:root /root/.ssh
  chmod 400 /root/.ssh/authorized_keys
  sed -i 's/.*PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
  service ssh reload
fi
