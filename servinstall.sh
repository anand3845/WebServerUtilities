#!/bin/bash
# A menu driven shell script for WebServer
# Must be run with root user
# v0.2
## ----------------------------------
# Step #1: Define variables
# ----------------------------------
 
# ----------------------------------
# Step #2: User defined function
# ----------------------------------
pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}

#mysql installation
mysql(){
	echo "Starting mysql installation..."
        sudo apt install mysql-server php7.0-mysql
        mysql_secure_installation
}
 
# Apache installation
apache2(){
	sudo apt-get install apache2	
        
}


php5(){
	echo "Starting php5 installation..."
        sudo apt install php libapache2-mod-php
		/etc/init.d/apache2 restart
		php -r 'phpinfo();'
		
}


php5allext(){
	echo "Installing php5 extensions..."
        sudo apt-get install php7.0-gd
		/etc/init.d/apache2 restart
		php -r 'phpinfo();'
			
}

webmin(){
	echo "Installing Webmin..."
        sudo echo "deb http://download.webmin.com/download/repository sarge contrib" >> /etc/apt/sources.list
        sudo echo "deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib" >> /etc/apt/sources.list
        wget -q http://www.webmin.com/jcameron-key.asc -O- | sudo apt-key add -
        sudo apt-get update
        sudo apt-get install webmin
}

proftpd(){
	echo "Installing ProFtpd..."
		 sudo apt-get update
		 sudo apt-get install proftpd
		 sudo useradd sammy -p Akuku2025$ -d /var/www -s /bin/false
		 sudo passwd sammy
		 sudo usermod -a -G www-data sammy
		 sudo chown www-data:www-data /var/www/
		 sudo chmod -R 775 /var/www
}

bind9() {
	echo "INstall BIND DNS Server..."
	sudo apt-get -y -f install bind9	
}
 
# function to display menus
show_menus() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~"	
	echo " M A I N - M E N U"
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo "1. Install MySql"
	echo "2. Install Apache2"
	echo "3. Install PHP7"
	echo "4. Install PHP5 Extensions"
	echo "5. Install Webmin"
	echo "6. Install ProFtpd"
	echo "7. Install BIND"
	echo "8. Exit"
}
# read input from the keyboard and take a action
read_options(){
	local choice
	read -p "Enter choice [ 1 - 8] " choice
	case $choice in
		1) mysql ;;
		2) apache2 ;;
		3) php5 ;;
		4) php5allext ;;
		5) webmin ;;
		6) proftpd ;;
		7) bind9 ;;
		8) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}
 
# ----------------------------------------------
# Step #3: Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
trap '' SIGINT SIGQUIT SIGTSTP
 
# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do
 
	show_menus
	read_options
done
