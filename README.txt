iscan - a program for controlling IPROscan (i2kit.exe) and a TWAIN
driver from the keyboard.

Iscan requires AutoHotKey to be usable.
An AutoHotkey installer is included in this directory,
and also a bat file for getting the most recent installer.

There are two iscan installers per supported TWAIN driver -
a single user and a single machine installer.
The single user installer is useful for those without administrative 
priviledges.

There is also a multi-machine installer.

Before running the installer,
it is a VERY good idea to edit usr/iscan_rc.ahk to match local circumstances.
Otherwise you won't be able to use such nice features as saving scanner 
settings, importing images automatically, etc.

If you want the save scanner settings feature, you will need to create the
appropriate directories on your network. See usr/iscan_rc.ahk.

The default macro file src/macro.ahk is empty. There are some macros 
that work nicely with Ricoh 13** series machines in macros/macro.ahk.
Copy one over src/macro.ahk to use it, or let operators roll their
own when and if they want to use macros. (Most never will.)

LICENSE

wget (http://www.gnu.org/software/wget/#content)
and
AutoHotkey (http://www.autohotkey.com)
are covered by the gnu general public license 
(http://www.gnu.org/licenses/license.html#content).

iscan is copyright 2008-2013 Noah Birnel.
iscan is free software. Do whatever you like with it.

BUGS

Lots! See DEVELOPER_NOTES.txt.
Bug reports to : nbirnel at teris dot com.
Please include 'iscan bug report' in the subject line.
