if ! grep -Fq "LC_ALL" /etc/environment; then
  sed -i 's/.*ja_JP.UTF-8 UTF-8.*/ja_JP.UTF-8 UTF-8/' /etc/locale.gen
  locale-gen
  cat <<EOF > /etc/environment
LANG=ja_JP.UTF-8
LC_ALL=ja_JP.UTF-8
EOF
  source /etc/environment
fi



