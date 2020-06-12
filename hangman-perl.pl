#!/usr/bin/perl

use strict;
use warnings;
use feature qw(switch);
use Data::Random::WordList;

sub start_art {
	system 'clear';
	my $start = <<endart;


		 _______________________________________________________________
		|								|
		|	   ____     		 				|		
		|	  |    |    		Find the word,			|    
		|	  |    o 		  Save the man!			|
		|	  |   /|\\   		 				|	
		|	  |    |    		 				|	
		|	  |   / \\   		 				|	
		|	 _|_        		 				|	
		|	|   |___________________ 				|	
		|	|          		|				|
		|	|   	HANGMAN	        |				|	
		|	|          		|				|
		|	|_______________________|				|	
		|								|
		|	* Use full screen for the best experience *		|
		|_______________________________________________________________|



endart
	print $start;
}

BEGIN {
	sleep(1);
	start_art();
	sleep(1);
}

sub get_word { 
	my $wl = new Data::Random::WordList( wordlist => '/usr/lib/games/words' );
	my @rand_words = $wl->get_words(1);
	my $rand_word = $rand_words[0];
	$wl->close();
	return $rand_word;
}

sub how_to_play {
	start_art();
	print "\nHangman is a guessing game for two or more players.\n";
	print "One player thinks of a word and the other tries to \nguess it by suggesting letters within a certain number of guesses.\n";
	print "\nIn this computer version, the computer will assume \na word and you have to guess the letters of that word.\n";
	print "\n-> Be advised, you have can suggest a wrong letter only\n\t8 times after which the man will be hanged!\n";
	print "(Press enter to begin)";
	my $ready = <>;
	print "Here you go...";
	sleep(1);
}

sub view_of_man {
	my $view0 = <<endview0;













endview0

	my $view1 = <<endview1;   
  	   ____     		 											
  	  |    |    							    
  	  |    		  				
  	  |      		 									
  	  |       		 									
  	  |      		 									
 	 _|_        		 									
	|   |___________________ 								
	|          		|									
	|   		        |								
	|          		|									
	|_______________________|

endview1

	my $view2 = <<endview2;
  	   ____     		 											
  	  |    |    							    
  	  |    O	  				
  	  |      		 									
  	  |       		 									
  	  |      		 									
 	 _|_        		 									
	|   |___________________ 								
	|          		|									
	|   		        |								
	|          		|									
	|_______________________|

endview2

	my $view3 = <<endview3;
  	   ____     		 											
  	  |    |    							    
  	  |    O	  				
  	  |   /   		 									
  	  |       		 									
  	  |      		 									
 	 _|_        		 									
	|   |___________________ 								
	|          		|									
	|   		        |								
	|          		|									
	|_______________________|

endview3

	my $view4 = <<endview4;
  	   ____     		 											
  	  |    |    							    
  	  |    O	  				
  	  |   /|   		 									
  	  |       		 									
  	  |      		 									
 	 _|_        		 									
	|   |___________________ 								
	|          		|									
	|   		        |								
	|          		|									
	|_______________________|

endview4

	my $view5 = <<endview5;
  	   ____     		 											
  	  |    |    							    
  	  |    O	  				
  	  |   /|\\   		 									
  	  |       		 									
  	  |      		 									
 	 _|_        		 									
	|   |___________________ 								
	|          		|									
	|   		        |								
	|          		|									
	|_______________________|

endview5

	my $view6 = <<endview6;
  	   ____     		 											
  	  |    |    							    
  	  |    O	  				
  	  |   /|\\   		 									
  	  |    |   		 									
  	  |      		 									
 	 _|_        		 									
	|   |___________________ 								
	|          		|									
	|   		        |								
	|          		|									
	|_______________________|

endview6

	my $view7 = <<endview7;
  	   ____     		 											
  	  |    |    							    
  	  |    O	  				
  	  |   /|\\   		 									
  	  |    |   		 									
  	  |   /   		 									
 	 _|_        		 									
	|   |___________________ 								
	|          		|									
	|   		        |								
	|          		|									
	|_______________________|

endview7

	my $view8 = <<endview8;
  	   ____     		 											
  	  |    |    							    
  	  |    O	  				
  	  |   /|\\   		 									
  	  |    |   		 									
  	  |   / \\  		 									
 	 _|_        		 									
	|   |___________________ 								
	|          		|									
	|   		        |								
	|          		|									
	|_______________________|

endview8

	my @views = ($view0, $view1, $view2, $view3, $view4, $view5, $view6, $view7, $view8);
	start_art();
	print $views[$_[0]];
}

