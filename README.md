# Install packages

```console
dotfiles
bash install.sh

# Add aws credentials for programatic access to AWS
# (OPTIONAL) disable news on login: 
# 1. edit /etc/default/motd-news and change
# ENABLED=1 to ENABLED=0
# 2. edit /etc/update-motd.d/80-livepatch and add  
# exit 0
# after the "#!/bin/sh.
# 3. edit /etc/update-motd.d/10-help-text and remove the printf lines or put exit 0 before them.

```


Having isues with nvidia drivers? Try:
```
Run sudo apt purge nvidia* libnvidia*.
Then sudo apt install nvidia-driver-470
```
