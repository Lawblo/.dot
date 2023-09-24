if ! [ -d ~/.config ];
then 
	mkdir /home/thorkil/.config
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

home_dir=/home/thorkil

createSymlink $home_dir/.linux_setup/nvim $home_dir/.config/nvim
createSymlink $home_dir/.linux_setup/tmux $home_dir/.config/tmux
createSymlink $home_dir/.linux_setup/zsh/zshrc $home_dir/.zshrc
createSymlink $home_dir/.linux_setup/gitconfig $home_dir/.gitconfig


apt install zsh -y

# setup git

if ! [ -f /etc/apt/sources.list.d/git-core-ubuntu-ppa-jammy.list ];
then 
	add-apt-repository ppa:git-core/ppa
fi

apt update && upgrade

if ! [ -f $HOME/.ssh/id_rsa.pub ];
then 
	# generate ssh key 
	ssh-keygen -t rsa -b 4096 -C "schjodt.thorkil@gmail.com"
fi

echo "Add ssh-key to https://github.com/settings/keys:\n"

cat $HOME/.ssh/id_rsa.pub

read -p "continue when key added to github"
ssh -T git@github.com

git submodule init
git submodule update
