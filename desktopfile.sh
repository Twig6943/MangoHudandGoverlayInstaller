# Prompt the user for their username
read -p "Enter your username: " username

echo Creating .desktop file for Goverlay
# Create a .desktop file for Goverlay
goverlay_desktop_file="/usr/share/applications/goverlay.desktop"
sudo echo "[Desktop Entry]" > "$goverlay_desktop_file"
sudo echo "Name=Goverlay" >> "$goverlay_desktop_file"
sudo echo "Exec=/home/USER_PLACEHOLDER/MangoHudandGoverlay/$extracted_dir/goverlay" >> "$goverlay_desktop_file"
sudo echo "Icon=/home/USER_PLACEHOLDER/MangoHudandGoverlay/$extracted_dir/goverlay.png" >> "$goverlay_desktop_file"
sudo echo "Type=Application" >> "$goverlay_desktop_file"
sudo echo "Categories=Utility;" >> "$goverlay_desktop_file"

# Replace USER_PLACEHOLDER with the actual username
sed -i "s|USER_PLACEHOLDER|$username|g" "$goverlay_desktop_file"
