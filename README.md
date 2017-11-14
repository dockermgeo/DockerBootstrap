# DockerBootstrap

Booting Dockercontainer and make any things...

### Installation

```
git clone https://github.com/dockermgeo/DockerBootstrap.git
cd DockerBootstrap
make
```

After installing Dockerbootstrap you'll find this structure:

```
/etc/docker/up.d/
/etc/docker/postup.d/
/etc/docker/modules/
/boot.sh
/app.sh
```
* **/boot** Mainscript calling /etc/docker/modules/init
* **/app** Startscript of app
* **modules** include default initscript and other functions
* **up.d** place where each Shellscript will startet
* **postup.d** place where each Shellscript will startet after MAIN-APP started
