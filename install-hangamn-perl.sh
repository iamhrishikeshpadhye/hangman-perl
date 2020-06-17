#!/bin/bash

echo
echo
echo "   ____     		 									"
sleep .03
echo "  |    |    		Find the word,					    "
sleep .03
echo "  |    o 		  Save the man!				"
sleep .03
echo "  |   /|\   		 									"
sleep .03
echo "  |    |    		 									"
sleep .03
echo "  |   / \   		 									"
sleep .03
echo " _|_        		 									"
sleep .03
echo "|   |___________________ 								"
sleep .03
echo "|          		|									"
sleep .03
echo "|   	HANGMAN	        |								"
sleep .03
echo "|          		|									"
sleep .03
echo "|_______________________|								"
sleep .03
echo
echo
echo
echo
echo "		Welcome to the installation of hangman-perl		"
sleep 3
echo

if [[ $(id -u) -ne 0 ]] ; then 
	echo "[-] You need to run this as root, installation aborted" ; 
	exit 1 ; 
fi

echo
echo "The following changes will be made to your system :"
sleep .5
echo "1. A file named 'words' (3.7 MB) will be downloaded in /usr/lib/games/"
echo "2. The binary file for hangman-perl will be placed in /usr/bin/"
echo "3. Perl module Data::Random::WordList will be installed and updated"
sleep .5
read -p "Do you want to continue?(y/n)" -n 1 -r
echo    
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

if [[ ! -e /usr/lib/games/words ]]; then
    echo "[*] Wordlist not found, installing wordlist (/usr/lib/games/words)"
    sudo mkdir -p /usr/lib/games/
    sudo curl -o /usr/lib/games/words https://raw.githubusercontent.com/iamhrishikeshpadhye/hangman-perl/master/words/words
    echo "[+] Wordlist has be installed successfully (/usr/lib/games/words)"
else
	echo "[+] Wordlist already exists, skipping installation"
fi

if [[ ! -e /usr/bin/hangman-perl ]]; then
	echo "[*] Executable not detected in (/usr/bin/)"
	curl -o hangman-perl.pl https://raw.githubusercontent.com/iamhrishikeshpadhye/hangman-perl/master/hangman-perl.pl
	sudo chmod +x hangman-perl.pl
	sudo mv hangman-perl.pl /usr/bin/hangman-perl
	echo "[+] Executable has been installed successfully (/usr/bin/hangman-perl)"
else
	echo "[+] Executable already exists, skipping installation"

fi

perl -MCPAN -e "install Data::Random::WordList"

echo "..."
sleep 2
echo "[+] hangman-perl has been successfully installed"