#### dockerfile-mutt

#### Initial setup

```
mkdir ~/homedir-mail
docker build -t newsbeuter .
```

#### Routine use:
```
cd ~/homedir-mail
docker run -it --rm=true -v `pwd`:/home/mail:rw schvin/newsbeuter
```
