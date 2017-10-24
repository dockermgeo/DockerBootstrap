# DockerBootstrap

Booting Dockercontainer and make any things...

### Installation

```
git clone https://github.com/git-mgeo/DockerBootstrap.git
cd DockerBootstrap
make
```

#### Dependencies
* jq

Using on
*  Ubuntu: apt get install -yq 
*  Alpine: apk add -yq 

After installing Dockerbootstrap you'll find this structure:
```
/etc/docker/up.d/
/etc/docker/modules/
/boot
/app
```
* **/boot** Mainscript calling /etc/docker/modules/init
* **/app** Startscript of app
* **modules** include default initscript and other functions
* **up.d** place which each Shellscript will startet


