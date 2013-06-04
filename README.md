# dotfiles #
How to prepare our environment?

## Pre-installation ##
1. Download [Linux Mint](http://www.linuxmint.com/download.php)
2. Burn on DVD
3. Boot up from DVD
4. [Install the system](http://www.youtube.com/watch?v=BEzH3liL3y4)
5. Install git: 

<code>
sudo aptitude install git-core
</code>

## Installation ##

### Download dotfiles ###

<pre>
cd ~
git clone git://github.com/fractalsoft/dotfiles ~/.dotfiles
</pre>

### Install packages (as root) ###

<code>
~/.dotfiles/sudo_install.sh
</code>

### Install Ruby (as user) ###

<code>
~/.dotfiles/install.sh
</code>

#### Sublime Text 2 (like IDE)  ####
All keys press in Sublime Text 2.

##### Install Sublime Text 2 Package Control #####
Press <code>Ctrl + `</code>.

Paste 
<pre>
import urllib2,os; pf='Package Control.sublime-package'; ipp=sublime.installed_packages_path(); os.makedirs(ipp) if not os.path.exists(ipp) else None; urllib2.install_opener(urllib2.build_opener(urllib2.ProxyHandler())); open(os.path.join(ipp,pf),'wb').write(urllib2.urlopen('http://sublime.wbond.net/'+pf.replace(' ','%20')).read()); print 'Please restart Sublime Text to finish installation'
</pre>
in command line and press enter.

##### Use Sublime Text 2 Package Control #####
1. Press <code>Ctrl + Shift + p</code>.
2. Write word <code>install</code> in the input. Select <code>Package Control: Install Package</code>.
3. Select interesting package and click.

##### Packages #####
- RSpec
- HTML5
- CoffeeScript

#### Chrome / Chromium ####

##### Plugins #####
- [Live Reload](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei)
- [Ruby on Rails API Search](https://chrome.google.com/webstore/detail/ruby-on-rails-api-search/nbhhppofdccphcpbilanmljnlkmbgike)
- [RubyGems](https://chrome.google.com/webstore/detail/rubygems/baahnimlijmfpliafcnagehjfbkknlfj)
- [Pretty JSON](https://chrome.google.com/webstore/detail/pretty-json/ddngkjbldiejbheifcmnfmmfiniimbbg)
- [W3C HTML5 & CSS3 Validator](https://chrome.google.com/webstore/detail/w3c-html5-css3-validator/kobpbiokkobnmnaefmpcodeeficgbfkg)
- [Adblock Plus](https://chrome.google.com/webstore/detail/empty-title/cfhdojbkjhnklbpkdaibdccddilifddb)

## Initialize ##

<pre>
cd ~
~/.dotfiles/init.sh
</pre>

## Use ##
TODO

## About us ##
We are on [Facebook](http://www.facebook.com/fractalsoft) and [Twitter](http://twitter.com/fractal_soft).
We are using language [Ruby](http://www.ruby-lang.org/) and framework [Ruby on Rails](http://rubyonrails.org/).
We like [Agile](http://agilemanifesto.org/), [Scrum](http://en.wikipedia.org/wiki/Scrum_%28development%29) and Lean Management.
We love [KISS](http://en.wikipedia.org/wiki/KISS_principle) solutions and [don't repeat yourself](http://en.wikipedia.org/wiki/Don%27t_repeat_yourself). 

## Links ##
- [Ruby](http://www.ruby-lang.org/) is a dynamic, open source programming language.
- [Try Ruby](http://tryruby.org/) without installation.
- [Ruby on Rails](http://rubyonrails.org/) is an open-source web framework.
- [Rails Casts](http://railscasts.com/) are amazing to learn. Thank you, Ryan.
- [Rails for Zombies](http://railsforzombies.org/) are fun and instructive.
- [Rubular](http://rubular.com/) is a Ruby regular expression editor.
- [CSS3, Please!](http://css3please.com/)
