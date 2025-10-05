#!/bin/bash 
echo -e "${GREEN}"
cat <<"EOF"
___  ___       ______      _    __ _ _           
|  \/  |       |  _  \    | |  / _(_) |          
| .  . |_   _  | | | |___ | |_| |_ _| | ___  ___ 
| |\/| | | | | | | | / _ \| __|  _| | |/ _ \/ __|
| |  | | |_| | | |/ / (_) | |_| | | | |  __/\__ \
\_|  |_/\__, | |___/ \___/ \__|_| |_|_|\___||___/
         __/ |                                   
        |___/                                    

EOF
echo -e "${NONE}"

# ------------------------------------------------------
#thunar Check if yay is installed
# ------------------------------------------------------
echo -e "${NONE}"
if sudo pacman -Qs yay > /dev/null ; then
    echo "yay is already installed!"
else
    echo "yay is not installed. Will be installed now!"
    _installPackagesPacman "base-devel"
    SCRIPT=$(realpath "$0")
    temp_path=$(dirname "$SCRIPT")
    echo $temp_path
    git clone https://aur.archlinux.org/yay-git.git ~/yay-git
    cd ~/yay-git
    makepkg -si
    cd $temp_path
    echo "yay has been installed successfully."
fi
echo ""


#Update repos
echo "Remember update your packages repositories"
echo ""

while true; do 
read -p "Do you want to update now? (Y/n) " -n 1 upd_res

case $upd_res in
    [nN] ) 
      echo ""
      break;;
    * ) 
      yay -Syyu
      break;;
esac
done

clear


#Installing hyprland config and copy contents
while true; do 
read -p "Install Hyprland configs? (Y/n) " -n 1 hypr_res

case $hypr_res in
  [nN] )
      echo ""
      break;;
  * ) 
      echo -e "\n Installing hyprland packages";

     yay -S hypridle-git hyprland-git hyprlock-git hyprpaper-git hyprpicker-git hyprpolkitagent-git hyprpwcenter-git hyprqt6engine-git hyprsunset-git hyprsysteminfo-git xdg-desktop-portal-hyprland-git neovim  vicinae-bin base-devel lsd bat brightnessctl rofi-emoji ripgrep python-pip lazygit npm pnpm zsh github-cli p7zip btop wl-clipboard waybar rofi-wayland dunst kitty pamixer light brillo wlogout slurp swappy grim swww pavucontrol nwg-look ranger vlc wget man neofetch imagewriter  gvfs unrar rustup eog waypaper polkit-gnome nemo  xdg-desktop-portal-gtk flatpak flathub noctalia-shell
     yay -S noto-fonts-emoji otf-san-francisco-mono ttf-iosevka-nerd ttf-jetbrains-mono-nerd ttf-font-awesome 


      #Get configs
      cp -r .config/* $HOME/.config;
      sudo cp -rf theme/.icons $HOME/;
      sudo cp -rf theme/.themes $HOME/;
      sudo cp -rf .local/share/bin ~/.local/share/

      # Check and set Zsh as the default shell
      [[ "$(awk -F: -v user="$USER" '$1 == user {print $NF}' /etc/passwd) " =~ "zsh " ]] || chsh -s $(which zsh)

      # Install Oh My Zsh
      if [ ! -d ~/.oh-my-zsh/ ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended 
      else
        omz update
      fi

      # Install Zsh plugins
      git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
      git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
      git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

      # Enabling Bluetooth

      cp -rf .local/share/bin ~/.local/share
      # Apply Zsh config
      cp .zshrc $HOME/.zshrc
      break;;


      # Default rustup
esac
done
clear

#Installing personal packages
while true; do 
read -p 'Install Personal packages? (Y/n)' -n 1 base_res

case $base_res in 
  [nN] )
     echo ""
     break;;
  * )
     rustup default stable
     echo -e "\n Installing packages..."
     yay -S  bitwarden discord zen-browser-bin qbittorrent spotify spotify-adblock youtube-music obsidian audacity zathura zathura-pdf-mupdf

     # Retrieving hosts file
     wget https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts
     wait
     sudo mv hosts /etc/hosts

     break;;
esac
done
clear

while true; do 
read -p 'Install Pentesting tools? (Y/n)' -n 1 hack_res

case $hack_res in 
  [nN] )
     echo " "
     break;;
  * )
     #Blackarch repository
     curl -O https://blackarch.org/strap.sh
     chmod +x strap.sh
     sudo ./strap.sh
     sudo yay -Syu
     rm strap.sh

     sudo pacman -Syyu

     #Adding pentesting tools
     yay -S virtualbox nmap burpsuite wfuzz wireshark hydra metasploit aircrack-ng exploitdb netdiscover wpscan whatweb wafw00f sqlmap hashcat  dirb nikto dnsenum crunch steghide python-uncompyle6 enum4linux openvpn gobuster wireshark aircrack-ng john smbmap

     sudo modprobe vboxdrv
     sudo modprobe vboxnetflt

     git clone https://github.com/danielmiessler/SecLists 
     wait
     sudo mv Seclists /usr/share/

     wget https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt 
     wait
     sudo mv rockyou.txt /usr/share/SecLists

     break;;
esac
done



echo 'Log out and restart your machine'
