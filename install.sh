#!/bin/bash
set -e

source recipes/sunzi.sh
export DEBIAN_FRONTEND=noninteractive
source recipes/ssh.sh
source recipes/apt-jp.sh
source recipes/backports-wheezy.sh
apt-get update
apt-get -y upgrade
source recipes/locale-jp.sh
source recipes/ufw.sh
