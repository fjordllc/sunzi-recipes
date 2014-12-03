if grep -q shared /etc/logrotate.conf; then
  echo 'logrotate already configured, skipping.'
else
  cat files/logrotate.conf >> /etc/logrotate.conf
fi
