# ubuntu-hardening
a set of commands for ubuntu hardening



I once worked on a project that required hardening for their machines.
Some machines just need to be secure but quiet usable, while some others had senstive information that we could simply prefer to sacrifice root access and repair mechanisms for the OS for the cost of security.

## Scripts explanation:

For normal usage you can safely use the `hardening-moderate.sh` script. 
This will prevent fork-bomb, enable firewall and secure a couple of things (shared memories, tmp folder...etc)

Just download it and make it executable

```
chmod +x hardening-moderate.sh
./hardening-moderate.sh
```


If you're creating a system with important data for an average user(who might easily break their system) you might want to consider `hardening-extreme.sh` script as an addition the other script. 

the "hardening-extreme" script IS a bit DANGEROUS, and it might make you're system unusable/ hard to repair, so go through the comments and read it carefully before you execute it.