sub game_over {
	print "\nUh oh! You couldn't save the man\nThe word was \"".shift."\"\n";
	sleep(1);
	print "\nGAME OVER :-(\n\n";
	print "(Press enter to return to main_menu)";
	my $main_menu = <>;	
}

sub win {
	print "\nOh my God! You made it!!\nThe word was \"".shift."\"\n";	
	print "\n\tCongratulations! You saved the man\n\n";
	print "(Press enter to retrun to main menu)";
	my $main_menu = <>;
}

sub is_char_valid {
	my $checking = lc(shift);
	my $array_ref = shift;
	my $guessed = 0;
	my @array = @{$array_ref};
	if ((length($checking)!=1) or (ord($checking) > 122) or (ord($checking) < 97)) {
		print "[-] Invalid character, please re-enter";
		return 0;
	}
	else {
		foreach (@array) {
			if ($checking eq $_) {
		    	$guessed = 1;
		    	last;
		  	}
		}
		if ($guessed == 1) {
			print "[-] Alredy guessed! please re-enter";
			return 0;
		}
		else {
			return 1;
		}
	}
}

sub check_done {
	my ($guessedword_ref, $correctword) = @_;
	my $guessedword = join("", @{$guessedword_ref});
	if ($guessedword eq $correctword) {
	 	return 1;
	}
	else {
		return 0;
	} 
}

sub check_letter {
	my ($word, $g) = @_;
	if (index($word, $g) == -1) {
		return 0;
	}
	return 1;
}

sub fill_letter {
	my ($temp_ref, $char, $string) = @_;
	my @temp = @{$temp_ref};
	my $offset = 0;
	my $result = index($string, $char, $offset);
	while ($result != -1) {
	    $temp[$result] = $char;
	    $offset = $result + 1;
		$result = index($string, $char, $offset);
	}
	return @temp;
}

sub new_game {
	my @guessed_list = (); #array of guessed letters
	my @guesses = (); #array storing progress of word
	my $wrongs = 0; #var storing the count of wrong guesses
	my $guess; #var storing the guess by player;
	my $guessed_or_invalid; #var storing the validity of player's guess 
	my $letter_check = 0; #var storing the result of checkletter
	my $done = 0; #var storing status of game;
	my $rand_word = get_word();
	my $len = length($rand_word);
	for (my $i=0; $i < $len; $i++) {
	    $guesses [$i] = '_';
	}
	while (!$done and $wrongs<=8) {
		view_of_man($wrongs);
		if ($wrongs == 8) {
			game_over($rand_word);
			last;
		}
		print "Progress so far :\n";
		print join(" ", @guesses);
		print "\n\n\tGuessed : ( ".join(" ", @guessed_list)." )";
		do {
			print "\n\nEnter a letter: ";
			$guess = <>;
			chomp($guess);
			$guessed_or_invalid = is_char_valid($guess, \@guessed_list);
		}while(!$guessed_or_invalid);
		if ($guessed_or_invalid == 1) {
			push(@guessed_list, lc($guess));
		}
		$letter_check = check_letter($rand_word, $guess);
		if ($letter_check == 1) {
			@guesses = fill_letter(\@guesses, $guess, $rand_word);
		}
		else {
			$wrongs++;	
		}		
		$done = check_done(\@guesses, $rand_word);
		if ($done == 1) {
			win($rand_word);
		}
	}
}

sub menu {
	start_art();
	print "\n*-*-*-*-*-* MENU *-*-*-*-*-*\n";
	print "1. New game\n2. How to play?\n3. Exit\n\n\tEnter your choice : ";
	my $choice = <>;
	chomp($choice);
	return $choice;
}

sub main {
	my $opt; 
	do {
		$opt = menu();
		given($opt) {		
			when(1) { 
				print "Launching new game..."; 
				sleep(2);
				new_game();
			}
		 		
			when(2) { 
				print "How to play?";
				how_to_play(); 
			}		  		
		  		
		  	default { 
		  		print "Invalid input, re-enter" 
		  	}
		}	
	}while($opt!=3);
}


END {
	system 'clear';
	print "Thanks for playing!\n";
	print "Hope you enjoyed!\n";
}


main();


