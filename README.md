# hangman-perl
Hangman game designed in Perl

## Installation
### Installing on your Linux system :
Installation is extremely simple, make sure you have perl interpreter installed in your system.<br>
<br>
Copy and paste the following line in your terminal
```
$ curl -o install-hangman-perl.sh https://raw.githubusercontent.com/iamhrishikeshpadhye/hangman-perl/master/install-hangman-perl.sh && sudo bash install-hangman-perl.sh && rm install-hangman-perl.sh
```
Once the above command is successful, you can start the game in your terminal
```
$ hangman-perl
```
### Docker Installation :
If you wish to run it as a docker container follow this.<br>
Ensure that you have the `Dockerfile` in the directory where you are building the container.<br>
The `Dockerfile` is provided within this repository.<br>
It will require active Internet connection for building the image.<br>
```
$ git clone https://github.com/iamhrishikeshpadhye/hangman-perl.git
$ cd hangman-perl
$ docker build -t hangman-perl .
$ docker run -it hangman-perl
```


## Author

### Hrishikesh Padhye

* Twitter: [@Hrishi_says_so](https://twitter.com/Hrishi_says_so)
* Github: [iamhrishikeshpadhye](https://github.com/iamhrishikeshpadhye)

### Contributing

Contributions, issues and feature requests are welcome!<br />Feel free to check [issues](https://github.com/iamhrishikeshpadhye/hangman-perl/issues) page.

### Support this project :)

Give a ⭐️ if you like this!
