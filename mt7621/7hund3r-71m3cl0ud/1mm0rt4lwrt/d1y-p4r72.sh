#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: 0xACE7
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.50.92/g' package/base-files/files/bin/config_generate

# Set password to PASSWORD
#sed -i 's/root:::0:99999:7:::/root:$1$4xKZB45Q$w0CPT5M6vBWbYNmSWuxfU.:0:0:99999:7:::/g' package/base-files/files/etc/shadow

# Change language=auto to zh_cn
sed -i 's/lang="auto"/lang="zh_cn"/g' package/emortal/default-settings/files/99-default-settings

# Change ash to bash
sed -i 's/ash/bash/g' package/base-files/files/etc/passwd

# Modify Ntp server
#sed -i 's/ntp.tencent.com/ntp.ntsc.ac.cn/g' package/emortal/default-settings/files/99-default-settings-chinese
#sed -i 's/ntp1.aliyun.com/cn.ntp.org.cn/g' package/emortal/default-settings/files/99-default-settings-chinese
#sed -i 's/ntp.tencent.com/edu.ntp.org.cn/g' package/emortal/default-settings/files/99-default-settings-chinese
#sed -i 's/ntp.tencent.com/ntp.tuna.tsinghua.edu.cn/g' package/emortal/default-settings/files/99-default-settings-chinese

# luci theme argon update
#sed -i 's/"Argon 主题设置"/"主题设置"/g' feeds/ace8/luci-app-argon-config/po/zh_Hans/argon-config.po

#rm -rf feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg
#wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg "https://raw.githubusercontent.com/0xACE8/hyp3r-v_x64_u3f1/main/bg1.jpg"

# sed -i 's/5e72e4/1c78ff/g' feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/css/cascade.css
# sed -i 's/5e72e4/1c78ff/g' feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/css/dark.css
# sed -i 's/483d8b/1c78ff/g' feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/css/cascade.css
# sed -i 's/483d8b/1c78ff/g' feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/css/dark.css

# ttyd fix bug
sed -i '65s/^#//g' feeds/packages/utils/ttyd/files/ttyd.init
sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config
sed -i 's/"终端"/"TTYD 终端"/g' feeds/luci/applications/luci-app-ttyd/po/zh_Hans/ttyd.po

# dnscrypt-proxy start
#sed -i 's/START=18/START=99/g' feeds/packages/net/dnscrypt-proxy2/files/dnscrypt-proxy.init

# DHCP
#mkdir -p package/base-files/files/etc/dnsmasq.d
#wget --no-check-certificate -O package/base-files/files/etc/dnsmasq.d/accelerated-domains.china.conf "https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/accelerated-domains.china.conf"

# Boost UDP
echo '# optimize udp' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.rmem_max=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.rmem_default=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.wmem_max=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.wmem_default=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.netdev_max_backlog=2048' >>package/base-files/files/etc/sysctl.d/10-default.conf

# upgrade 99-default-settings-chinese.sh
rm -rf package/emortal/default-settings/files/99-default-settings-chinese.sh
wget --no-check-certificate https://raw.githubusercontent.com/0xACE8/r4m1ps/mt7621/7hund3r-71m3cl0ud/main/1mm0rt4lwrt/99-default-settings-chinese.sh -O package/emortal/default-settings/files/99-default-settings-chinese.sh
#rm -rf feeds/passwall_packages/tuic

# add init settings
wget --no-check-certificate https://raw.githubusercontent.com/0xACE8/r4m1ps/mt7621/7hund3r-71m3cl0ud/main/1mm0rt4lwrt/99-init-settings -O package/base-files/files/etc/uci-defaults/99-init-settings
wget --no-check-certificate https://raw.githubusercontent.com/0xACE8/r4m1ps/mt7621/7hund3r-71m3cl0ud/main/1mm0rt4lwrt/distfeeds.conf -O openwrt/files/etc/opkg/distfeeds.conf
wget --no-check-certificate https://raw.githubusercontent.com/0xACE8/r4m1ps/mt7621/7hund3r-71m3cl0ud/main/1mm0rt4lwrt/opkg.conf -O openwrt/files/etc/opkg.conf

# Change to my banner
sudo rm package/base-files/files/etc/banner
wget --no-check-certificate https://raw.githubusercontent.com/0xACE8/r4m1ps/mt7621/7hund3r-71m3cl0ud/main/1mm0rt4lwrt/banner -O package/base-files/files/etc/banner

echo "diy-part2.sh is done."
