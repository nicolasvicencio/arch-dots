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

     yay -S hypridle hyprland hyprlock cava wlsunset bluez bluez-utils hyprpaper hyprpicker hyprpolkitagent hyprpwcenter hyprqt6engine hyprsunset hyprsysteminfo xdg-desktop-portal-hyprland neovim  vicinae-bin base-devel lsd bat brightnessctl rofi-emoji ripgrep python-pip lazygit npm pnpm zsh github-cli p7zip btop wl-clipboard waybar rofi-wayland dunst kitty pamixer light brillo wlogout slurp swappy grim swww pavucontrol nwg-look ranger vlc wget man neofetch imagewriter  gvfs unrar rustup eog waypaper polkit-gnome nemo  xdg-desktop-portal-gtk flatpak bazaar noctalia-shell polkit ly dysk
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
      sudo systemctl enable bluez.service
      sudo systemctl enable ly.service

      cp -rf .local/share/bin ~/.local/share
      # Apply Zsh config
      cp .zshrc $HOME/.zshrc
      break;;


      # Default rustup
esac
done
clear

while true; do 
read -p "Install Niri configs? (Y/n) " -n 1 hypr_res

case $hypr_res in
  [nN] )
      echo ""
      break;;
  * ) 
      echo -e "\n Installing niri packages";

     yay -S niri xdg-desktop-portal-gtk xdg-desktop-portal-gnome xdg-desktop-portal xwayland-satellite udiskie noctalia-shell cliphist matugen-git cava wlsunset ddcutil vicinae vivaldi fastfetch zsh bat lsd python-pip npm pnpm github-cli p7zip btop man vlc kitty imagewriter onlyoffice-bin rustup eog polkit-gnome krita flatpak bazaar zed qbittorrent spotify spotify-adblock audacity zathura zathura-pdf-mupdf android-studio-bin bluez bluez-utils sane hplip hplip-plugin mesa gnome-text-editor ly nautilus simple-scan hyprpicker lazygit dysk git wget btop fzf pulseaudio-alsa lib32-libpulse lib32-alsa-plugins hyrlock hypridle nwg-look 
     yay -S noto-fonts-emoji otf-san-francisco-mono ttf-iosevka-nerd ttf-jetbrains-mono-nerd ttf-font-awesome noto-fonts-cjk


      #Get configs
      cp -r niri/* $HOME/.config;
      sudo cp -rf theme/.icons/* /usr/share/icons;
      sudo cp -rf theme/.themes/* /usr/share/themes;
      sudoi cp -rf walls/* ~/Pictures
      gsettings set org.gnome.desktop.interface font-name 'Sans 9'

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
      sudo systemctl enable bluetooth.service
      sudo systemctl enable ly.service

      cp -rf .local/share/bin ~/.local/share
      # Apply Zsh config
      cp .zshrc $HOME/.zshrc

     # Retrieving hosts file
     wget https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts
     wait
     sudo mv hosts /etc/hosts

     git config --global user.name "Nicolas Vicencio"
     git config --global user.email "nicolas.vicencio.or@gmail.com"
    break;;


      # Default rustup
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
