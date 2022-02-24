# pt01
probetag


### use a docker container with sshd

all commands are done via make command.

* build
* run
* stop
* clean





#### build an image and run the container
```
make
```

#### connect to container
```
ssh -l ubuntu -p 2022 127.0.0.1
```

or simple:

```
ssh ubuntu-sshd
```
need's a modified ssh config


```
cat << EOF >> ~/.ssh/config
Host ubuntu-sshd
 Hostname 127.0.0.1
 Port 2022
 User ubuntu
EOF
```


#### stop container

```
make stop
```


### cleanup image

```
make clean
```
