# Movie Advisor

The program entitled 'what_to_watch.rb' is the main file used to run the Movie Advisor.  This program was intended to serve as a Netflix Clone, prompting the user for input and providing the appropriate output for each scenario.  Currently, the program is able to withdraw information stored in text files from a movie rating study and deliver the ratings for a movie ID and the movie ID title.  

This program is still under development, and the data that supports this program is from the '90s. The program still needs to include the following features: displaying the most popular movie choices and displaying options based on user preference utilizing the Euclidean distance. If you are interested in contributing to this project and further collaboration towards its completion, please contact me, fork this repository, and/or make a pull request.

## Getting Started

The instructions below will help you retrieve a copy of the project to run on your local machine through the Terminal application. Please see deployment for notes on how to deploy the project on a live system.  The instructions provided are for macbook users.

### Prerequisities

You may need to install or update the following software.

Find Terminal - to run program
  1. Open Finder. Finder is available in the Dock.
  2. Select Applications from the side bar menu.  Then unfold the Utilities folder.
  3. Double click on Terminal to initialize.

Install Homebrew - to store program files properly
  1. Open up Terminal.
  2. Run `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
  3. Run `brew doctor`

Install rbenv & ruby-build - to install and compile different versions of Ruby code language
  1. Open up Terminal
  2. Run `brew install ruby-build rbenv`
  3. Run `echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile`

Install ruby 2.3.1 - or latest version of Ruby
  1. Close and reopen Terminal. `rbenv install 2.3.1`
  2. After quite some time, run: `rbenv global 2.3.1`
  
Once you have completed the above installation processes your system is ready to launch the program!

## Deployment

Please complete the following procedure to run the program on a live system:
  1. Open Terminal.
  2. Change your directory to the one that which you would like to save this project. `$ cd folder_name`
  3. Then run the commands `$ git clone https://github.com/kteich88/what_to_watch.git` and `$ cd what_to_watch`
  4. Type `what_to_watch.rb` to run the program.
  5. READ all instructions BEFORE adding input.

## Built With

* Atom

## Authors

* **Kristine Teichmann**

## Acknowledgments

* The Iron Yard - Durham

* Alyssa Pratt - for listening to and helping me implement my crazy ideas!

* Nate Semmler - for his guidance in rspec

* F. Maxwell Harper and Joseph A. Konstan. 2015. The MovieLens Datasets: History and Context. ACM Transactions on Interactive Intelligent Systems (TiiS) 5, 4, Article 19 (December 2015), 19 pages. DOI=http://dx.doi.org/10.1145/2827872
