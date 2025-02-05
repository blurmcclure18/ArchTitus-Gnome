#!/usr/bin/env bash
#-------------------------------------------------------------------------
#   █████╗ ██████╗  ██████╗██╗  ██╗████████╗██╗████████╗██╗   ██╗███████╗
#  ██╔══██╗██╔══██╗██╔════╝██║  ██║╚══██╔══╝██║╚══██╔══╝██║   ██║██╔════╝
#  ███████║██████╔╝██║     ███████║   ██║   ██║   ██║   ██║   ██║███████╗
#  ██╔══██║██╔══██╗██║     ██╔══██║   ██║   ██║   ██║   ██║   ██║╚════██║
#  ██║  ██║██║  ██║╚██████╗██║  ██║   ██║   ██║   ██║   ╚██████╔╝███████║
#  ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝   ╚═╝    ╚═════╝ ╚══════╝
#-------------------------------------------------------------------------

echo -e "\nINSTALLING AUR SOFTWARE\n"
# You can solve users running this script as root with this and then doing the same for the next for statement. However I will leave this up to you.

echo "CLONING: YAY"
cd ~
git clone "https://aur.archlinux.org/yay.git"
cd ${HOME}/yay
makepkg -si --noconfirm
cd ~
touch "$HOME/.cache/zshhistory"
git clone "https://github.com/ChrisTitusTech/zsh"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/powerlevel10k
ln -s "$HOME/zsh/.zshrc" $HOME/.zshrc

GNOMEPKGS=(
    'autojump'
    'awesome-terminal-fonts'
    'brave-bin' # Brave Browser
    'dxvk-bin' # DXVK DirectX to Vulcan
    'github-desktop-bin' # Github Desktop sync
    'gnome-shell-extension-pop-shell-git'
    'gnome-shell-extension-dash-to-dock'
    'mangohud' # Gaming FPS Counter
    'mangohud-common'
    'nerd-fonts-fira-code'
    'noto-fonts-emoji'
    'pamac-aur-git'
    'pop-icon-theme'
    'pop-gtk-theme'
    'ocs-url' # install packages from websites
    'ttf-droid'
    'ttf-hack'
    'ttf-meslo' # Nerdfont package
    'ttf-roboto'
    'zoom' # video conferences
    'snap-pac'
)

KDEPKGS=(
    'autojump'
    'awesome-terminal-fonts'
    'brave-bin' # Brave Browser
    'dxvk-bin' # DXVK DirectX to Vulcan
    'github-desktop-bin' # Github Desktop sync
    'lightly-git'
    'lightlyshaders-git'
    'mangohud' # Gaming FPS Counter
    'mangohud-common'
    'nerd-fonts-fira-code'
    'nordic-darker-standard-buttons-theme'
    'nordic-darker-theme'
    'nordic-kde-git'
    'nordic-theme'
    'noto-fonts-emoji'
    'pamac-aur-git'
    'papirus-icon-theme'
    'plasma-pa'
    'ocs-url' # install packages from websites
    'sddm-nordic-theme-git'
    'snapper-gui-git'
    'ttf-droid'
    'ttf-hack'
    'ttf-meslo' # Nerdfont package
    'ttf-roboto'
    'zoom' # video conferences
    'snap-pac'
)

LXQTPKGS=(
    'dxvk-bin' # DXVK DirectX to Vulcan
    'github-desktop-bin' # Github Desktop sync
    #'pamac-aur-git'
    'ocs-url' # install packages from websites
    'sddm-theme-sugar-candy-git'
    #'themix-full-git'
)

XFCEPKGS=(
    'dxvk-bin' # DXVK DirectX to Vulcan
    #'github-desktop-bin' # Github Desktop sync
    #'pamac-aur-git'
    #'ocs-url' # install packages from websites
    'sddm-theme-sugar-candy-git'
    #'themix-full-git'
)

BOTHPKGS=(
    'autojump'
    'awesome-terminal-fonts'
    'brave-bin' # Brave Browser
    'dxvk-bin' # DXVK DirectX to Vulcan
    'github-desktop-bin' # Github Desktop sync
    'gnome-shell-extension-pop-shell-git'
    'gnome-shell-extension-dash-to-dock'
    'lightly-git'
    'lightlyshaders-git'
    'mangohud' # Gaming FPS Counter
    'mangohud-common'
    'nerd-fonts-fira-code'
    'nordic-darker-standard-buttons-theme'
    'nordic-darker-theme'
    'nordic-kde-git'
    'nordic-theme'
    'noto-fonts-emoji'
    'pamac-aur-git'
    'papirus-icon-theme'
    'plasma-pa'
    'pop-icon-theme'
    'pop-gtk-theme'
    'ocs-url' # install packages from websites
    'sddm-nordic-theme-git'
    'snapper-gui-git'
    'ttf-droid'
    'ttf-hack'
    'ttf-meslo' # Nerdfont package
    'ttf-roboto'
    'zoom' # video conferences
    'snap-pac'
)

source ${HOME}/ArchTitus/desktopenv.conf

if [[ $desktopenv -eq 1 ]]
then
    PKGS=("${GNOMEPKGS[@]}")
elif [[ $desktopenv -eq 2 ]]
then
    PKGS=("${KDEPKGS[@]}")
elif [[ $desktopenv -eq 3 ]]
then
    PKGS=("${LXQTPKGS[@]}")
elif [[ $desktopenv -eq 4 ]]
then
    PKGS=("${XFCEPKGS[@]}")
else
    PKGS=("${GNOMEPKGS[@]}")
fi

for PKG in "${PKGS[@]}"; do
    yay -S --noconfirm $PKG
done

export PATH=$PATH:~/.local/bin
cp -r $HOME/ArchTitus/dotfiles/* $HOME/.config/
echo -e "\nDone!\n"
exit
