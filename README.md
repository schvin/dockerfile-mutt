#### dockerfile-mutt

#### Initial setup

```
mkdir ~/homedir-mutt
docker build -t mutt .
touch ~/Mail/inbox
touch ~/.procmailrc
ln -s ~/Mail ~/mail

.muttrc, include set sendmail="/usr/sbin/ssmtp"

```

#### Routine use:
```
cd ~/homedir-mutt
docker run -P -it -d -v `pwd`:/home/s-mail:rw --name=$USER-exim exim
# syslog
docker run -it --link $USER-exim:exim --rm=true --volumes-from=$USER-exim fetchmail
docker run -it --link $USER-exim:exim --rm=true --volumes-from=$USER-exim mutt

```

# Deal with default config?
# Deal with cert issues?
# Deal with fetching config/gpg ?

# Deal with relay settings
#deal with TERM XXXX ?
#deal with syslog
#deal with crons for fetchmail flush

#populate .fetchmailrc

#chmod 700 ~/.fetchmailrc
