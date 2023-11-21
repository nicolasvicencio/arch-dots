#/bin/bash 

# Update yay
yay -Syyu 

# Install base packages
yay -S base-devel anki neovim kvantum lsd bat noto-fonts-emoji mpv python-pip ripgrep bitwarden lazygit npm pnpm zsh steam github-cli discord p7zip btop  ttf-jetbrains-mono-nerd cava-git vivaldi graphicsmagick gs lf wl-clipboard wine ttf-font-awesome ttf-iosevka-nerd ttf-material-design-icons-extended qbittorrent spotify spotify-adblock winetricks waybar-hyprland hyprland rofi dunst kitty gammastep swaybg swaylock-effects swayidle pamixer light brillo wlogout qt5ct wofi slurp swappy grim swww noto-fonts noto-fonts-cjk noto-fonts-tc ttf-tw adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts pavucontrol
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

# Apply Zsh config
cp .zshrc $HOME/.zshrc

# Install configs
cp -r .config/* $HOME/.config
sudo cp -r etc/* /etc/

# Default rustup
rustup default stable

echo 'Log out and restart your machine'
