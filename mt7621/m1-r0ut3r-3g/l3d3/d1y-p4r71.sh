#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: 0xACE7
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.177.1/g' package/base-files/files/bin/config_generate
sed -i "s/ip6assign='60'/ip6assign='64'/g" package/base-files/files/bin/config_generate
sed -i "s/globals.ula_prefix='auto'/packet_steering='1'/g" package/base-files/files/bin/config_generate
sed -i 's/2:-dhcp/2:-pppoe/g' package/base-files/files/lib/functions/uci-defaults.sh
sed -i "s|DISTRIB_REVISION='%R'|DISTRIB_REVISION='R$(date +%Y.%m.%d)'|g" package/base-files/files/etc/openwrt_release
echo "DISTRIB_SOURCECODE='openwrt'" >>package/base-files/files/etc/openwrt_release

# Modify Hostname
sed -i 's/ImmortalWrt/Xiaomi_MI_R3G/g' package/base-files/files/bin/config_generate

# Modify Password to ********
sed -i 's/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/root:$1$4xKZB45Q$w0CPT5M6vBWbYNmSWuxfU.:19007:0:99999:7:::/g' package/emortal/default-settings/files/99-default-settings

# Change language=auto to zh_cn
sed -i 's/lang=auto/lang=zh_cn/g' package/emortal/default-settings/files/99-default-settings

# Boost UDP
echo '# optimize udp' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.rmem_max=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.rmem_default=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.wmem_max=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.wmem_default=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.netdev_max_backlog=2048' >>package/base-files/files/etc/sysctl.d/10-default.conf

# Modify Ntp server
sed -i 's/ntp.tencent.com/ntp.tuna.tsinghua.edu.cn/g' package/emortal/default-settings/files/99-default-settings-chinese
sed -i 's/ntp1.aliyun.com/cn.ntp.org.cn/g' package/emortal/default-settings/files/99-default-settings-chinese
sed -i 's/ntp.tencent.com/edu.ntp.org.cn/g' package/emortal/default-settings/files/99-default-settings-chinese
sed -i 's/ntp.tencent.com/ntp.ntsc.ac.cn/g' package/emortal/default-settings/files/99-default-settings-chinese

# Change luci list name
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' feeds/luci/applications/luci-app-turboacc/po/zh-cn/turboacc.po

# Change to my banner
sudo rm package/emortal/default-settings/files/openwrt_banner
wget https://raw.githubusercontent.com/0xACE8/OWT/main/reg/banner -O package/emortal/default-settings/files/openwrt_banner

# Fix Mwan3 ipv4 and ipv6 issue
#sed -i 's/"ip6tables -t mangle -w"/"\/bin\/true"/g' feeds/packages/net/mwan3/files/lib/mwan3/mwan3.sh
#sed -i 's/"iptables -t mangle -w"/"\/bin\/true"/g' feeds/packages/net/mwan3/files/lib/mwan3/mwan3.sh

# Samba4 Patch
sed -i 's/\"nas\"/\"services\"/g' feeds/luci/applications/luci-app-samba4/luasrc/controller/samba4.lua

# Argon upgraded to Xiaomi theme
sed -i 's/"Argon 主题设置"/"主题设置"/g' package/luci-app-argon-config/po/zh_Hans/argon-config.po
rm -rf package/luci-app-argon/htdocs/luci-static/argon/favicon.ico
wget --no-check-certificate -O package/luci-theme-argon/htdocs/luci-static/argon/favicon.ico "https://raw.githubusercontent.com/0xACE8/OWT/main/reg/argone/favicon.ico"
rm -rf package/luci-theme-argon/htdocs/luci-static/argon/img/argon.svg
wget --no-check-certificate -O package/luci-theme-argon/htdocs/luci-static/argon/img/argon.svg "https://raw.githubusercontent.com/0xACE8/OWT/main/reg/argone/img/argone.svg"
rm -rf package/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg
wget --no-check-certificate -O package/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg "https://raw.githubusercontent.com/0xACE8/OWT/main/reg/argone/img/bg1.jpg"
rm -rf package/luci-theme-argon/htdocs/luci-static/argon/icon/*.png
wget --no-check-certificate -O package/luci-theme-argon/htdocs/luci-static/argon/icon/android-icon-192x192.png "https://raw.githubusercontent.com/0xACE8/OWT/main/reg/argone/icon/android-icon-192x192.png"
wget --no-check-certificate -O package/luci-theme-argon/htdocs/luci-static/argon/icon/apple-icon-60x60.png "https://raw.githubusercontent.com/0xACE8/OWT/main/reg/argone/icon/apple-icon-60x60.png"
wget --no-check-certificate -O package/luci-theme-argon/htdocs/luci-static/argon/icon/apple-icon-72x72.png "https://raw.githubusercontent.com/0xACE8/OWT/main/reg/argone/icon/apple-icon-72x72.png"
wget --no-check-certificate -O package/luci-theme-argon/htdocs/luci-static/argon/icon/apple-icon-144x144.png "https://raw.githubusercontent.com/0xACE8/OWT/main/reg/argone/icon/apple-icon-144x144.png"
wget --no-check-certificate -O package/luci-theme-argon/htdocs/luci-static/argon/icon/favicon-16x16.png "https://raw.githubusercontent.com/0xACE8/OWT/main/reg/argone/icon/favicon-16x16.png"
wget --no-check-certificate -O package/luci-theme-argon/htdocs/luci-static/argon/icon/favicon-32x32.png "https://raw.githubusercontent.com/0xACE8/OWT/main/reg/argone/icon/favicon-32x32.png"
wget --no-check-certificate -O package/luci-theme-argon/htdocs/luci-static/argon/icon/favicon-96x96.png "https://raw.githubusercontent.com/0xACE8/OWT/main/reg/argone/icon/favicon-96x96.png"
wget --no-check-certificate -O package/luci-theme-argon/htdocs/luci-static/argon/icon/ms-icon-144x144.png "https://raw.githubusercontent.com/0xACE8/OWT/main/reg/argone/icon/ms-icon-144x144.png"

# Change wifi ssid: Fuck_Xiaomi
#sed -i 's/ssid=OpenWrt/ssid=CMCC-702/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i 's/encryption=none/encryption=psk2/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i '/encryption/a\set wireless.default_radio${devidx}.key=_password_' package/kernel/mac80211/files/lib/wifi/mac80211.sh

echo "diy-part2.sh is done."
