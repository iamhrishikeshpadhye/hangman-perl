FROM perl:5.20

COPY . /usr/src/myapp

WORKDIR /usr/src/myapp

RUN mkdir -p "/usr/lib/games"

RUN curl -o /usr/lib/games/words https://raw.githubusercontent.com/iamhrishikeshpadhye/hangman-perl/master/words/words

RUN perl -MCPAN -e "install Data::Random::WordList"

CMD [ "perl", "./hangman-perl.pl" ]

