# SOAP-Registration-Site
Standalone SOAP-based registration site for World of Warcraft private servers

Standalone Preview: https://wow.realmofespionage.com
- It is small in order to fit in the sidebar for Joomla (should easily be able to format it as-is for a proper standalone site through **site.css**)
- Please don't create accounts unless you want to play on my server

(TODO) How I have it implemented on my site (hit the hamburger icon to the left): https://realmofespionage.com/servers/world-of-warcraft/how-to-connect

This replaces the older-known method of injecting accounts directly into MySQL databases. Tested for use on TrinityCore (3.3.5 and 6.x) and OregonCore, and probably easily adaptable for other server emulators (just need to use the right SOAP command to create the account and change the SOAP uri in **SOAPRegistration.php**).

This site uses Jeutie's WotLK repack registration site as a base, and is stripped-down to include no images (meaning it's very basic looking, but lightweight), and updated to support WoD account creations on TrinityCore (6.x branch).

- You will have to look at **config.php** at the very least in order to use this with a TrinityCore 3.3.5 server.
- You'll need to look at **SOAPRegistration.php** as well for non-TrinityCore and TrinityCore 6.x branch servers.
- Should glance through **index.php** to add/remove/edit the links that appear below the registration form
- **site.css** can be modified to adjust colors (use HTML color codes).
- **status/index.php** displays basic WoW server information (.server info) through SOAP. Could be used standalone or intergrated somewhere else, and isn't necessary for the function of the registration site.
- **Apache/wow.conf** is a URL rewrite and file restriction rule for Apache. Not required, but recommended to use for security purposes and at the very least makes the URL look nicer. Somewhere in my Linux project exists a nginx-specific rule.

As for how to use it, you need a working World of Warcraft private server that has a SOAP backend (OregonCore, TC 3.3.5, and TC 6.x confirmed working). You also need a web server with PHP and SOAP support. You simply take these files and put them in a folder somewhere on your web host (I wouldn't recommend using it as a landing page unless you make it look more interesting or don't mind the look as-is :p).

The designated SOAP account (in config.php) needs to have RBAC permissions 219 and 228 with TrinityCore. You can create such an account from TC's worldserver console with (change CHANGEME to desired password):

```
account create soap CHANGEME
account set gmlevel soap 3 -1
rbac account grant soap 219 -1
rbac account grant soap 228 -1
```

Tested on Fedora 23 Server ([my setup configs here](https://gitlab.com/Espionage724/Linux)), with MariaDB, Apache, and nginx. Not sure how it'll perform or what changes are needed for any other platform/setup.

If you're using a repack, then you'll need to figure out whether or not that repack includes all of that stuff above, or just use whatever web stuff it comes with. If you're using Jeutie's 3.3.5a repack, you already have a better looking version of this for Classic-WotLK.

Original code by Jeutie and Chocochaos. Generalized, updated to support WoD, and stripped down by me.