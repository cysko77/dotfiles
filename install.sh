#!/bin/bash


copy_dir_from_dotfiles(){

    rm -fr ~/.$1
    mkdir -p -v $HOME/.$1/
    cp -p -i -v -r ~/dotfiles/$1/* $HOME/.$1/

}



link_dotfiles() {
    TARGET="$1"
    # the argument starts with a dot
    if [ "${TARGET:0:1}" == "." ] && [ ! -d dotfiles/"$TARGET" ] && [ ! -f dotfiles/"$TARGET" ]; then
        TARGET_WITHOUT_DOT="${TARGET:1}"
        ln -s -f -v $HOME/dotfiles/"$TARGET_WITHOUT_DOT" ./\."$TARGET_WITHOUT_DOT"
    else
        ln -s -f -v $HOME/dotfiles/"$TARGET" .
    fi
}


install_app() {

    while true; do
        RESET=$'\e[0m'
        REDBACK=$'\e[41;1m'
        GREEN=$'\e[32;1m'
        RED=$'\e[31;1m'
        read -e -p "Voulez-vous installer ${REDBACK} $1 ${RESET} ? (${GREEN}[O]ui${RESET} / ${RED}[N]on ${RESET}): " ANSWER
        ANSWER=`echo $ANSWER | tr '[:upper:]' '[:lower:]'`
        ANSWER=${ANSWER:-o}
        case $ANSWER in
            [o]* )
                APP=`echo $1`
                # Vérifier si le package standart a déja été installé (on prend par default l'app glances)
                if [ "standart_package" == "$APP" ]; then
                    APP="glances"
                fi
                # L'app est déja installé on le la réinstall pas
                if ! [ -x "$(command -v $APP)" ]; then
                    eval install_${1}
                    echo -e "\033[42m $1 \033[0m \033[32;1mest installé\033[0m"
                else
                    echo -e "\033[43m $1 \033[0m \033[33;1mest déjà installé\033[0m"
                fi
                break
                ;;
            [n]* )
                echo -e "\033[41m $1 \033[0m \033[31;1mn' a pas été installé\033[0m"
                break
                ;;
            * )
                echo -e "\033[31;1mMauvaise valeur !\033[0m"
                ;;
        esac
    done

}


install_nvim() {

    # https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu

    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt install -y python-dev python-pip python3-dev python3-pip neovim

    # setup a Python virtual environment for Neovim
    pip install neovim
    pip2 install --upgrade pynvim
    pip3 install --upgrade pynvim

    copy_dir_from_dotfiles "config/nvim"   

    # setup min-pac
    # https://github.com/k-takata/minpac
    git clone https://github.com/k-takata/minpac.git \
        ~/.config/nvim/pack/minpac/opt/minpac

    # install configured bundles
    nvim +PackUpdate +qa

}


install_spotify() {

    #https://www.spotify.com/fr/download/linux/
    curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt update
    sudo apt install -y spotify-client

}


install_herbstluftwm(){

    # tiling windows manager
    sudo apt install -y herbstluftwm
    link_dotfiles .xinitrc

    # Fichier de config herberstluftwm
    copy_dir_from_dotfiles "config/herbstluftwm"

}


install_polybar(){

    # Polybar https://github.com/polybar/polybar/wiki/Compiling
    sudo apt install -y build-essential git cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev

    # Make sure to type the `git' command as is to clone all git submodules too
    git clone --recursive https://github.com/polybar/polybar
    cd polybar
    mkdir build
    cd build
    cmake ..
    make -j$(nproc)
    # Optional. This will install the polybar executable in /usr/local/bin
    sudo make install
    cd

    # Fichier de config Polybar
    copy_dir_from_dotfiles "config/polybar"
}


install_dmenu(){

    sudo apt install -y  libx11-dev libxinerama-dev libxft-dev
    git clone --recursive https://github.com/bmc0/dmenu
    cd dmenu
    sudo make clean install
    cd

}


install_standart_package() {

    # repository pour typora
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
    sudo add-apt-repository 'deb https://typora.io/linux ./'

    sudo apt update && sudo apt -y upgrade && sudo apt dist-upgrade
    sudo apt install -y software-properties-common curl dos2unix hashdeep git nocache p7zip-rar ssh composer tree unattended-upgrades unrar unzip xclip zip powerline fonts-powerline zathura feh compton rofi i3lock chromium-browser typora glances figlet


    # Copy config dotfile
    copy_dir_from_dotfiles "config/i3lock"
    copy_dir_from_dotfiles "config/rofi"
    copy_dir_from_dotfiles "config/base16-fzf"
    copy_dir_from_dotfiles "config/compton"
    copy_dir_from_dotfiles "config/background"

}

install_theme_nautilus(){

    copy_dir_from_dotfiles "themes" 
    # icon papirus
    sudo add-apt-repository ppa:papirus/papirus
    sudo apt-get update
    sudo apt install -y papirus-icon-theme
    copy_dir_from_dotfiles "config/gtk-2.0"
    copy_dir_from_dotfiles "config/gtk-3.0"


}

install_vifm(){

    sudo apt install -y libjpeg-dev zlib1g-dev vifm xorg openbox x11proto-xext-dev
    sudo pip3 install ueberzug
    #sudo pip3 uninstall pillow-simd
    sudo pip3 install pillow
    copy_dir_from_dotfiles "config/vifm"

}

install_font(){

    copy_dir_from_dotfiles "local/share/fonts"

}

install_fzf(){

    # https://github.com/junegunn/fzf#using-git
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install

    cd

    rm -fr ~/.zshrc
    link_dotfiles .zshrc
    
    rm -fr ~/.fzf.zsh
    link_dotfiles .fzf.zsh
    
    rm -fr ~/.fzf.bash
    link_dotfiles .fzf.bash
    
}

install_zsh() {

    sudo apt update
    sudo apt install -y zsh 
    chsh -s /bin/zsh
    rm -fr ~/.zshrc
    cd
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

install_plugin_oh_my_zsh(){

    rm -fr ~/.zshrc
    link_dotfiles .zshrc
    #https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    #https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

}


install_tmux(){

    sudo apt install -y tmux
    link_dotfiles .tmux.conf
    copy_dir_from_dotfiles "config/.base16-tmux"

}


install_theme(){

    sudo apt install -y  dconf-cli uuid-runtime
    #create profile TEST to work theme
    id=$(create_new_profile_gnome_terminal TEST)
    bash -c  "$(wget -qO- https://git.io/vQgMr)"
    install_theme_nautilus	

}

create_new_profile_gnome_terminal() {
    
    dconfdir=/org/gnome/terminal/legacy/profiles:
    local profile_ids=($(dconf list $dconfdir/ | grep ^: |\
                        sed 's/\///g' | sed 's/://g'))
    local profile_name="$1"
    local profile_ids_old="$(dconf read "$dconfdir"/list | tr -d "]")"
    local profile_id="$(uuidgen)"

    [ -z "$profile_ids_old" ] && local lb="["  # if there's no `list` key
    [ ${#profile_ids[@]} -gt 0 ] && local delimiter=,  # if the list is empty
    dconf write $dconfdir/list \
        "${profile_ids_old}${delimiter} '$profile_id']"
    dconf write "$dconfdir/:$profile_id"/visible-name "'$profile_name'"
    echo $profile_id
}


install_all(){

    install_app "standart_package"
    install_app "zsh"
    install_app "plugin_oh_my_zsh"
    install_app "fzf"
    install_app "font"
    install_app "tmux"
    install_app "theme"
    install_app "herbstluftwm"
    install_app "polybar"	
    install_app "dmenu"
    install_app "spotify"
    install_app "nvim"
    install_app "vifm"
    
    ln -fs ~/dotfiles/Images/Captures ~/Images/Captures
    ln -fs ~/dotfiles/Images/Wallpapers ~/Images/Wallpapers
    
    echo -e "\033[42;1mInstallation Terminé\033[0m"

}


copy_all_dir(){

    copy_dir_from_dotfiles "config/i3lock"
    copy_dir_from_dotfiles "config/rofi"
    copy_dir_from_dotfiles "config/base16-fzf"
    copy_dir_from_dotfiles "config/compton"
    copy_dir_from_dotfiles "config/vifm"
    copy_dir_from_dotfiles "config/background"
    copy_dir_from_dotfiles "config/herbstluftwm"
    copy_dir_from_dotfiles "config/polybar"
    copy_dir_from_dotfiles "config/nvim"   
    copy_dir_from_dotfiles "config/.base16-tmux"
    copy_dir_from_dotfiles "config/gtk-2.0"
    copy_dir_from_dotfiles "config/gtk-3.0"
    copy_dir_from_dotfiles "themes" 
    copy_dir_from_dotfiles "local/share/fonts"

}
