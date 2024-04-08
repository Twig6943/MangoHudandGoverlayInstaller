echo RUN AS NON-ROOT. THE SCRIPT WILL BEGIN IN 5 SECONDS.
sleep 3
/home/$USER/MangoHudandGoverlay/MangoHud/mangohud-setup.sh uninstall
rm -r /home/$USER/MangoHudandGoverlay/
sudo chmod +x /home/$USER/Downloads/uninstalldesktopfile.sh
sudo /home/$USER/Downloads/uninstalldesktopfile.sh
