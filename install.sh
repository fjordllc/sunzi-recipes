#!/bin/bash

# Load base utility functions like sunzi.mute() and sunzi.install()
source recipes/sunzi.sh

# This line is necessary for automated provisioning for Debian/Ubuntu.
# Remove if you're not on Debian/Ubuntu.
export DEBIAN_FRONTEND=noninteractive

source recipes/ssh.sh
sunzi.mute "apt-get update"
sunzi.mute "apt-get -y upgrade"
source recipes/locale-jp.sh
source recipes/ufw.sh
source recipes/logrotate.sh

# Install packages
apt-get -y install git-core ntp curl

# Install sysstat, then configure if this is a new install.
if sunzi.install "sysstat"; then
  sed -i 's/ENABLED="false"/ENABLED="true"/' /etc/default/sysstat
  /etc/init.d/sysstat restart
fi
