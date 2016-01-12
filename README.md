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
docker run -it -v `pwd`:/home/s-mail:rw --rm=true --name=$USER-mail schvin/mutt
```

#### Archive:

# if built-in imap or pop3 in mutt are not sufficient, you can use getmail, if needed:
```bin/loop.sh```

```
#docker run -P -it -d -v `pwd`:/home/s-mail:rw --name=$USER-exim exim
#docker run -it --link $USER-exim:exim --rm=true --volumes-from=$USER-exim getmail
#docker run -it --link $USER-exim:exim --rm=true --volumes-from=$USER-exim mutt

#docker run -it --link $USER-exim:exim --rm=true --volumes-from=$USER-exim fetchmail
#fetchmail -N -b 100 -B 100 -d 15 -K -S $EXIM_PORT_25_TCP_ADDR
#fetchmail -N -b 100 -B 100 -d 30 -k -S $EXIM_PORT_25_TCP_ADDR
#fetchmail -b 100 -B 100 -k -F -S $EXIM_PORT_25_TCP_ADDR
#fetchmail -a -N -b 100 -B 100 -d 15 -K -S $EXIM_PORT_25_TCP_ADDR

```
XXX:

to address:
- syslog
- default configs?
- cert issues?
- fetching config/gpg ?
- relay settings
- term issues
- getmail max_messages_per_session
- link to howtos/examples on the app configs
- note about removing old container, or restarting it
