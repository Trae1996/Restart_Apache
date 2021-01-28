# Restart_Apache
A simple bash script for reloading Apache vhost configs

## Usage
Clone the repository or download the latest release. 

From a command-line call re.sh with two arguments.
1. The vhost configuration
1. The service directive {restart|reload}
```sh
 cd ~
cd/Restart_Apache
 sudo./re.sh 000* restart
{enter password}
sudo systemctl reload apache2
```
