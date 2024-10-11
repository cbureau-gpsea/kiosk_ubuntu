cat > /etc/gdm3/custom.conf << EOF
# GDM configuration storage
#
# See /usr/share/gdm/gdm.schemas for a list of available options.

[daemon]
AutomaticLoginEnable = true
AutomaticLogin = kiosk
# Uncomment the line below to force the login screen to use Xorg
#WaylandEnable=false

# Enabling automatic login
#  AutomaticLoginEnable = true
#  AutomaticLogin = user1

# Enabling timed login
#  TimedLoginEnable = true
#  TimedLogin = user1
#  TimedLoginDelay = 10

[security]

[xdmcp]

[chooser]

[debug]
# Uncomment the line below to turn on debugging
# More verbose logs
# Additionally lets the X server dump core if it crashes
#Enable=true
EOF

echo -e "\e[0;31mLa connexion automatique de l'utilisateur 'kiosk' a été activée.\e[1;37m"

cd /home/kiosk/
cat > kiosk.sh << EOF
#!/bin/bash

# Lancer le script sur l'écran 0
export DISPLAY=:0

# Cache la souris
#unclutter &

# Désactive les raccourcis clavier
gsettings set org.gnome.mutter overlay-key '' &
gsettings set org.gnome.desktop.wm.keybindings activate-window-menu [] &
gsettings set org.gnome.desktop.wm.keybindings always-on-top [] &
gsettings set org.gnome.desktop.wm.keybindings begin-move [] &
gsettings set org.gnome.desktop.wm.keybindings begin-resize [] &
gsettings set org.gnome.desktop.wm.keybindings close [] &
gsettings set org.gnome.desktop.wm.keybindings cycle-group [] &
gsettings set org.gnome.desktop.wm.keybindings cycle-group-backward [] &
gsettings set org.gnome.desktop.wm.keybindings cycle-panels [] &
gsettings set org.gnome.desktop.wm.keybindings cycle-panels-backward [] &
gsettings set org.gnome.desktop.wm.keybindings cycle-windows [] &
gsettings set org.gnome.desktop.wm.keybindings cycle-windows-backward [] &
gsettings set org.gnome.desktop.wm.keybindings lower [] &
gsettings set org.gnome.desktop.wm.keybindings maximize [] &
gsettings set org.gnome.desktop.wm.keybindings maximize-horizontally [] &
gsettings set org.gnome.desktop.wm.keybindings maximize-vertically [] &
gsettings set org.gnome.desktop.wm.keybindings minimize [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-center [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-corner-ne [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-corner-nw [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-corner-se [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-corner-sw [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-down [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-left [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-right [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-up [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-side-e [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-side-n [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-side-s [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-side-w [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-10 [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-11 [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-12 [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-7 [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-8 [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-9 [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-last [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right [] &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up [] &
gsettings set org.gnome.desktop.wm.keybindings panel-main-menu [] &
gsettings set org.gnome.desktop.wm.keybindings panel-run-dialog [] &
gsettings set org.gnome.desktop.wm.keybindings raise [] &
gsettings set org.gnome.desktop.wm.keybindings raise-or-lower [] &
gsettings set org.gnome.desktop.wm.keybindings set-spew-mark [] &
gsettings set org.gnome.desktop.wm.keybindings show-desktop [] &
gsettings set org.gnome.desktop.wm.keybindings switch-applications [] &
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward [] &
gsettings set org.gnome.desktop.wm.keybindings switch-group [] &
gsettings set org.gnome.desktop.wm.keybindings switch-group-backward [] &
gsettings set org.gnome.desktop.wm.keybindings switch-input-source [] &
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward [] &
gsettings set org.gnome.desktop.wm.keybindings switch-panels [] &
gsettings set org.gnome.desktop.wm.keybindings switch-panels-backward [] &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 [] &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-10 [] &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-11 [] &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-12 [] &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 [] &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 [] &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 [] &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 [] &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 [] &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-7 [] &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-8 [] &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-9 [] &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down [] &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-last [] &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left [] &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right [] &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up [] &
gsettings set org.gnome.desktop.wm.keybindings switch-windows [] &
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward [] &
gsettings set org.gnome.desktop.wm.keybindings toggle-above [] &
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen [] &
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized [] &
gsettings set org.gnome.desktop.wm.keybindings toggle-on-all-workspaces [] &
gsettings set org.gnome.desktop.wm.keybindings unmaximize [] &
gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier '' &
gsettings set org.gnome.settings-daemon.plugins.media-keys help [] &
gsettings set org.gnome.settings-daemon.plugins.media-keys screenreader [] &
gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver [] &
gsettings set org.gnome.shell.keybindings focus-active-notification [] &
gsettings set org.gnome.shell.keybindings open-new-window-application-1 [] &
gsettings set org.gnome.shell.keybindings open-new-window-application-2 [] &
gsettings set org.gnome.shell.keybindings open-new-window-application-3 [] &
gsettings set org.gnome.shell.keybindings open-new-window-application-4 [] &
gsettings set org.gnome.shell.keybindings open-new-window-application-5 [] &
gsettings set org.gnome.shell.keybindings open-new-window-application-6 [] &
gsettings set org.gnome.shell.keybindings open-new-window-application-7 [] &
gsettings set org.gnome.shell.keybindings open-new-window-application-8 [] &
gsettings set org.gnome.shell.keybindings open-new-window-application-9 [] &
gsettings set org.gnome.shell.keybindings screenshot [] &
gsettings set org.gnome.shell.keybindings screenshot-window [] &
gsettings set org.gnome.shell.keybindings shift-overview-down [] &
gsettings set org.gnome.shell.keybindings shift-overview-up [] &
gsettings set org.gnome.shell.keybindings show-screen-recording-ui [] &
gsettings set org.gnome.shell.keybindings show-screenshot-ui [] &
gsettings set org.gnome.shell.keybindings switch-to-application-1 [] &
gsettings set org.gnome.shell.keybindings switch-to-application-2 [] &
gsettings set org.gnome.shell.keybindings switch-to-application-3 [] &
gsettings set org.gnome.shell.keybindings switch-to-application-4 [] &
gsettings set org.gnome.shell.keybindings switch-to-application-5 [] &
gsettings set org.gnome.shell.keybindings switch-to-application-6 [] &
gsettings set org.gnome.shell.keybindings switch-to-application-7 [] &
gsettings set org.gnome.shell.keybindings switch-to-application-8 [] &
gsettings set org.gnome.shell.keybindings switch-to-application-9 [] &
gsettings set org.gnome.shell.keybindings toggle-application-view [] &
gsettings set org.gnome.shell.keybindings toggle-message-tray [] &
gsettings set org.gnome.shell.keybindings toggle-overview [] &
gsettings set org.gnome.shell.keybindings toggle-quick-settings [] &
gsettings set org.gnome.shell.extensions.tiling-assistant overridden-settings [] &
gsettings set org.gnome.shell.extensions.tiling-assistant restore-window [] &
gsettings set org.gnome.shell.extensions.tiling-assistant tile-bottom-half [] &
gsettings set org.gnome.shell.extensions.tiling-assistant tile-bottomleft-quarter [] &
gsettings set org.gnome.shell.extensions.tiling-assistant tile-bottomright-quarter [] &
gsettings set org.gnome.shell.extensions.tiling-assistant tile-left-half [] &
gsettings set org.gnome.shell.extensions.tiling-assistant tile-maximize [] &
gsettings set org.gnome.shell.extensions.tiling-assistant tile-right-half [] &
gsettings set org.gnome.shell.extensions.tiling-assistant tile-top-half [] &
gsettings set org.gnome.shell.extensions.tiling-assistant tile-topleft-half [] &
gsettings set org.gnome.shell.extensions.tiling-assistant tile-topright-quarter [] &
gsettings set org.gnome.mutter.keybindings toggle-tiled-left [] &
gsettings set org.gnome.mutter.keybindings toggle-tiled-right [] &

gsettings set org.gnome.desktop.screensaver ubuntu-lock-on-suspend false &
gsettings set org.gnome.desktop.screensaver lock-enabled false &
gsettings set org.gnome.desktop.session idle-delay 0 &

# Lance Firefox
firefox --kiosk 'https://mediatheques.sudestavenir.fr'
EOF

chmod +x kiosk.sh

echo -e "\e[0;31mLe fichier kiosk.sh a été créé et est exécutable.\e[1;37m"

mkdir /home/kiosk/.config/autostart/
cd /home/kiosk/.config/autostart/
cat > kiosk.sh.desktop << EOF
[Desktop Entry]
Type=Application
Exec=/home/kiosk/kiosk.sh
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[fr_FR]=Mode Kiosk
Name=Mode Kiosk
Comment[fr_FR]=Démarrage de la session en mode kiosque
Comment=Démarrage de la session en mode kiosque
EOF

echo -e "\e[0;31mLe fichier kiosk.sh a été ajouté à Applications au démarrage.\e[1;37m"

gsettings set org.gnome.mutter overlay-key ''
gsettings set org.gnome.desktop.wm.keybindings activate-window-menu []
gsettings set org.gnome.desktop.wm.keybindings always-on-top []
gsettings set org.gnome.desktop.wm.keybindings begin-move []
gsettings set org.gnome.desktop.wm.keybindings begin-resize []
gsettings set org.gnome.desktop.wm.keybindings close []
gsettings set org.gnome.desktop.wm.keybindings cycle-group []
gsettings set org.gnome.desktop.wm.keybindings cycle-group-backward []
gsettings set org.gnome.desktop.wm.keybindings cycle-panels []
gsettings set org.gnome.desktop.wm.keybindings cycle-panels-backward []
gsettings set org.gnome.desktop.wm.keybindings cycle-windows []
gsettings set org.gnome.desktop.wm.keybindings cycle-windows-backward []
gsettings set org.gnome.desktop.wm.keybindings lower []
gsettings set org.gnome.desktop.wm.keybindings maximize []
gsettings set org.gnome.desktop.wm.keybindings maximize-horizontally []
gsettings set org.gnome.desktop.wm.keybindings maximize-vertically []
gsettings set org.gnome.desktop.wm.keybindings minimize []
gsettings set org.gnome.desktop.wm.keybindings move-to-center []
gsettings set org.gnome.desktop.wm.keybindings move-to-corner-ne []
gsettings set org.gnome.desktop.wm.keybindings move-to-corner-nw []
gsettings set org.gnome.desktop.wm.keybindings move-to-corner-se []
gsettings set org.gnome.desktop.wm.keybindings move-to-corner-sw []
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-down []
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-left []
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-right []
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-up []
gsettings set org.gnome.desktop.wm.keybindings move-to-side-e []
gsettings set org.gnome.desktop.wm.keybindings move-to-side-n []
gsettings set org.gnome.desktop.wm.keybindings move-to-side-s []
gsettings set org.gnome.desktop.wm.keybindings move-to-side-w []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-10 []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-11 []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-12 []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-7 []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-8 []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-9 []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-last []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up []
gsettings set org.gnome.desktop.wm.keybindings panel-main-menu []
gsettings set org.gnome.desktop.wm.keybindings panel-run-dialog []
gsettings set org.gnome.desktop.wm.keybindings raise []
gsettings set org.gnome.desktop.wm.keybindings raise-or-lower []
gsettings set org.gnome.desktop.wm.keybindings set-spew-mark []
gsettings set org.gnome.desktop.wm.keybindings show-desktop []
gsettings set org.gnome.desktop.wm.keybindings switch-applications []
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward []
gsettings set org.gnome.desktop.wm.keybindings switch-group []
gsettings set org.gnome.desktop.wm.keybindings switch-group-backward []
gsettings set org.gnome.desktop.wm.keybindings switch-input-source []
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward []
gsettings set org.gnome.desktop.wm.keybindings switch-panels []
gsettings set org.gnome.desktop.wm.keybindings switch-panels-backward []
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 []
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-10 []
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-11 []
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-12 []
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 []
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 []
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 []
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 []
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 []
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-7 []
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-8 []
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-9 []
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down []
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-last []
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left []
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right []
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up []
gsettings set org.gnome.desktop.wm.keybindings switch-windows []
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward []
gsettings set org.gnome.desktop.wm.keybindings toggle-above []
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen []
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized []
gsettings set org.gnome.desktop.wm.keybindings toggle-on-all-workspaces []
gsettings set org.gnome.desktop.wm.keybindings unmaximize []
gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier ''
gsettings set org.gnome.settings-daemon.plugins.media-keys help []
gsettings set org.gnome.settings-daemon.plugins.media-keys screenreader []
gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver []
gsettings set org.gnome.shell.keybindings focus-active-notification []
gsettings set org.gnome.shell.keybindings open-new-window-application-1 []
gsettings set org.gnome.shell.keybindings open-new-window-application-2 []
gsettings set org.gnome.shell.keybindings open-new-window-application-3 []
gsettings set org.gnome.shell.keybindings open-new-window-application-4 []
gsettings set org.gnome.shell.keybindings open-new-window-application-5 []
gsettings set org.gnome.shell.keybindings open-new-window-application-6 []
gsettings set org.gnome.shell.keybindings open-new-window-application-7 []
gsettings set org.gnome.shell.keybindings open-new-window-application-8 []
gsettings set org.gnome.shell.keybindings open-new-window-application-9 []
gsettings set org.gnome.shell.keybindings screenshot []
gsettings set org.gnome.shell.keybindings screenshot-window []
gsettings set org.gnome.shell.keybindings shift-overview-down []
gsettings set org.gnome.shell.keybindings shift-overview-up []
gsettings set org.gnome.shell.keybindings show-screen-recording-ui []
gsettings set org.gnome.shell.keybindings show-screenshot-ui []
gsettings set org.gnome.shell.keybindings switch-to-application-1 []
gsettings set org.gnome.shell.keybindings switch-to-application-2 []
gsettings set org.gnome.shell.keybindings switch-to-application-3 []
gsettings set org.gnome.shell.keybindings switch-to-application-4 []
gsettings set org.gnome.shell.keybindings switch-to-application-5 []
gsettings set org.gnome.shell.keybindings switch-to-application-6 []
gsettings set org.gnome.shell.keybindings switch-to-application-7 []
gsettings set org.gnome.shell.keybindings switch-to-application-8 []
gsettings set org.gnome.shell.keybindings switch-to-application-9 []
gsettings set org.gnome.shell.keybindings toggle-application-view []
gsettings set org.gnome.shell.keybindings toggle-message-tray []
gsettings set org.gnome.shell.keybindings toggle-overview []
gsettings set org.gnome.shell.keybindings toggle-quick-settings []
gsettings set org.gnome.shell.extensions.tiling-assistant overridden-settings []
gsettings set org.gnome.mutter.keybindings toggle-tiled-left []
gsettings set org.gnome.mutter.keybindings toggle-tiled-right []

gsettings set org.gnome.desktop.screensaver ubuntu-lock-on-suspend false
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0

echo -e "\e[0;31mDésactivation des raccourcis et de la mise en veille.\e[1;37m"
sleep 1

echo -e "\e[0;31mL'ordinateur va se mettre en mode borne dans 5s...\e[1;37m"
sleep 1

echo -e "\e[0;31mL'ordinateur va se mettre en mode borne dans 4s...\e[1;37m"
sleep 1

echo -e "\e[0;31mL'ordinateur va se mettre en mode borne dans 3s...\e[1;37m"
sleep 1

echo -e "\e[0;31mL'ordinateur va se mettre en mode borne dans 2s...\e[1;37m"
sleep 1

echo -e "\e[0;31mL'ordinateur va se mettre en mode borne dans 1s...\e[1;37m"
sleep 1

reboot
