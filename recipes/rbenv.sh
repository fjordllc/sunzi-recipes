if [ -d /usr/local/rbenv ]; then
  echo 'rbenv already installed, skipping.'
else
  # install packages necessary to install ruby
  sunzi.mute 'apt-get -y install libc6-dev'
  sunzi.mute 'apt-get -y install automake'
  sunzi.mute 'apt-get -y install libtool'

  # https://github.com/sstephenson/ruby-build/issues/119
  # "It seems your ruby installation is missing psych (for YAML
  # output). To eliminate this warning, please install libyaml and
  # reinstall your ruby."
  sunzi.mute 'apt-get -y install libyaml-dev'

  # needed to unpack rubygems
  sunzi.mute 'apt-get -y install zlib1g'
  sunzi.mute 'apt-get -y install zlib1g-dev'

  # openssl support for ruby
  sunzi.mute 'apt-get -y install openssl'
  sunzi.mute 'apt-get -y install libssl-dev'

  # readline for irb and rails console
  sunzi.mute 'apt-get -y install libreadline-dev'

  # for ruby stdlib rexml and nokogiri
  # http://nokogiri.org/tutorials/installing_nokogiri.html
  sunzi.mute 'apt-get -y install libxml2-dev'
  sunzi.mute 'apt-get -y install libxslt1-dev'

  # better irb support
  sunzi.mute 'apt-get -y install ncurses-dev'

  # for searching packages
  sunzi.mute 'apt-get -y install pkg-config'

  sunzi.mute 'apt-get -y install libffi-dev'

  # install rbenv and ruby-build
  git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv
  git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build

  cat <<EOF > /etc/profile.d/rbenv.sh
export RBENV_ROOT="/usr/local/rbenv"
export PATH="/usr/local/rbenv/bin:$PATH"
eval "\$(rbenv init -)"
EOF

  # make rbenv available
  source /etc/profile.d/rbenv.sh

  echo "Compiling Ruby. Grab some hot chocolate, this will take a while..."
  MAKE_OPTS="-j 4" rbenv install $1 -v
  rbenv global $1
  gem update --system
  gem install bundler:1.17.2 --no-document
fi
