# Make a kiosk mode on Ubuntu

This script will allow you to create a kiosk mode on Ubuntu. User will be stuck on a Firefox window and predefined site

## Installation

Start with a basic installation of Ubuntu (v24 recommended) and configure your root account. After that, move the file ***'installer_kiosk_root.sh'*** on the desktop, open a terminal and execute the following commands :

```bash
cd Desktop

sudo chmod +x installer_kiosk_root.sh

sudo ./installer_kiosk_root.sh 
```
Type a password for the user ***'kiosk'***, press **ENTER** to leave empty fields and press **O** to confirm. The computer will restart.

Now, open the kiosk session. Open Firefox then go in **Parameter** > **Privacy and security**, go down until **Passwords** and uncheck all of **Passwords** and **Autofill**. Change in **History**, **Remember history** in **Never remember history**.

![Firefox Parameter](https://github.com/cbureau-gpsea/kiosk_ubuntu/blob/main/img/Capture%20d'%C3%A9cran%202024-10-11%20110119.png)

Add extension **BlockSite** and on their website, click on **Redirect**, type the website of the kiosk mode and check **Whitelist mode**.
![BlockSite](https://github.com/cbureau-gpsea/kiosk_ubuntu/blob/main/img/Capture%20d'%C3%A9cran%202024-09-27%20085707.png)
![BlockSite2](https://github.com/cbureau-gpsea/kiosk_ubuntu/blob/main/img/Capture%20d'%C3%A9cran%202024-09-27%20090004.png)

Finally move the file ***'installer_kiosk.sh'*** on the desktop, open a terminal and execute the following commands :

```bash
su [name_of_root_user]

sudo –i

cd Desktop

sudo chmod +x installer_kiosk.sh

sudo ./installer_kiosk.sh 
```

The computer will restart and will turn on kiosk mode. 

## Usage

Now, the computer turn on automatically in kiosk mode. You can turn off the computer or change user with the shortcut CTRL+ALT+SUPPR.

If you want to make changes and need access to the kiosk user, execute the file ***'enable_shortcuts.sh'*** into the terminal to re-enable the shortcuts. Shortcuts will be disabled on next reboot.
