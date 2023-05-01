# MongoDB-SampleCollection

Please note this repo is always working in progress.


Just some MongoDB collections and notes I am using for my course @GeeksAcademyEurope

Installation process on Ubuntu: 

```
$ sudo apt-get install gnupg

$ curl -fsSL https://pgp.mongodb.com/server-6.0.asc | sudo gpg -o /usr/share/keyrings/mongodb-server-6.0.gpg --dearmor

$ echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

$ sudo apt-get update

$ sudo apt-get install -y mongodb-org

$ sudo systemctl start mongod
```


