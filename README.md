#### dockerfile-mutt

#### Initial setup

```
mkdir ~/homedir-mutt
cd ~/homedir-mutt
touch ~/Mail/inbox
touch ~/.procmailrc
ln -s ~/Mail ~/mail
```

Create `.muttrc`, include `set sendmail="/usr/sbin/ssmtp"`

```

#### Routine use:
```
cd ~/homedir-mutt
docker run -it -v `pwd`:/home/s-mail:rw --name=$USER-mail getmail
docker run -it --link $USER-mail:mail --rm=true --volumes-from=$USER-mail mutt

#### Archive:

```
#docker run -P -it -d -v `pwd`:/home/s-mail:rw --name=$USER-exim exim
#docker run -it --link $USER-exim:exim --rm=true --volumes-from=$USER-exim getmail
#docker run -it --link $USER-exim:exim --rm=true --volumes-from=$USER-exim mutt

# syslog
#docker run -it --link $USER-exim:exim --rm=true --volumes-from=$USER-exim fetchmail
#fetchmail -N -b 100 -B 100 -d 15 -K -S $EXIM_PORT_25_TCP_ADDR
#fetchmail -N -b 100 -B 100 -d 30 -k -S $EXIM_PORT_25_TCP_ADDR
#fetchmail -b 100 -B 100 -k -F -S $EXIM_PORT_25_TCP_ADDR
#fetchmail -a -N -b 100 -B 100 -d 15 -K -S $EXIM_PORT_25_TCP_ADDR

```
XXX:

Deal with default config?
Deal with cert issues?
Deal with fetching config/gpg ?
Deal with relay settings
deal with TERM XXXX ?
deal with syslog
deal with crons for fetchmail
populate .fetchmailrc
chmod 700 ~/.fetchmailrc
max_messages_per_session
syslog
saner way to re-run getmail without overlapping on max_messages_per_session?
link to howtos/examples on the app configs
note about removing old container, or restarting it
