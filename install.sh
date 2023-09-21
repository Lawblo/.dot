
createFolder(){
	if [ -d $1 ];
	then
		echo $1 "already exists"
	else
		mkdir -p $1
	fi
}

createFolder "$HOME/.config"
