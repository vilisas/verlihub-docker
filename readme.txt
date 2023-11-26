verlihub-alpine docker setup instructions
Tested with x86_64 and aarch64 (Raspberry Pi 4)

Steps:

build image:
# cd build
# ./build

for first time setup run:
# docker-compose run --rm --entrypoint="/usr/local/bin/vh --install" verlihub

then also update MaxMind GeoIP database
# docker-compose run --rm --entrypoint="/usr/local/bin/vh -g" verlihub

variables:
  VH_UID=1000		- if set, then verlihub will be running as this UID. verlihub and GeoIP folders will be chowned by this UID
  DO_NOT_LINK_PLUGINS=1	- to skip symlink creation to compiled plugins

install process:

Hello No message passed. and welcome to Verlihub installation wizard. To exit this wizard, press CTRL+C at any time. Let's begin with configuration of MySQL database access. If you have any problems during configuration, please refer to following resources:

 * Follow our official manual: https://github.com/verlihub/verlihub/wiki/
 * Seek help on our support hub: nmdcs://hub.verlihub.net:7777
 * Check out official MySQL manual: https://dev.mysql.com/doc/refman/5.7/en/

[*] MySQL information:

Please enter MySQL information below for the hub being installed. If account or database don't exist, they will be created later in process using administrator credentials.

Choose database name (verlihub): 					verlihub (see db.env)
MySQL user to access 'verlihub' (verlihub): 				verlihub (see db.env)
MySQL password for user 'verlihub': 					enter your password here (see db.env)
MySQL hostname (localhost): 						verlihub-db (mysql server container name) *IMPORTANT*
MySQL charset, experts only, leave empty for default (cp1250):
Hub locale, experts only, leave empty for default: 
Hub encoding, experts only, leave empty for default: 
MaxMindDB path, experts only, leave empty for default: 

Here is information you specified about your MySQL server:

        Database: verlihub
        Username: verlihub
        Password: <hidden>
        Hostname: verlihub-db
        Charset: cp1250
        Hub locale: 
        Hub encoding: 
        MaxMindDB path: 

Do you want to continue with this information? (y/N) y

You are going to use database on external server, please enter IP address of current server.

IP address: 								127.0.0.1

Checking for MySQL account verlihub@verlihub-db, please wait.

MySQL account verlihub@verlihub-db has been found.

Checking for MySQL database verlihub, please wait.

MySQL database verlihub has been found, assuming that permissions are already granted.

Please choose a place for configuration files:

        [1] /etc/verlihub
        [2] /usr/local/etc/verlihub
        [9] Other, choose path where to put configuration file.

Select number: 1

Configuration folder /etc/verlihub doesn't exist and will be created now.

Do you want to continue? Choose no to select another folder. [y/N]: y

Configuration file has been successfully written to /etc/verlihub/dbconfig.

Copying files and accessing MySQL server, this will take up to 30 seconds.

Installation is complete, now you can add master account and enter some basic settings.

[*] Hub settings:

Choose master account and other hub information, don't use any special characters here, you'll be able to use them later.

/usr/local/bin/vh: line 1029: [: =: unary operator expected
Master nick ([SU]): admin						your nick 
Master password (1700588364): 						your password
Hub port (4111): 							hub port, 4111 should be ok, you will need to expose this port with docker
Hub host (cbddd863b75b): my-fancy-hub.dyndns.org			your hub address
Hub name (Hub of ): Owner						who is owner ? your nick

Is this information correct?

        Master nick: admin
        Master password: <hidden>
        Hub name: Owner
        Hub address: dchub://my-fancy-hub.dyndns.org:4111

Do you want to continue with this information? (y/N) y

Please wait while creating settings.

Your hub has been installed and configured successfully, please use vh --help command for further instructions.

For any other questions please get in contact with us using our official support hub: nmdcs://hub.verlihub.net:7777
