#! /usr/bin/bash
#! /etc/bin/bash
passuser() {
    username=$1
    sudo useradd -m $username
    sudo touch /home/$username/website.txt
    sudo chmod 400 /home/$username/website.txt
}
if [[ -f user_info.txt ]]
then
	while IFS= read -r username
	do
		if [ -z $(sudo cat /etc/passwd | grep Alice) ]
		then
        		passuser $username
		else
			echo "$username Already Exists"
    	done < user_info.txt
else
    read -p "Enter username: " username
    passuser $username
fi
