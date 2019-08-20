<?php

// Location of MySQL server
define('DB_HOST', '127.0.0.1:3310');

// MySQL user for modifying auth database
define('DB_USER', 'root');

// MYSQL user password
define('DB_PASS', '123456');

// Database that stores authentication information (usually 'auth' on TrinityCore)
define('DB_NAME', 'ashamane_auth');

// Location of SOAP (worldserver with TrinityCore) server
define('SOAP_IP', '127.0.0.1');

// Port for SOAP server
define('SOAP_PORT', '7878');

// Account name to handle SOAP commands (needs RBAC permissions 219 and 228 for TrinityCore)
define('SOAP_USER', 'website');

// Account name password
define('SOAP_PASS', 'website');

// Define which SOAP URI gets used
// This allows for easy switching between different emulators
define('SOAP_URI', 'urn:TC');
//define('SOAP_URI', 'urn:TC');
//define('SOAP_URI', 'urn:MaNGOS');

// WoW Server Address (to tell people what to enter in realmlist/Config.wtf
// Has nothing to do with account creation directly
define('REALMLIST', "127.0.0.1");

// Check if Email Address is already in-use
define('CHECK_FOR_DUPLICATE_EMAIL', false);

// Title of the site (something like "Realm of Espionage WotLK Server Registration Page")
// This is displayed at the top of the browser window and in tabs
define('SITE_TITLE', "Sigle Player Project - BFA");

// Site meta description (for search engines)
define('META_DESCRIPTION', "Single Player Project - BFA");

// Site meta keywords (for search engines)
define('META_KEYWORDS', "spp");

// Site meta robots (for search engines)
define('META_ROBOTS', "INDEX,NOFOLLOW");
