

# Background
This can be used an easy way of simulating a cloud and container compromise - to trigger detections

It is inspired by Florian Roth's [APTSimulator](https://github.com/NextronSystems/APTSimulator)

This allows you to trigger detections without running real world malware. Still, do not run this on production systems as it can reduce their security.

# How to Run
Copy the files to a Linux system and run:
* chmod +x ./setup.sh
* ./setup.sh

You can also clone the repository directly, for example you can run on Amazon Linux like this:
* sudo yum install git
* git clone https://github.com/cado-security/CloudAndContainerCompromiseSimulator.git
* cd CloudAndContainerCompromiseSimulator
* chmod +x ./setup.sh
* sudo ./setup.sh

![Screenshot](https://github.com/cado-security/CloudAndContainerCompromiseSimulator/blob/main/Screenshot.png)

# Tools Deployed
* [go-pillage-registries - nccgroup - MIT License](https://github.com/nccgroup/go-pillage-registries)
* [amicontained - genuinetools - MIT License](https://github.com/genuinetools/amicontained)
* [botb - brompwnie - GPLv3](https://github.com/brompwnie/botb)
* [deepce - stealthcopyer - Apache License 2](https://github.com/stealthcopter/deepce)
* [4ARMED - dopwn - GPL Affero](https://github.com/4ARMED/dopwn)
* [4ARMED - kubeletmein - GPL Affero](https://github.com/4ARMED/kubeletmein)
* [InGuardians - peirates - GPL Affero](https://github.com/inguardians/peirates)
* [xmrig - xmrig - GPLv3](https://github.com/xmrig/xmrig)
