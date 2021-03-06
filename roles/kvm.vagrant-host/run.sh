#!/bin/sh -e
#execute kvm command
#
name=vagrant-host
cpu_type=host
brname=vboxbr0
mem_size=$((1024 * 3))
cpu_num=2
vnc_addr=127.0.0.1
vnc_port=1098
monitor_addr=127.0.0.1
monitor_port=4098
serial_addr=127.0.0.1
serial_port=5098
drive_type=virtio
nic_driver=virtio-net-pci
pidfile=kvm.pid
rtc="base=utc"
#
/usr/libexec/qemu-kvm -name ${name} -cpu ${cpu_type} -m ${mem_size} -smp ${cpu_num} -vnc ${vnc_addr}:${vnc_port} -k en-us -rtc ${rtc} -monitor telnet:127.0.0.1:${monitor_port},server,nowait -serial telnet:${serial_addr}:${serial_port},server,nowait -drive file=box-disk1.raw,media=disk,boot=on,index=0,cache=none,if=${drive_type} -netdev tap,ifname=${name}-${monitor_port},id=hostnet0,script=,downscript= -device ${nic_driver},netdev=hostnet0,mac=52:54:00:23:52:11,bus=pci.0,addr=0x3 -pidfile ${pidfile} -daemonize
ip link set ${name}-${monitor_port} up
brctl addif ${brname} ${name}-${monitor_port}
