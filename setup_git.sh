# setup git

if ! [ -f /etc/apt/sources.list.d/git-core-ubuntu-ppa-jammy.list ];
then 
	add-apt-repository ppa:git-core/ppa
fi

apt update && upgrade

git config --global user.name "thorkil"
git config --global user.email "schjodt.thorkil@gmail.com"
git config --global init.defaultBranch "main"

if ! [ -f $HOME/.ssh/id_rsa.pub ];
then 
	# generate ssh key 
	ssh-keygen -t rsa -b 4096 -C "schjodt.thorkil@gmail.com"
fi

echo "Add ssh-key to https://github.com/settings/keys:\n"

cat $HOME/.ssh/id_rsa.pub

read -p "continue when key added to github"
ssh -T git@github.com
