vagrant-kvm-shelf-rhel6
=======================

[buildshelf-rhel6-setup](https://github.com/hansode/buildshelf-rhel6-setup) based buildshelf for Vagrant host on KVM

Requirements
------------

+ RHEL/CentOS/Scientific
+ [KVM](http://www.linux-kvm.org/page/Main_Page)
+ [Vagrant](http://www.vagrantup.com/)

Getting Started
---------------

Setup submodules.

```
$ make setup
```

Build VM image for Vagrant box.

```
$ cd roles/kvm.vagrant-host
$ make
```

Run VM.

```
$ sudo ./run.sh
```

Connect to serial-port.

```
$ telnet localhost 5099
```

Login to box.

+ user `centos`
+ pass `centos`

Links
-----

+ [buidbook-rhel6](https://github.com/hansode/buildbook-rhel6)
+ [vmbuider](https://github.com/hansode/vmbuilder)

License
-------

[Beerware](http://en.wikipedia.org/wiki/Beerware) license.

If we meet some day, and you think this stuff is worth it, you can buy me a beer in return.
