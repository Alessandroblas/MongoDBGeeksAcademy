# MongoDB-SampleCollection

Please note this repo is currently working in progress.


Just some MongoDB collections and notes I am using for my course @GeeksAcademyEurope

Installation process on Ubuntu: 

```
$ wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -

$ echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list

$ sudo apt-get update

$ sudo apt-get install -y mongodb-org

$ sudo systemctl start mongod
```


