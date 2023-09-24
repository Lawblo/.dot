apt install zsh -y

if ! [ -d ~/.config ];
then 
	mkdir ~/.config
fi

if ! [ -d ~/.oh-my-zsh ];
then 
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi


createSymlink() {
	if ! [ -L $2 ];
	then
		ln -s $1 $2
	else
		rm -rf $2
		ln -s $1 $2
	fi
}

createSymlink ~/.linux_setup/nvim ~/.config/nvim
createSymlink ~/.linux_setup/tmux ~/.config/tmux
createSymlink ~/.linux_setup/zsh/zshrc ~/.zshrc
