#!/bin/bash

curl -L get.rvm.io | bash -s stable


# Notes:
echo "Almost done, you now just need to"
echo "do the following steps:"
echo ""

# Be nice, reload with rvm scripts
echo "First login again or"
echo "source ~/.rvm/scripts/rvm"
echo ""

# Install Ruby Enterprise Edition
echo "Then install your favorite Ruby:"
echo "rvm install ree"

# Delete .bash_login as it
# conflicts with permissions
# set in .bashrc, which is
# preferred.
cat .bash_login >> .bashrc
rm .bash_login

###
#
# Examples
#
###

# Use an older gems version
#rvm rubygems 1.3.7

# Install a gem
#rvm default do gem install gem_name -v 0.1.2
