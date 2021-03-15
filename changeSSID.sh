#/bin/bash
#description:
#	change the ssid of hostapd.conf in /root/course/hostapd
#date:
#	2021/03/15
#author:
#	crazycat


[ ! -d "/root/course" ] && echo "course directory doesnt exist" && exit 1

read -p "type your number: " number

re='^[0-9]+$'
[[ ! $number =~ ${re} ]] || [ -z ${number} ] && echo "please enter number" && exit 1 

dir='/root/course/hostapd'

#change open ap
sed -i "s/raspberry.*$/raspberry-open-${number}/" ${dir}/open/hostapd-open.conf

#change wpa ap
sed -i "s/raspberry.*$/raspberry-wpa-${number}/" ${dir}/wpa/hostapd-wpa.conf

#change hidden ap
sed -i "s/raspberry.*$/raspberry-hidden-${number}/" ${dir}/hidden/hostapd-hidden.conf

#change wep ap
sed -i "s/raspberry.*$/raspberry-wep-${number}/" ${dir}/wep/hostapd-wep.conf

#change macFilter ap
sed -i "s/raspberry.*$/raspberry-macFilter-${number}/" ${dir}/macFilter/hostapd-macFilter.conf
