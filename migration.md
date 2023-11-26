# Migration  
 ## How to migrate your verlihub to docker 
1. Dump the database of your existing hub to file:  
```mysqldump verlihub >verlihub.sql```
2. copy it to your container's work directory, copy scripts to verlihub/scripts. Don't copy plugins, only liblua and libplug will be enabled by default. If your need other plugins, you should modify build/Dockerfile to enable them at build time. 
3. mount verlihub.sql to database container - just add it as volume to verlihub-db:
```- "./verlihub.sql:/verlihub.sql"```
4. run:  
```
# docker-compose up -d verlihub-db
# docker-compose exec verlihub-db mysql -u root -p
```
Enter mysql_root password, it is set in .env file.
then, if successfully logged in, restore database:
``` 
source /verlihub.sql
quit
```
```# exit ```

Beware that ports in your hub configuration should match docker's port forwarding, otherwise hub will be unreachable. If hub is unreachable, modify port forwarding accordingly.
It might be usefull to run install process first time and then proceed with migration, see install.txt.
