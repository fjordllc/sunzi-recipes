if ! grep -Fq "LC_ALL" /etc/environment; then
  export LC_ALL=ja_JP.UTF-8
  echo 'LC_ALL=ja_JP.UTF-8' > /etc/environment
  source /etc/environment
fi
