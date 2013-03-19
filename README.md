## Installing Watir on MAC OS

### Assuming that Ruby and Rubygems are already installed, run:
	gem update --system --no-rdoc --no-ri
	gem install watir --no-rdoc --no-ri
	gem update watir-webdriver

### Setting Chrome Webdriver 
*[Download Chrome webdriver](http://code.google.com/p/chromedriver/downloads/detail?name=chromedriver_mac_23.0.1240.0.zip&can=2&q=)*
* Copy it to usr/bin
* Open irb on Terminal <br/>
	require 'watir' <br/>
 	Watir::Browser.new :chrome
