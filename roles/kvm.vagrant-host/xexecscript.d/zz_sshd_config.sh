#!/bin/bash
#
# requires:
#  bash
#
set -e

while read param value; do
  config_sshd_config ${chroot_dir}/etc/ssh/sshd_config ${param} ${value}
done < <(cat <<-EOS | egrep -v '^#|^$'
	# 11: Use Public Key Based Authentication
	PasswordAuthentication yes
	EOS
	)
