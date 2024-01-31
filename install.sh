#!/bin/bash

echo Installing MangoHud
cd /home/$USER/
mkdir MangoHudandGoverlay
cd /home/$USER/MangoHudandGoverlay/
# Define the GitHub repository URL
repo_url="https://api.github.com/repos/flightlessmango/MangoHud/releases/latest"

# Get the latest release tag
latest_tag=$(curl -s "$repo_url" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

# Find the asset download URL for the latest release tar.gz file
download_url=$(curl -s "https://api.github.com/repos/flightlessmango/MangoHud/releases/latest" | grep '"browser_download_url":' | grep -i 'tar.gz' | cut -d'"' -f4)

# Specify the download location
download_location="./MangoHud-$latest_tag.tar.gz"

# Specify the extraction directory
extracted_dir="./MangoHud-$latest_tag"

# Download the latest release using wget
wget "$download_url" -O "$download_location"

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "MangoHud $latest_tag tar.gz downloaded successfully."

    # Extract the tar.gz file
    tar -xzf "$download_location" -C .

    # Check if the extraction was successful
    if [ $? -eq 0 ]; then
        echo "MangoHud $latest_tag extracted successfully to $extracted_dir."
    else
        echo "Failed to extract MangoHud tar.gz. Please check the script and try again."
    fi
else
    echo "Failed to download MangoHud tar.gz. Please check the script and try again."
fi
cd /home/$USER/MangoHudandGoverlay/MangoHud
chmod +X /home/$USER/MangoHudandGoverlay/MangoHud/mangohud-setup.sh
/home/$USER/MangoHudandGoverlay/MangoHud/mangohud-setup.sh install

echo Installing Goverlay
cd /home/$USER/MangoHudandGoverlay/

# Define the GitHub repository URL
repo_url="https://api.github.com/repos/benjamimgois/goverlay/releases/tags/1.0"

# Get the latest release tag
latest_tag=$(wget -qO- "$repo_url" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

# Find the asset download URL for the latest release tar.xz file
download_url=$(wget -qO- "https://api.github.com/repos/benjamimgois/goverlay/releases/tags/1.0" | grep '"browser_download_url":' | grep -i 'tar.xz' | cut -d'"' -f4)

# Specify the download location
download_location="./goverlay-$latest_tag.tar.xz"

# Specify the extraction directory
extracted_dir="./goverlay-$latest_tag"

# Download the latest release using wget
wget "$download_url" -O "$download_location"

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "goverlay $latest_tag tar.xz downloaded successfully."

    # Extract the tar.xz file
    tar -xf "$download_location" -C .

    # Check if the extraction was successful
    if [ $? -eq 0 ]; then
        echo "goverlay $latest_tag extracted successfully to $extracted_dir."

        # Optionally, you can perform additional steps here if needed.
    else
        echo "Failed to extract goverlay tar.xz. Please check the script and try again."
    fi
else
    echo "Failed to download goverlay tar.xz. Please check the script and try again."
fi

echo Removing unneccessary files
rm /home/$USER/MangoHudandGoverlay/*gz
rm /home/$USER/MangoHudandGoverlay/*xz
wget https://raw.githubusercontent.com/benjamimgois/goverlay/main/data/icons/128x128/goverlay.png -O goverlay.png -P /home/$USER/MangoHudandGoverlay/
chmod +x /home/$USER/Downloads/desktopfile.sh
sudo /home/$USER/Downloads/desktopfile.sh
