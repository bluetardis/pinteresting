# OneMonth - PB Notes

This is the pinteresting sample for:

[Pinteresting C9](https://pinteresting-peterbishop.c9users.io)

[Pinteresting Heroku](http://pinteresting123.herokuapp.com)

by [Blue Tardis](https://bluetardis.com)

-----
# Ruby

## Check the version
```
rails -v
```

### Reinstall (if needed eg rails broken)
You need to specify the version.
```
rvm reinstall ruby-2.3.0
```
See here for some hints on troubleshooting
https://rvm.io/rubies/default



## Create new workspace
(This is already done for Cloud9 if you picked a rails environment and is the ~/workspace)
```
rails new pinteresting
```


## Check that it actually works
### Start the Rails server
```
rails server -p $PORT -b $IP
```

-----
# GIT

## Git Resources

* [Learn Git Branching Game](http://pcottle.github.io/learnGitBranching/)
* [GitHub Guides youtube.com](http://www.youtube.com/user/GitHubGuides?feature=watch)
* [Try Git interactive lesson](http://try.github.io/levels/1/challenges/1)




## Git Setup - Local Config

```
git config --global user.name "Your Name"
git config --global user.name #checks that your name is correct
git config --global user.email "your@email.com"
git config --global user.email #checks that your email is correct
git init
ls -a
ls (after cd into folder)
git status #shows you what files you are tracking (or not tracking)
git add . (or -A to add all)
git commit -am "initial commit"
```


## Git Setup - Server Config for GitHub etc.

### generate a key ssh (CLOUD9 already as this done)
```
ssh-keygen -t rsa -C "peter@bluetardis.com.au"
```

### Test the connection
```
ssh -T git@github.com
```

### If all good then go to Git and create a repository
[Link to Github New Repository](https://github.com/new)

### What Git Origin are we connected to?
*(What is the Upstream)*
```
git remote show origin
```

### Push up based on the info from Git for the new repository 
(Choose the SSH Option to generate the commands)
```
git remote add origin git@github.com:bluetardis/pinteresting.git
git push -u origin master
```


## The normal git dance
```
gid add .
git commit -am "What changed"
git push
```


## How to Recover/roll back using Git
*In case we stuff something up somewhere*
```
git checkout -f #brings us back to the last version
```

## Helpful Git Aliases 
```
git config --global alias.co checkout
git config --global alias.cob "checkout -b"
git config --global alias.ci commit
git config --gbloal alias.dif diff
git config --global alias.s status
git config --global alias.br branch
git config --global alias.l log
git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
```



-----
# Rails WhiteList / BugFix

This fixes the following error:
```
Cannot render console from 122.108.59.33! Allowed networks: 127.0.0.1

```


*Edit the /config/environments/development.rb and add this near the top*
```
Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
  
    #Fix error in dev by whitelisting
  class Application < Rails::Application
    config.web_console.whitelisted_ips = %w( 10.240.0.0/16 122.108.59.33 )
    #cloud9 and pb emu
  end
```


-----
# Stripe Integration

[https://stripe.com/docs/checkout/guides/rails](https://stripe.com/docs/checkout/guides/rails)


Notes: 

* PCI Compliant
* You receive a token rather than the users credit card information
* Comes with standard checkout but you can make custom forms

-----

# Creating the home page
```
rails generate controller pages home
```
This makes a homepage for us at
https://pinteresting-peterbishop.c9users.io/pages/home

We can go edit the files
*/app/views/pages/home.html.erb*

## fyi you can destroy pages with 
```
rails destroy whatever blah blah
```

## Commenting in .erb files

[ERB Formatting etc.](https://docs.puppet.com/puppet/4.10/lang_template_erb.html)

Use the following.  This can be placed either in line or to comment on a single line.

Its a good idea to comment start and end of blocks as they can get complicated later.


```
    <!== Prompt them to Login or SignUp -->
    #Do something here
    <!== End of if loop for blah -->
```


-----
# Set the Root Path with Routes
We need to go tell Rails how to route pages.

The file for this lives here
*/config/routes.rb*
and the initial line was generated when we made the home page

The home page is actually called the Root Route so we need to add that.  There are hints in the file itself.
```
root 'pages#home'
```


-----
# Make a page manually 
*use this to make from scratch rather than rails generate*

## Step1. Controller
*/app/controllers/pages_controller.rb*

We need to edit this to create other pages eg about...

edit eg copy the block from *home* and then change it to *about*
```
def about 
end 
```


## Step2. The View
*/views/pages/SOMETHING_GOES_HERE.html.erb*

make a new file eg "about.html.erb" and put something in it
```
<h1>About Us</h1>
<p>We are working on our App!</p>
```



## Step3. Fix the route 
This way rails can find it and do its magic stuff

*/config/routes.rb*
```
get "about" => "pages#about"    # create about_path
```


-----
# Embedded Ruby (.erb)
Embedded Ruby allows us to include ruby in the html file for realtime stuff
Ruby embeds are wrapped up like this with the *<%=  command  %>*
```
<%= *SOMETHING_GOES_HERE* %>
```


In HTML, a link with a stub looks like this
```
<a href="#">here</a>
```

In Ruby on Rails a link will look like this
```
<%= link_to "here", "#" %>
```

## Use ruby to make a link to another page on the site
We will add the routes later.
```
<p>Sign up <%= link_to "here", "#" %>.</p>

```

-----
# A note on SEO 
*Search Engine Optimisation*

## 1. Most Important: You need to provide good content 
SEO without good content, is bound to fail

Sustainable strategy - Having quality traffic

## 2. Each page targets one specific keyword (and maybe a second) 
* Figuring out what keyword to rank for requires research
* What terms are competitive?
* What are people searching for?
* Long-tail vs. Short-tail keywords

### Summary
* Each page or keyword should match.   (Darling Harbour vs Sydney)
* Use google adwords "Keyword Planner" to determine Competition vs Sweetspot.


## 3. Title Tag
HTML Title Tag - needs to include the keywords for that page to target

* Primary Keyword - Maybe Secondary Keyword | Brand Name
* Meta tags too (like keywords, description)


### META Tags to populate
```
title
description
keywords
```

## 4. The URL Matters
### Setup with keywords

* GOOD: 
### keep the keyword in the URL rather than generalisation.
Terms in the URL (eg. http://moz.com/learn/seo/on-page-factors)

* BAD: Not obscure numbers (eg. http://www.imdb.com/title/tt0468569/)

#### Refer to moz.com for SEO tips


## 5. Content is important
### Length:
You want at least 500 words per page for google to rank it.

### Density:
Keyword density is important (how many times do you use the keywords)

### Links
* It must link to and back from the page properly.


Then get as many links to this as possible:

* Post on Twitter
* Post on Reddit


-----
# Creating Navigation Links
Basic approach is to link to a page defined in *routes.rb*
```
  get "about" => "pages#about"
```

FYI - the general home path is *root_path*
```
<%= link_to "About", about_path %> 
<%= link_to "Home", root_path %>
```

We could do this for every page however if its a common element then we probably want to do something like the following.



# Navigation bar
Make it a little bit easier for users to move around your site with navigation links. In Rails, layouts make it really easy to create something (like a navigation bar) and have it show up on every page in your app.

*/views/layouts/application.html.erb*

This is the template that is the "theme" or for all pages.

Place this before the *<%= yield %>* if you want it as a header.


-----
# Bootstrap Installation and Initial Integration

## Resources
* Bootstrap 3 [GitHub Gem](https://github.com/twbs/bootstrap-sass): where you go to install the gem
* Bootstrap 3 [Main Site Documentation](http://getbootstrap.com/): where you go after installation to look at documentation on using Bootstrap styles and components
* [rubygems.org](http://www.rubygems.org/): the official Ruby Gems site



## Add the bootstrapp-sass gem to /Gemfile
Easiest way is to use gems.
Search google for "bootstrap sass gem"

Follow your nose for the readme.

Edit the *Gemfile*
```
gem 'bootstrap-sass'
```


### To install a Gem from github
If you need to do this for some reason.
```
gem 'gemname', github: 'thomas-mcdonald/bootstrap-sass', branch: '3'
```


## Install with bundle install
This is the best way to install any new gem.
```
bundle install
```


## Add Bootstrap to the Asset pipeline
*/app/assets/* is where our optimised pipeline is.
This has provision for images, java and stylesheets.

We will be working with stylesheets and need to make a new file.
Using the scss precompiler framework (.scss)

The name could be anything but we need something human readable
```
/app/assets/stylesheets/bootstrap_and_customization.css.scss
```

Edit this file and add the following:
```
@import 'bootstrap';
```

### What is the Application.css file?
```
app/assets/stylesheets/application.css

```
Application.css takes all the other files in your /stylesheets directory and combines them for when you run your app.


## Restart the server
Initially we will get an error if you havent stopped an restarted the server.  
Basically you need to do this anytime we touch *gems*

So find it *CTRL-C* and then
```
rails server -p $PORT -b $IP
```

-----
# Bootstrap Customization Part1

## What can I do?
Take a look at the site for live examples.

[BootStrap Examples](http://getbootstrap.com/getting-started/#examples)

*This includes templates. Check them out.*


## CSS Containers
**Note:** We need CSS Containers to make our pages responsive by default

We are going to stick them into containers.
So reference here: and look for the container example

*http://getbootstrap.com/css/#type*


### .container
Use .container for a responsive fixed width container.

```
<div class="container">
  ...
</div>
```

### container-fluid
Use .container-fluid for a full width container, spanning the entire width of your viewport.
```
<div class="container-fluid">
  ...
</div>
```


## 1. Add a container to your app!
We are going to use *.container* and add the info to *views/layouts/application.html.erb* above and below the *<%= yield %>* so it affects our pages.
/views/layouts/application.html.erb


*views/layouts/application.html.erb*

```
     <%= link_to "Home", root_path %>
     <%= link_to "About", about_path %>
     <div class="container">
          <%= yield %>
     </div>
```


### 2. Create a _header.html.erb partial (prep for the NAV Bar)
Its good practice to use partials so we dont have super cluttered files.  

It also allows code to be reused.
They always start with an _


We are going to start that now as otherwise the code for the Nav Bar will be crazy.

Create the file 
*app/views/layouts/_header.html.erb*

#### Notes on *Partials*
Basically this gives us a file that can be reused or stand on its own.

Also improves readability.

Make a new file in layouts and start it with an "_" 

In this case our file will be *_header.html.erb*

The *_* means its a partial and will be included as needed.


Move (Cut and Paste) the Navigation bar example we just put in *application.html.erb* 

We then need to tell Rails to include it so amend *application.html.erb* with the following based on where you want the partial you just made.
```
<%= render 'layouts/header' %>
```
**Note:** we have referenced it as "layouts/header" and *not*  "_header.html.erb"




### 3. Create link to partial

*app/views/layouts/application.html.erb*

```
     <%= render 'layouts/header' %>
```
This replaces our previous Home and About info and comes before the main app container with the yield statement.


### 4. Add the nav bar
This is an abbreviated version of the sample code with a few small changes incorporating our original ruby.  
Again refer to the Bootstrap site for examples.

*app/views/layouts/_header.html.erb*

```
<nav class="navbar navbar-default" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="#">Pinteresting</a>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav navbar-right">
      <li><%= link_to "Home", root_path %></li>
      <li><%= link_to "About", about_path %></li> 
    </ul>
  </div><!-- /.navbar-collapse -->
</nav>
```


#### The complete original Nav Bar file.
This is under the *Components* part of bootstrap so go find some examples.

*http://getbootstrap.com/components/#navbar*

This is the whole example.  We will replace the current basic header in *application.html.erb* with this and then edit to our needs.
Plenty of sample code and pretty cool

```
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Brand</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
```


### 5. Require Bootstrap's JavaScript
On the bootstrap pages, it calles out there there are *Plugin Dependency* requirements so we need to add them to ensure functionality.  
In this case its to support the Nav Links as the width shrinks and Bootstrap displays a Hamburger for Navigation.

*app/assets/javascripts/application.js*

The actual link needed is *//= require bootstrap-sprockets*

```
...
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .
```


### 6. Add viewport (Mobile Devices/IE Support)
We need to add a viewport to make it work nicely for mobile devices or Internet Explorer.

*views/layouts/application.html.erb*
```
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```

its important as to the order where these files go.  Here is a more complete example.
```
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    ...
    ...
    
```

### 7. Home Page: Jumbotron and Button Example

*views/pages/home.html.erb*

```
<div class="jumbotron">
	<h1>Welcome to my app!</h1>
  <p>Click here to <%= link_to "Sign up", "#", class: "btn btn-primary btn-lg" %></p>
</div>
```



-----

# Bootstrap Customization Part 2 (Typical tweaks)

## Edit the _header to your content.
Things to change:

* Brand
* Remove search if you dont need it ```<form to /form>```
* Populate or delete links on left or right hand sides.
* Same code as before

###Notes:
* we simplified this a lot for our project. Refer to the _header.html.erb
* we need to tweak the code a little more to make the button etc work (responsive component when shrunk)
* check out the code or bootstrap notes on *button* 


## JavaScript and other Dependencies
We have a button in the bar that doesnt work.  Time to add JavaScript support for bootstrap.

*/app/assets/javascripts/application.js*

We need to include the Bootstrap components and will do this AFTER jquery lines.
```
//= require bootstrap
```


## Mobile Device Support
The key word to look for is *"Viewport"* if you are searching

*http://getbootstrap.com/getting-started/*

**Notes** are on the Basic-Template page 
as of July 2016 it was the following lines which need to be included in the ```<head>``` of *application.html.erb*
```
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
```
Dont forget to stop and restart the rails server.


## Jumbotron
*/app/views/pages/home.html.erb*

### wrap things in the jumbotron
```
<div class="jumbotron">
  <h1>Welcome to my App!</h1>
  <p>Sign up <%= link_to "here", "#" %>.</p>
</div>
```

## Buttons
CSS components in bootstrap

http://getbootstrap.com/css/#buttons

Its not complete cut and paste but close.

*example from bootstrap*
```
<button type="button" class="btn btn-primary">Primary</button>
```


our code in the .html.erb
```
  <p>Click here to <%= link_to "Sign up", "#", class: "btn btn-primary btn-lg" %></p>
```

-----
# Bootstrap Customization Part3 (Colors, Fonts etc.)

## Design Resources

* [Variables](http://getbootstrap.com/customize/#variables-basics)
* [FlatUI Colors](http://flatuicolors.com/)
* Bootstrap 3 [GitHub Gem](https://github.com/twbs/bootstrap-sass): where you go to install the gem

### Notes
We will be working with *app/assets/stylesheets/bootstrap_and_customization.css.scss* file

The Variables link above shows the various variables we can change/customise.  For now we are going to select and manually overwrite the ones we need.
We need to comvest the @navbar-default-bg shown into $navbar-default-bg

We enter the variable and the new values **BEFORE** we @import 'bootstrap'; 

## Example 
```
$body-bg: #white;

$font-size-base: 14px;

$brand-primary: #47a1f8;

$headings-color: #47a1f8;

$navbar-inverse-bg: #47a1f8;
$navbar-inverse-link-color: white;

$jumbotron-bg: #f6fafd;
$jumbotron-heading-color: #47a1f8;
$jumbotron-font-size: ceil(($font-size-base * 1.3));
$jumbotron-heading-font-size: ceil(($font-size-base * 4.5));


@import 'bootstrap-sprockets';
@import 'bootstrap';
```

The variables site in resources shows the variables can be used to determine the variable name of what we want to change for anything in Bootstrap


## Navigation bar Alernative
*app/views/layouts/_header.html.erb*
```
<nav class="navbar navbar-inverse navbar-default" role="navigation">
```


## Custom Styles Example
app/assets/stylesheets/bootstrap_and_customization.css.scss
```
/*
$body-bg: #white;
white
f6fafd lightest grey
a8c7ec slate grey
ced5eb light grey
47a1f8 nice blue
e9d5e0 light pink
d1c7d7 pink grey
d192a1 dark pink
black

*/
$body-bg: #white;

$font-size-base: 14px;

$brand-primary: #47a1f8;

$headings-color: #47a1f8;

$navbar-inverse-bg: #47a1f8;
$navbar-inverse-link-color: white;
$navbar-default-bg: #47a1f8;
$navbar-default-link-color: white;
$navbar-default-brand-color: white;

$jumbotron-bg: #f6fafd;
$jumbotron-heading-color: #47a1f8;
$jumbotron-font-size: ceil(($font-size-base * 1.3));
$jumbotron-heading-font-size: ceil(($font-size-base * 4.5));


@import 'bootstrap-sprockets';
@import 'bootstrap';

.center {
  text-align: center;
}

.navbar-brand {
  font-weight: bold;
  }

.navbar-inverse .navbar-toggle {
  background-color: #ced5eb; /* Icon Background Color */
  border-color: #ced5eb; /* border color or transparent */
  float: right; /* Move navbar toggle to left, right etc */
}
.navbar-inverse .navbar-toggle .icon-bar {
  background-color: white; /* Whatever colour you want for icon lines */
}
.navbar-inverse .navbar-toggle .icon-bar:hover {
  background-color: #47a1f8; /* Changes toggle color on hover for lines if needed*/
}

```



## Fonts
* Go to here:  [Google Fonts](https://www.google.com/fonts)
* Add the fonts you want to your collection
* Choose to Embed
* Use the *Import* styles
* Import as per example at the top of the scss
```
@import url(http://fonts.googleapis.com/css?family=Lato:400,700);

```
* Name / use the font as speficied in the google info
```
$font-family-sans-serif:           'Lato', 'Helvetica Neue', Helvetica, Arial, sans-serif;
```


## Nav Bar within Container
*apps/views/layouts/_header.html.erb*

This gives more control on formatting etc
```
<nav class="navbar navbar-inverse navbar-default" role="navigation">
  <div class="container-fluid">     <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">     <!-- NavBar -->
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" <%= link_to "pinteresting", root_path %></a>
    </div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
        <li><%= link_to "Home", root_path %></li>
        <li><%= link_to "About Us", about_path %></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
```


## Add a "center Class" 
If you want to center the site.

*/app/assets/stylesheets/bootstrap_and_customization.css.scss*

You could use this to center elements as desired eg instead of a class="jumbotron", you could make class="jumbotron center" which would center everything.

```
.center {
  text-align: center;
}
```

-----
# Heroku etc

## Resources
* [Heroku](https://www.heroku.com/)
* [ToolBelt](https://toolbelt.heroku.com/)


## Update Heroku Toolbelt in Cloud9
```
wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
sudo apt-get update; sudo apt-get install heroku-toolbelt heroku
```

## Login to Heroku
```
heroku login
```

## Add ssh keys
```
heroku keys:add
```

## Create a new heroku app
Check out the regions first as you probably want the app where you store your data/s3.
[Heroku Regions Info](https://devcenter.heroku.com/articles/regions)

```
heroku create --generic create (probably dont want this)
heroku create --region sydney ##Put it in sydney
```

## Heroku Database Stuff
```
heroku rake db:reset
heroku rake db:migrate
```

## Migration Status for Rails/Heroku 
```
rake db:migrate:status			#rails dev
heroku rake db:migrate:status	#heroku
```

## Migration Rollback
```
rake db:rollback
```

## Heroku Logs
```
heroku logs --tail
```


## Clean up Database Gem for Dev vs Prod
*/gemfile*

You may need to frig around a little more if you have duplicate entries for sqlite3 etc

```
group :development, :test do
     gem 'sqlite3'
end

group :production do
     gem 'pg'
     gem 'rails_12factor'
end
```

### install
install and update but dont add PG locally.

*Once you run the bundle install --without production it will remember this for your environment in future*

```
bundle install --without production
```


## Git Deployment (update then push to heroku)
```
git add .
gitcommit -am "prep for Heroku or something meaningful"
git push master
git push heroku master
```

## Force Git Deployment 
If something gets stuffed up and we need to push/force.
```
git push -f heroku master #the -f forces the changes to save 
```

## rename our Heroku app
```
heroku rename NewNameGoes here ##eg pinteresting123
```

This ends up [here](https://pinteresting123.herokuapp.com)


## Open our app
Open in our local browser if we can.
*This WONT work in cloud9*

To do this you need to use heroku domains.
```
heroku open
```

-----

# DNS Setup and Hosting 

If needed.  Otherwise you can come back to this.

Customize your domain name in less than 5 minutes with *DNSimple*

## 1. Signup for an account at DNSimple
Free 6 month trial with the guys over at DNSimple exclusively for One Month Rails students. Enjoy!

Sign up for DNSimple 
(make sure to use the link: https://dnsimple.com/o/one-month-rails for the discount) 

## 2. Add your domain to Heroku
You can either do this in the terminal, or via heroku.com 

### Option 1: terminal (CLI)
You need to add both the core and www. domain
```
heroku domains #shows you the domains you have on heroku 
heroku domains:add omr-pinteresting.com 
heroku domains:add www.omr-pinteresting.com 
```

### Option 2: Heroku.com (Web Dashboard)
* Go to your Heroku Dashboard
* Choose your app and click "Settings"
* Enter your domain and click "Add"
* Note: Heroku now wants a credit card number before adding a custom domain to your app. 


-----
# Devise Installation (Authentication)
User authentication gem for rails

## Resources
* [Devise Documentation:](https://github.com/plataformatec/devise)
* [RubyGems:](http://rubygems.org)


 
## 1. Make sure you are using the correct version of Ruby in your Gemfile
### Terminal
```
ruby -v
```
Should return Ruby 2.1.2 or higher - use whatever it returns in your Gemfile.



### Gemfile
```
source 'https://rubygems.org'
ruby '2.1.2' #whatever was above
```


## 2. Add the Devise gem
### Gemfile
```
gem 'devise'
```

### Terminal / Installing Devise 

```
bundle install
```


## 3. Install Devise 
We are following the readme from the [Devise github page](https://github.com/plataformatec/devise)

```
rails generate devise:install
```
This will then give us some steps to follow.

### Devise secret key
*/config/initializers/devise.rb*

If devise asks or says it cannot find a secret key, copy and paste the key the terminal gives you and place it in your devise.rb like so:

(Run from the bash terminal)

```
Devise.setup do |config|
# The secret key used by Devise. Devise uses this key to generate
# random tokens. Changing this key will render invalid all existing
# confirmation, reset password and unlock tokens in the database.
  config.secret_key = "Enter key here if it doesn't exist"
# -
# -
# etc
end
```
**PB Note:** 
You probably want to use this rather than the actual key.  
You can then set the parameters via heroku dashboard or terminal
```
config.secret_key = ENV[ 'DEVISE_TOKEN_AUTH_SECRET_KEY' ]
```

#### Setting Heroku ENV Parameters
Either use the Heroku Dashboard or set/query from the terminal
```
heroku config   ##query all variables
heroku config:set DEVISE_TOKEN_AUTH_SECRET_KEY=***Something Secret***
```



## 4. Setting up Devise

These are the steps needed to get it installed on our app.  These come from the information provided to the terminal window after the prior step (Installing Devise)

### 1. Default URLs for mailer
[https://rubyonrailshelp.wordpress.com/2014/01/02/setting-up-mailer-using-devise-for-forgot-password/](https://rubyonrailshelp.wordpress.com/2014/01/02/setting-up-mailer-using-devise-for-forgot-password/)

We are going to add these to the bottom of the following files.
NOTE: This needs to be amended to suite our actual server etc.

*config/environments/development.rb*
```
# Mailer for Devise
config.action_mailer.default_url_options = { host: 'localhost', port: 8080 }
```

**Heroku wont send email on free dynos.. The config below needs to be there but its worth setting up SendGrid**
*config/environments/production.rb*
NOTE: This needs to be amended to suite our actual server etc. eg Heroku Name

```
  # Mailer for Devise
  config.action_mailer.default_url_options = { host: 'https://pinteresting123.herokuapp.com' }
  config.action_mailer.raise_delivery_errors = true
  #Rails.application.routes.default_url_options[:host] = 'https://pinteresting123.herokuapp.com'

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.default :charset => "utf-8"
  
  config.action_mailer.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: ENV["GMAIL_DOMAIN"],
  authentication: "plain",
  enable_starttls_auto: true,
  user_name: ENV["GMAIL_USERNAME"],
  password: ENV["GMAIL_PASSWORD"]
  }
  # End of Mailer Config
```


### 2. Set "Home" route
We've already set our home route. Check it out yourself:

*config/routes.rb*

```
root "pages#home"
```


### 3. Flash message

Flash messages are the messages on Websites that say "Thanks for log in" or "Thanks for signing up"
We are going to place this in the container before the YIELD

The following code makes a ruby block.
```
for each flash 
  do something 
end
```


#### Embedded ruby run vs display
<%= Will run embedded ruby and DISPLAY to the web client

<%  Will run embedded ruby but NOT show anything.



*app/views/layouts/application.html.erb*
```
<% flash.each do |name, msg| %>
     <%= content_tag(:div, msg, class: "alert alert-info") %>
<% end %>
```

### 4. Set precompile to "false" 
This is good practice for Heroku etc, and should save us some error messages in future

We want to place it within the Application Class, right at the end (before the end)

*config/application.rb*

```
config.assets.initialize_on_precompile = false
```

### 5. Install the Devise views
From the terminal terminal
```
rails generate devise:views
```
This will generate within the app/views/devise the pages we need to support authentication.

-----

# Devise Configuration and our Rails app
Again this is following the readme from the github gem for devise.

## 1. Generate a User model
```
rails generate devise user
```
This line above creates a User model for us and a new file: *app/models/user.rb*

The model interacts with our database
Go to db/migration and see the files there should be something like db/migration/20130922022322_devise_create_users.rb #the number is the date you create it

### Q: Did you make a mistake generating a model?
The following deletes the generate command in case you made a mistake
```
rails destroy devise user 
```


## 2. Migrate your database
```
rake db:migrate
```
This command takes the migration file and runs it, so that it generates tables in your database
We will also need to migrate in heroku.
```
heroku rake db:migrate
```


## 3. Restart your server
CONTROL + C to Stop the Server 
```
rails server -p $PORT -b $IP
```
You'll need to restart your application each time you install a gem or each time you run ```rake db:migrate```

-----
# Rails/Devise Configuration - New User Signup and Signin

## Find all your paths
```
rake routes
```
This lists all the paths available to your application.

* Sessions cover user sessions (when logged in etc.)
* Passwords 
* Registration.


## 1. Update your Home view
*app/views/pages/home.html.erb*

### First: fix the stubbed out paths. 
We can get these from the rake route command but we will need to add ```_path``` at the end of the line.

* signup: ```new_user_registration_path```
* login: ```new_user_session_path```


### Second: Add some logic to the page about the user status
*Read the Controller Filters and Helpers in the Devise readme from github*
```
if the user has signed in
  do something 
else
  do something different
end
```

Example


```
<div class="jumbotron">
  <h1>Welcome</h1>
  <p>Spicy jalapeno bacon ipsum dolor amet jowl dolor eu andouille turducken ribeye adipisicing meatloaf burgdoggen labore. Aliqua salami in hamburger pork chop dolore. Ut prosciutto in boudin, pariatur est dolore. Excepteur ut ham short loin ad laborum pork loin meatball short ribs. Ham et velit tenderloin beef ribs. Lorem turducken meatball, duis bresaola meatloaf fugiat ut mollit tri-tip tempor pig minim.
</p>

  <% if user_signed_in? %>
    <!== do something for our signed in users
    <p></p>  
    <p>Thanks for signing in :-)</p>    
  <% else %>
    <!== Prompt them to Login or SignUp
    <p></p>
    <p>
      <%= link_to "Log in", new_user_session_path,  class: "btn btn-default btn-lg" %>
      <%= link_to "Sign up", new_user_registration_path, class: "btn btn-primary btn-lg" %>
    </p>
  <% end %>  <!== user_sign_in block
</div>
```


## 2. Update your header partial

We want to update the header to include Logout or signout as appropriate

*app/views/layout/_header.html.erb*


Note that we are having to use a *method :delete* as the REST option for logout 
(we can get this from the rake routes and see its a DELETE not a GET)

```
      <ul class="nav navbar-nav navbar-right">
        <li><%= link_to "Home", root_path %></li>
        <li><%= link_to "About Us", about_path %></li>
        <!-- Show a signin or logout as appropriate -->
        <% if user_signed_in? %>
            <li><%= link_to "Log out", destroy_user_session_path, method: :delete %></li>
        <% else %>
            <li><%= link_to "Sign in", new_user_session_path %></li>
        <% end %> <!-- logic for user session -->
      </ul>

```

-----

# Enforcing Strong Passwords
We need to ensure we can enforce stronger (than default) passwords. Use this example then amend as needed.

## 1. Add a format validator to the password field
1. Let's add a requirement that all new passwords have some complexity requirements
2. By adding a regular expression to the password field in the user model. A regular expression is a way to check and see if certain characters are present in a string. You can learn more about regular expressions [here](http://en.wikipedia.org/wiki/Regular_expression)
3. In the User model, we want to add a password validator (we didn't have one before) and a :format field for the password:

*app/models/user.rb*

```
validates :password, :presence => true,
                     :on => :create,
                     :format => {:with => /\A.*(?=.{10,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\@\#\$\%\^\&\+\=]).*\Z/ }
```
                     
### Notes
*Notice that we don't have the following as they aren't needed:*

:confirmation => true // We don't have a password confirmation on our pinteresting app so this does nothing.

:length => // We don't need this because it gets set in the devise initializer at config/initializer/devise.rb



## 2. Regular expressions
Here is the regular expression we are using:
```
/\A.*(?=.{10,})(?=.*\d)(?=.*[a-z])(?=.*[A=Z])(?=.*[\@\#\$\%\^\&\+\=]).*\Z/
```


## 3. Understanding Regular Expressions.

* Let's break this down into smaller pieces so we can understand it.
* Let's start with the beginning and the end
* Regular expressions exists between two forward slashes, and anything in between is what we want to match. Check this out:
```
/ this is what we match between the forward slashes / 
```

Next, we want to make sure we match everything in the string, starting from the very beginning all the way to the end, so we include the following two special regular expression characters:

```
/\A this is what we match between the forward slashes \Z/ 
```
Everything else in our regular expression is grouped in (). 
Let's look at each of these groups individually. 
One thing you will notice is the following construct:
```
(?=.*   SOMETHING WE WANT TO MATCH   )
```

How this works is that is creates a group which is "looking ahead" in the string to match "SOMETHING WE WANT TO MATCH".  These look forward in the string to identify a pattern, matching anything (.) zero or more times followed by whatever we want to match.  We reuse this over and over in our regular expression to match different things, like numbers, special characters, etc. 

* First, we match for at least 10 characters:
```
(?=.{10,})
```

* Next, we match for digits (numbers), using "\d":
```
(?=.*\d)
```

* Then, we match a lowercase alphabet character:
```
(?=.*[a-z])
```

* And then we match an uppercase alphabet character:
```
(?=.*[A-Z])
```

* This code matches a special character.  Note how each special character needs to be escaped using the "\" character:
```
(?=.*[\@\#\$\%\^\&\+\=])
```

1. Now, when we put those together, we ensure passwords are at least 10 characters long, contains a number,  a lowercase and uppercase letter, as well as a special character.
2. A great site to use to test and learn more about ruby regular expressions is rubular.
3. One thing to keep in mind when building regular expressions is that since you probably won't build them all the time, it can be a pain to remember how to do it correctly. I frequently use rubular and examples on the internet as references 
4. Edit the above as needed based on site specific needs...


## 4. Testing our changes

* On the homepage click on the ‘sign up’ button
* Try to sign up with a user with a weak password
* Click on ‘submit’ and you’ll get the message ‘password is invalid’, meaning our complexity requirements work!
* It's probably a good idea to update the sign up page to tell users we require strong passwords!

-----
 
# Styling Devise with Bootstrap.

## 1. Delete / Cleanup Scaffhold files *(Optional)*
*These are created by default by Devise.*

If we arent going to use these views then we can delete to cleanup.
I have left them in place for now as I think they are useful for later.
We arent styling them now but same examples would work as a basis.

Note: RTFM but generally enabled under */app/models/user.rb* 

eg ```devise: :recoverable``` means they can reset passwords


* app/views/devise/confirmations 
* app/views/devise/unlock 
* app/views/devise/mailer/confirmation_instructions.html.erb 
* app/views/devise/mailer/unlock_instructions.html.erb


## 2. Implement BootStrap for Devise Views
Use Bootstrap to make the forms look better

### Resource: [BootStrap Forms](http://getbootstrap.com/css/#forms)

### Make the Form Nicer
#### 1. Wrap a ```<div class="form-group">```  around the *INPUT* fields and also the *BUTTONS*.
There will probable already be something like ```<div class="field">``` and we need to change it to ```<div class="form-group">```

*If you are adding new then you will need to include the ```</div>``` at the end of the field.*


#### 2. Add ```class="form-control"``` to our *INPUT* fields.

Here we are using embedded ruby so we need to change
```
<%= f.email_field :email, autofocus: true %>
``` 
to be 
```
<%= f.email_field :email, autofocus: true, class: "form-control" %>
```

#### 3. Style our Buttons eg add ```class="btn btn-primary"``` to our *BUTTON* fields.

Here we are using embedded ruby so we need to change
```
<%= f.submit "Sign up" %>
``` 
to be 
```
<%= f.submit "Sign up", class: "btn btn-primary" %>

```

#### 4. Add some Panels to make the form look better

*Need to wrap the whole form in it*

##### Basic Panel
```
<div class="panel panel-default">
  <div class="panel-body">
    Basic Panel Example
  </div>
</div>
```
  
##### Basic Panel with a heading
```
<div class="panel panel-default">
  <div class="panel-heading">
    <h1>My Panel Heading</h1>
  </div>
  <div class="panel-body">
    Something else here
  </div>
</div>
```
  
##### Basic Panel with a heading and footer
```
<div class="panel panel-default">

  <div class="panel-heading">
    <h1>My Panel Heading</h1>
  </div>

  <div class="panel-body">
    Something else here
  </div>

  <div class="panel-footer">
    <h6>Blah Blah Blah!</h6>
  </dev>
</div>
```
  


##### Notes on *HASH_ROCKETS* and *COLONS*
We have added the class: at the end of the embedded ruby command.

Also as we are using Ruby 1.9.2 or greater we can use either *HASH_ROCKETS* or *COLONS*

For example:

```
autofocus: true
```

*is the same as*
```
:autofocus ==> true
```

##### Form Error Messages

*minimum_password_length*
Needs to be investigated - possibly set this as follows in the Views Controller
*/app/*
```
@minimum_password_length = User.password_length.min
```
**PB Fix**
remove the following code in the form as we are covering it in the *models/user.rb*
```
    <% if @minimum_password_length %>
      <em>(<%= @minimum_password_length %> characters minimum)</em>
    <% end %>
```




*Below are some example files with all changes.*

#### app/views/devise/registrations/new.html.erb
```
<div class="panel panel-default">
  <div class="panel-heading">
    <h1>Sign up</h1>
  </div>

  <div class="panel-body">
    <%= form_for(resource, :as => resource_name, :url => registration_path(resource_name)) do |f| %>
      <%= devise_error_messages! %>

      <div class="form-group">
        <%= f.label :email %>
        <%= f.email_field :email, autofocus: true, class: "form-control" %>
      </div>

      <div class="form-group">
        <%= f.label :password %>
        <%= f.password_field :password, class: "form-control" %>
      </div>

      <div class="form-group">
        <%= f.submit "Sign up", class: "btn btn-primary" %>
      </div>
    <% end %>
  </div>

  <div class="panel-footer">
    <%= render "devise/shared/links" %>
  </div>
</div>
```


#### app/views/devise/registrations/edit.html.erb

```
<div class="panel panel-default">
  <div class="panel-heading">
    <div class="panel-title">
      <h1>Edit <%= resource_name.to_s.humanize %></h1>
    </div>
  </div>
  <div class="panel-body">
    <%= form_for(resource, :as => resource_name, :url => registration_path(resource_name), :html => { :method => :put }) do |f| %>
      <%= devise_error_messages! %>

      <div class="form-group">
        <%= f.label :email %>
        <%= f.email_field :email, class: "form-control", :autofocus => true %>
      </div>

      <div class="form-group">
        <%= f.label :password %> <i>(leave blank if you don't want to change it)</i>
        <%= f.password_field :password, class: "form-control", :autocomplete => "off" %>
      </div>

      <div class="form-group">
        <%= f.label :current_password %> <i>(we need your current password to confirm your changes)</i>
        <%= f.password_field :current_password, class: "form-control" %>
      </div>

      <div class="form-group">
        <%= f.submit "Update", class: "btn btn-primary" %>
      </div>
    <% end %>
  </div>
  <div class="panel-footer">
    <h3>Cancel my account</h3>

    <p>Unhappy? <%= button_to "Cancel my account", registration_path(resource_name), :data => { :confirm => "Are you sure?" }, :method => :delete, class: "btn btn-warning" %></p>

    <%= link_to "Back", :back %>
  </div>
</div>
```


#### app/views/devise/passwords/new.html.erb
```
<div class="panel panel-default">
  <div class="panel-heading">
    <div class="panel-title">
      <h1>Forgot your password?</h1>
    </div>
  </div>
  <div class="panel-body">
    <%= form_for(resource, :as => resource_name, :url => password_path(resource_name), :html => { :method => :post }) do |f| %>
      <%= devise_error_messages! %>

      <div class="form-group">
        <%= f.label :email %>
        <%= f.email_field :email, class: "form-control", :autofocus => true %>
      </div>

      <div class="form-group">
        <%= f.submit "Send me reset password instructions", class: "btn btn-primary" %>
      </div>
    <% end %>
  </div>
  <div class="panel-footer">
    <%= render "devise/shared/links" %>
  </div>
</div>
```


#### app/views/devise/passwords/edit.html.erb
```
<div class="panel panel-default">
  <div class="panel-heading">
    <div class="panel-title">
      <h1>Change your password</h1>
    </div>
  </div>
  <div class="panel-body">
    <%= form_for(resource, :as => resource_name, :url => password_path(resource_name), :html => { :method => :put }) do |f| %>
      <%= devise_error_messages! %>
      <%= f.hidden_field :reset_password_token %>

      <div class="form-group">
        <%= f.label :password, "New password" %>
        <%= f.password_field :password, class: "form-control", :autofocus => true %>
      </div>

      <div class="form-group">
        <%= f.label :password_confirmation, "Confirm new password" %>
        <%= f.password_field :password_confirmation %>
      </div>

      <div class="form-group">
        <%= f.submit "Change my password", class: "btn btn-primary" %>
      </div>
    <% end %>
  </div>
  <div class="panel-footer">
    <%= render "devise/shared/links" %>
  </div>
</div>
```


#### app/views/devise/sessions/new.html.erb
```
<div class="panel panel-default">
  <div class="panel-heading">
    <div class="panel-title">
      <h1>Sign in</h1>
    </div>
  </div>
  <div class="panel-body">
    <%= form_for(resource, :as => resource_name, :url => session_path(resource_name)) do |f| %>

      <div class="form-group">
        <%= f.label :email %>
        <%= f.email_field :email, class: "form-control", :autofocus => true %>
      </div>

      <div class="form-group">
        <%= f.label :password %>
        <%= f.password_field :password, class: "form-control" %>
      </div>

      <div class="form-group">
        <div class="help-block">
          <%= f.check_box :remember_me %>
          <%= f.label :remember_me %>
        </div>
      </div>

      <div class="form-group">
        <%= f.submit "Sign in", class: "btn btn-primary" %>
      </div>
    <% end %>
  </div>
  <div class="panel-footer">
    <%= render "devise/shared/links" %>
  </div>
</div>
```


## 3. Add an "Account Settings" link to the header Partials
### *app/views/layouts/_header.html.erb*
```
.
.
.
          <li><%= link_to "Account Settings", edit_user_registration_path %></li>
.
.
.
```


-----

# Pins and Scaffhold (Model View Controller)

## 1. Generate a pins scaffold 
Here we generate the scaffold (MVC) for a Resource Pins and then Migrate the database so it exists.
This also creates the routes.

```
rails generate scaffold pins description:string
rake db:migrate #run the migration
```


## 2. Delete the default scaffold CSS
This file gets created with scaffold, and messes up the rest of your CSS, so just delete it

*app/assets/stylesheets/scaffolds.css.scss*

### Q: Could I tell Rails, "Hey bud, just don't install that ugly default scaffold stylesheet?"
Yes you could:

```
rails generate scaffold pins description:string --skip-stylesheets
```

This creates the database table and route and all CRUD screens.

-----
# Rails and Resources (CRUD)
In Rails a resource in anything you can Create/Read/Update/Destroy
Create  POST
Read    GET
Update  PUT
Destroy DELETE

## Notes

### Create 
Rails crates a *new_pin* path which has a GET.  This gets turned into a Create/POST when you *Submit* or *Create* the "Go do it" action which is why the Create doesnt have a page of its own. (its only called once the new is all filled out.)
Only the Routes with *prefixes* shown can have links created to them.

### Edit
Edit is always called with the resourceid eg /pins/:id/edit

This way RAILS knows which resource to RUD...

#### Examples
READ    /pins/1
UPDATE  /pins/1/edit
DESTROY /pins/1/delete


## Basic Example: (Twitter)
Users
Tweets
Sessions

## Start with Business Process to determine Resources
Create then style (MVC)
Model
View
Controller

## Routes
Things start with Routes.  To find all routes in the app
```
rake routes
```
Our scaffhold made 8 routes for the Model *pins*

URI  is basically the URL
Controller is the controller handling things

-----
# Pins  Controller

*app/controllers/pins_controller.rb*


## Original File
This is the file created by the scaffhold.
```
class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  # GET /pins
  # GET /pins.json
  def index
    @pins = Pin.all
  end

  # GET /pins/1
  # GET /pins/1.json
  def show
  end

  # GET /pins/new
  def new
    @pin = Pin.new
  end

  # GET /pins/1/edit
  def edit
  end

  # POST /pins
  # POST /pins.json
  def create
    @pin = Pin.new(pin_params)

    respond_to do |format|
      if @pin.save
        format.html { redirect_to @pin, notice: 'Pin was successfully created.' }
        format.json { render :show, status: :created, location: @pin }
      else
        format.html { render :new }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pins/1
  # PATCH/PUT /pins/1.json
  def update
    respond_to do |format|
      if @pin.update(pin_params)
        format.html { redirect_to @pin, notice: 'Pin was successfully updated.' }
        format.json { render :show, status: :ok, location: @pin }
      else
        format.html { render :edit }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pins/1
  # DELETE /pins/1.json
  def destroy
    @pin.destroy
    respond_to do |format|
      format.html { redirect_to pins_url, notice: 'Pin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:description)
    end
end
```


## Cleaned up Example (Not needed as PB likes having references.)

Cleaned up to remove
* Commented examples
* .JSON for API


```
class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  def index
    @pins = Pin.all
  end

  def show
  end

  def new
    @pin = Pin.new
  end

  def edit
  end

  def create
    @pin = Pin.new(pin_params)
    if @pin.save
      redirect_to @pin, notice: 'Pin was successfully created.'
    else
      render :new
    end
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Pin was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @pin.destroy
    redirect_to pins_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:description)
    end
end
```

## Notes
This file was generated from our Scaffhold and creates 7 actions and 2 private methods.

These actions map to our CRUD actions.

CREATE  New + Create
READ    Index + Show
UPDATE  Update + Edit
DESTROY Destroy

Again this goes back to having a page (enter information) and then the action (input the information to the model)



## Controller and Views
The controller finds WHAT we want from the MODEL.  The VIEW displays it.


In the *pins_controller.rb* we can see the main actions
for example
```
def index
  @pins = Pin.all
end
```

### Notes
* This predefines the Resource we will be dealing with.  In this case "all"
* Unless a view is specically mentioned then it will use the view from views with the same name as the action.  In this case *app/views/pins/index.html.erb*
* The index view mentioned above, starts with a table.  The top are heading rows.  Then we loop through the data.  
* In the views, eg ```link_to 'Show', ``` *path* specific pin eg /pins/1 could be either ```pin_path(pin)``` or just ```pin```
* We can see that it has created a _form.html.erb partial for New and Edit


### Updating the Pin View form partial.

This is called from *apps/views/pins/new.html.erb*
```
<%= render 'form' %>
```


Here is the updated file.  We are styled with Bootstrap as per previous notes.
*apps/views/pins/_form.html.erb*
```
<%= form_for(@pin) do |f| %>
  <% if @pin.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(@pin.errors.count, "error") %> prohibited this pin from being saved:</h2>

      <ul>
      <% @pin.errors.full_messages.each do |msg| %>
        <li><%= msg %></li>
      <% end %>
      </ul>
    </div>
  <% end %>

  <div class="form-group">
    <%= f.label :description %>
    <%= f.text_field :description, class: "form-control" %>
  </div>
  <div class="form-group">
    <%= f.submit class: "btn btn-primary" %>
  </div>
<% end %>
```

-----

# Embedding YouTube Videos or Maps
Everything here uses iFrame.

## Vimeo
1. Goto the source (Vimeo) Site
2. Find the *Share* Option
3. Copy the *Embed* Code
4. Paste into your location on your website / code.
5. Fix the error.. you normally need to add http:// to the source
6. Edit as you prefer

### Options
You might get an options button.  This allows you to resize and otherwise play with the link created.


## YouTube
1. Goto the source (YouTube) Site
2. Find the *Share* Option
3. Copy the *Embed* Code
4. Paste into your location on your website / code.
5. Fix the error.. you normally need to add http:// to the source
6. Edit as you prefer

### Options
You will get options.  This allows you to resize and otherwise play with the link created.


## Maps
1. Goto the source (Google Map) Site.  Find and zoom your location.
2. Click the *Embed* (Chains) Option
3. Copy the *Embed* Code
4. Paste into your location on your website / code.
5. Fix the error.. you normally need to add http:// to the source
6. Edit as you prefer

### Options
You will get options to customize.  This allows you to resize and otherwise play with the link created.

-----

# Adding Security and Relationships Part 1

## Rails Associations
[Guide to Associations:](http://guides.rubyonrails.org/association_basics.html)

## 1. Set up your associations (Relationships)

### A Pin belongs to a user 
A Pin belongs to a User and this is represented as  ``` belongs_to :user ``` and needs to be added to the pin model file.
*app/models/pin.rb*
```
class Pin < ActiveRecord::Base
	belongs_to :user
end
```
**This has to use the SINGULAR term eg *user* NOT *users* **


### A User has_many Pins  
A User has many Pins and this is represented as  ``` has_many :pins ``` and needs to be added to the pin model file.
*app/models/user.rb*
```
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pins
end
```



## 2. Start the Rails console
The Rails console allows us to interact directly with data in the database. You'll do this to update data directly, or mostly just for testing out Ruby code before bringing it into your project

```
rails console
```

### Once in the console...
This is to prove it cant see users yet (we still need a migrate)
```
> Pin.connection #This establishes a connection to the database (And spits out a LOT of unnecessary data)
> Pin.inspect #shows all of the parameters for a Pin 
> pin = Pin.first #make sure Pin.first is UPPERCASE
> pin.user
```

### Stop the Console when you're done
CONTROL + D #closes the Console 


## 3. Generate a new migration for a User's index
This is so the pins model can store the userID for indexing/locating.

```
rails generate migration add_user_id_to_pins user_id:integer:index
rake db:migrate
```


## 4. Let's see if it worked
Back in Rails console (in our terminal) let's set a User ID on a Pin.

```
> Pin.connection  #This establishes a connection to the database (And spits out a LOT of unnecessary data)
> Pin.inspect     #shows all of the parameters for a Pin 
> pin = Pin.first
> pin             #Check out the pin!
> pin.user_id = 1
> pin.save

> user = User.first 
> user.pins

#Now we can call these methods
> user.pins
> pin.user
```

## Rails Console Replace ALL
[https://apidock.com/rails/ActiveRecord/Base/update_all/class](https://apidock.com/rails/ActiveRecord/Base/update_all/class)

In case you need to do some work... here are some examples.  Dont forget to wrap the operation in ""

```
 # Update all billing objects with the 3 different attributes given
  Billing.update_all( "category = 'authorized', approved = 1, author = 'David'" )

  # Update records that match our conditions
  Billing.update_all( "author = 'David'", "title LIKE '%Rails%'" )

  # Update records that match our conditions but limit it to 5 ordered by date
  Billing.update_all( "author = 'David'", "title LIKE '%Rails%'",
                        :order => 'created_at', :limit => 5 )
```


-----

# Adding Security and Relationships Part 2

## What Are we doing?
### Saving Users_ID when we touch a pin.
We have a page to create/save/etc for Pins but now we have added a new field we also need to autocomplete with the ID of the user who owns the pin.
While we could pass this as a parameter, we will use a rails helper from Devise.  This way security is better as we are not allowing a user to "write" their own id from the browser.


### Adding Security 
EG setup so that you have to be logged on to see pins.
Users can edit their pins


## 1. Update the Pins Controller
We will be using a Devise helper called ```current_user``` to help us locate the userID to add to the pin table.

Keep in mind that the following example uses the "pruned" version of this without JSON etc.

The key areas we are touching are:
* new  
* create
We are changing the method from ```Pin.new``` to ```current_user.pins.build```


*app/controllers/pins_controller.rb*

```
class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  def index
    @pins = Pin.all
  end

  def show
  end

  def new
    #Original
    #@pin = Pin.new

    #Build a new pin with the userID already set from the current user
    @pin = current_user.pins.build
  end

  def edit
  end

  def create
    @pin = current_user.pins.build(pin_params)
    if @pin.save
      redirect_to @pin, notice: 'Pin was successfully created.'
    else
      render :new
    end
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Pin was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @pin.destroy
    redirect_to pins_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find_by(id: params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this pin" if @pin.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:description, :image)
    end
end
```


## 2. Update the pins index view to show the UsersID in the table.
Here we are going to add another column 

### Header
The easiest way is to copy the existing column header for description and then edit that to whatever we want to say.

```
<th>User</th>
```


### Data/Table
We then need to copy description in the loop and update to refer to something like pin.user_id
```
<td><%= pin.user_id %></td>
```


### Cleanup and Bug Fix for nil
We will show the user Email Rather than an ID
We also need to only show if it exists eg Dont error out on NULL.
```
<%= pin.user.email if pin.user %>
```

Or alternatively you could the Ruby "try" method….(I don't choose this one, but it's good to know about).
```
<%= pin.user.try(:email) %>
```



### Actual changes to the pins index view.
*app/views/pins/index.html.erb*
```
<p id="notice"><%= notice %></p>

<h1>Listing Pins</h1>

<table>
  <thead>
    <tr>
      <th>Description</th>
      <th>User</th>
      <th colspan="3"></th>
    </tr>
  </thead>

  <tbody>
    <% @pins.each do |pin| %>
      <tr>
        <td><%= pin.description %></td>
        <td><%= pin.user.email if pin.user %></td>
        <td><%= link_to 'Show', pin %></td>
        <td><%= link_to 'Edit', edit_pin_path(pin) %></td>
        <td><%= link_to 'Destroy', pin, method: :delete, data: { confirm: 'Are you sure?' } %></td>
      </tr>
    <% end %>
  </tbody>
</table>

<br>

<%= link_to 'New Pin', new_pin_path %>

```


## 3. Add devise User authentication at the CONTROLLER to make sure user is logged in
* Resource: https://github.com/plataformatec/devise

```
authenticate_user!
```

Keep in mind that where ```before_filter``` is referenced it can also be ```before_action```



We need to do this so we can do things like:

* Make sure the user is logged in before showing pins
* Make sure a user is logged in before creating
* only let a user edit their pins
* only let a user delete their pins
* *Once done we can add control to the controller and logic to the view*



### Add the before_action to your Pins Controller (an additional line):
*app/controllers/pins_controller.rb*
Here we are saying we need to authenticate the user for anything expect showing a pin or the index.
If we just wanted a specific thing eg Delete we could use ```only:``` instead of ```except```

```
before_action :authenticate_user!, except: [:index, :show]
```


## 4. Surround the VIEWs CRUD link with an "if" conditional
This way you can only CRUD for your pins. 
We need to do this for **index** and **show** and are removing the **Edit** and **Destroy** options until its your pin.



*app/views/pins/index.html.erb*
Note - we can use the variable pin.user as this is part of the loop defined already.

```
<% if pin.user == current_user %>
	<%= link_to 'Edit', edit_pin_path(pin) %>
	<%= link_to 'Destroy', pin, method: :delete, data: { confirm: 'Are you sure?' } %>
<% end %>
```







*app/views/pins/show.html.erb*
Note - here we have to use the @pin.user as this is what was defined by the CONTROLLER.


```
<% if @pin.user == current_user %>
  <%= link_to 'Edit', edit_pin_path(@pin) %> |
<% end %> 
<%= link_to 'Back', pins_path %>

```


## 5. Update the CONTROLLER 
This way users cant type in the EDIT or DELETE link from their browser
There is currently a method called ```set_pin```. It gets us the current pinID.

Security wise we only want to use it for R (read/index) and are going to need a new action for for C/U/D.
We need this to action to ensure a user can only edit their pins.
We are going to add a new method ```correct_user method``` to the CONTROLLER and then call it with a ```before_action```


*app/controllers/pins_controller.rb*

**Add a new Secure Method - correct_user** (This goes under private methods)

This checks the *pin_user_id* against the logged in *user_id*. 
If its not TRUE then you get redirected with an error message.


the ```notice:``` adds a flash message.

Note: We are using ```find_by``` as it won't raise an error if **nil** is retured.

```
    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this pin" if @pin.nil?
    end
```

**Call the Method - correct_user**

We need to tell the controller to run this as a before action.

In this code we are showing the "Current State" of the edits to the controller file but we are adding the correct_user only.

```
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
```



## 6. Fix the *New* option for VIEW index
Surround the "New Pin" link with an "if" conditional.

*app/views/pins/index.html.erb*

```
...
<% if user_signed_in? %>
  <%= link_to 'New Pin', new_pin_path %>
<% end %>
...
```


-----
# Paperclip ImageMagick install

ImageMagick is a gem for converting and formatting images. It's a requisite for Paperclip, so let's install it.

### Other options are:
* CarrierWave
* Amazon S3 image uploader


## Download ImageMagick
### Ubuntu/Cloud9
```
sudo apt-get update
sudo apt-get install imagemagick
```

[Note](https://community.c9.io/t/install-imagemagick/3608) you may get an error and need to try:
```
sudo add-apt-repository main
```


### Windows 
http://www.imagemagick.org/script/binary-releases.php#windows

### Mac 
http://cactuslab.com/imagemagick/

**Q: How do I know if I installed ImageMagick correctly?**
A: Open a new terminal window and run the command:
```
identify
```

You should get a response including something about ImageMagick's version.

-----


# PaperClip Gem Installation & Configuration
Paperclip is a gem that allows you to upload images


Later we want to replace with this as it moves the files direct to S3 without needing to save locally.
[https://devcenter.heroku.com/articles/direct-to-s3-image-uploads-in-rails](https://devcenter.heroku.com/articles/direct-to-s3-image-uploads-in-rails)



## 1. Install the paperclip gem 
[https://github.com/thoughtbot/paperclip](https://github.com/thoughtbot/paperclip)

### Update the Gemfile
*/Gemfile*
```
gem 'paperclip', '~> 4.2'
```


### Bundle Install
From the terminal run: 
```
$ bundle install 
```


## 2. Add Images to a Model (in this case Pin)
We need to update the model to tell rails it must have an attached file.  We are going to use a field name of "image".
The second line specifies what sort of images we accept.
For more information go [here](http://stackoverflow.com/questions/21897725/papercliperrorsmissingrequiredvalidatorerror-with-rails-4)

The specific code is below and goes after ```belongs_to :user```.
```
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]

```

**Notes**

* The ```:styles``` allows us to get rails to create multiple versions of the file when uploaded.  eg Medium/Thumb and we can define their sizes.
* Using ```:default_url => "/images/:style/missing.png"``` We can pass through a default URL for a missing image.


*/app/models/pin.rb*
```
class Pin < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
end
```


## 3. Generate a paperclip migration (for the model we just changed)
We have just told rails that the Pins Model has attached files.  Lets generate the migration for that now so we can get Paperclip to do its work.


### Generate a Migration for Pin/Image (above)
***Note** This will generate a migration with both an Up (do the migration) and a Down (rollback) method.
```
rails generate paperclip pin image
```


### Run and check the migration
```
rake db:migrate
rake db:migrate:status
```

### Restart your server after adding a gem file/migrations
```
^C
rails server -p $PORT -b $IP
```


## 4. Fix Pins Views (add image)
(Normally needs to be done for both edit and new views).  We are working on the pin form:

*/app/views/pins/_form.html.erb*


### Make the form type multipart:
Change:
```
<%= form_for(@pin) do |f| %>
```
To:
```
<%= form_for @pin, html: { multipart: true } do |f| %>
```

**Note** The ```do |f|``` defines what the fields are going to be referenced as in the form.  eg ```f.label :description``` etc. in the code below.

### Add the new image field.
Here we will put it above the description.

We are going to copy the existing code and change it.

#### Changes
*description*	becomes	*image*

*f.text_field*	becomes	*f.file_field*

```
.
.
.
  <div class="form-group">
    <%= f.label :image %>
    <%= f.file_field :image, class: "form-control" %>
  </div>
.
.
.
```



## 5. Update the Pins Controller for strong parameters
We need to specify we need an :image.

*/app/controllers/concerns/pins_controller.rb*

**Old:**
```
    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:description)
    end
```

**New**
```
    def pin_params
      params.require(:pin).permit(:description, :image)
    end
```


## 6. Update the pins show view
As per the paperclip readme.md.  Examples with styles as defined earlier.
```
<%= image_tag @pin.image.url %>
<%= image_tag @pin.image.url(:medium) %>
<%= image_tag @pin.image.url(:thumb) %>
```

In our case the code is ```<%= image_tag @pin.image.url %>``` and we are going to place it above the Description. Format/style as desired.

**Note** 

* We are going to get rid of the ```<p id="notice"><%= notice %></p>``` as this is redudant as its being done by the *flash messaging*
* We are using ```image_tag``` which is like ```link_to```


*/app/views/pins/show.html.erb*
```
<p>
  <%= image_tag @pin.image.url(:medium) %>
</p>
<p>
  <strong>Description:</strong>
  <%= @pin.description %>
</p>

<% if @pin.user == current_user %>
  <%= link_to 'Edit', edit_pin_path(@pin) %> |
<% end %> 
<%= link_to 'Back', pins_path %>
```


## 7. Update the pins index
We need to add the image to the main index. 
The key code changes are:

* In the Table header we are adding an image Description ```<th>Image</th>```
* In the Table Body we are add a link to the image and style ```<td><%= image_tag pin.image.url(:medium) %></pd>```

*/app/views/pins/index.html.erb*
Example of file with the changes made
```
<h1>Listing Pins</h1>

<table>
  <thead>
    <tr>
      <th>Image</th>
      <th>Description</th>
      <th>User</th>
      <th colspan="3"></th>
    </tr>
  </thead>

  <tbody>
    <% @pins.each do |pin| %>
      <tr>
        <td><%= image_tag pin.image.url(:medium) %></pd>
        <td><%= pin.description %></td>
        <td><%= pin.user.email if pin.user %></td>
        <td><%= link_to 'Show', pin %></td>
        <% if pin.user == current_user %>
          <td><%= link_to 'Edit', edit_pin_path(pin) %></td>
          <td><%= link_to 'Destroy', pin, method: :delete, data: { confirm: 'Are you sure?' } %></td>
        <% end %>

        
      </tr>
    <% end %>
  </tbody>
</table>

<br>
<% if user_signed_in? %>
  <%= link_to 'New Pin', new_pin_path %>
<% end %>

```


## 10. Commit changes
```
git add .
git commit -am "Add image upload with Paperclip"
git push
```

### only needed if you get an error in above
```
git config --global push.default matching
```

-----
# Connecting Amazon/S3/AWS Gem 
Heroku doesn't store images on the dynamos, so you need AWS (external storage) for that.  
There are two versions of the GEM (v1 and v2).  
We are going to be using the v2 version hard coded to v1.  In a later project we might build from scratch with v2.

Note: The Bucket gets used as the initial placeholder.  Under the bucket, the models and information required is stored eg *sandpit123/pins*


### Resources:
[Paperclip Documentation](https://devcenter.heroku.com/articles/paperclip-s3)
[AWS SDK V1](https://github.com/aws/aws-sdk-ruby/tree/aws-sdk-v1)
[AWS SDK v2](https://github.com/aws/aws-sdk-ruby)
[Migration](https://github.com/aws/aws-sdk-ruby/blob/master/MIGRATING.md)

## 1. Add the Amazon AWS Gem
*/Gemfile*
```
gem 'aws-sdk', '< 2.0'
```
We want to make sure we use the newest version of the aws-sdk gem BELOW the 2.0 release. 
This is because major updates (like moving from 1.x to 2.0) can break specific functionality we're using, and it's a pain to go back and fix. 

### Install with bundle install
```
bundle install
```


## 2. Add S3 credential placeholders
This tells Rails PRODUCTION, PaperClip that we want to use S3 for Storage.

[Reference Doco](http://www.rubydoc.info/gems/paperclip/Paperclip/Storage/S3)

This are telling Heroku to use Environment Variables.  We will set these specifically for Heroku shortly.
This is added at the end of the file.

*config/environments/production.rb*

```
  #This tells Rails PRODUCTION, PaperClip that we want: to use S3 for Storage.
  config.paperclip_defaults = {
    :storage => :s3,
    :s3_region => ENV['AWS_REGION'],
    :s3_host_name => ENV['AWS_HOSTNAME'],
    :s3_credentials => {
      :bucket => ENV['S3_BUCKET_NAME'],
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }
  }

```


## 3. Sign up for an AWS account  
Should you require an account. (We already have one for these projects for now.)

Resources:
[AWS](http://aws.amazon.com/)
[Login](https://aws.amazon.com/console/)


## 4. Create an S3 bucket in AWS  
We need to create / configure the bucket so we can set this in heroku.


## 5. Grant permission to everyone  

### Add/edit Bucket policy that allows read.
We need to fix the Resource Name below.

Note for this we are adding additinal permissions to the folder to allow Upload/Delete/etc.

```
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "AllowPublicRead",
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::tripcashdev/*"
        }
    ]
}
```

### Configure the Permissions for the Folder (or Bucket) to Allow Read/Write
* S3 Management Console
* Permissions
* Select Object (Folder/Bucket)
* Everyone
* Read / Write

## 6. Configure Heroku for AWS  

See what the variables are at present:
```
heroku config
```

### Set the variables we need:
```
heroku config:set S3_BUCKET_NAME=***GET FROM AMAZON AWS***
heroku config:set AWS_ACCESS_KEY_ID=***GET FROM AMAZON AWS***
heroku config:set AWS_SECRET_ACCESS_KEY=***GET FROM AMAZON AWS***
heroku config
```

### Fix the region
Ref for [AWS Region Names](http://docs.aws.amazon.com/general/latest/gr/rande.html#opsworks_region)

#### Notes:
* v1 of the AWS SDK uses AWS_HOSTNAME for a fqdn.
* v2 of the AWS SDK uses  AWS_REGION or s3_region and will require testing

*Sydney = ap-southeast-2*



```
heroku config:set AWS_REGION=ap-southeast-2
heroku config:set AWS_HOSTNAME=s3-ap-southeast-2.amazonaws.com
heroku config
```



## 7. Add, commit and push to Git and Heroku 
### Git Stuff
```
git add --all
git commit -am "Add Amazon S3 for Paperclip uploads to Heroku"
git push
git push heroku master
```

### Heroku Cleanup
```
heroku rake db:reset
heroku rake db:migrate
heroku open
```
-----

# Styling App with jQuery Masonry

*Giving our application that Pinterest look with jQuery Masonry.*

Update: Turbolinks can cause a lot of JavaScript errors later on, so we're recommending it not be used in your app.
Since normal Rails apps come with Turbolinks pre-installed, you should follow the instructions in this blog post to remove them. There's also a few updates here in the lesson notes in steps 1 and 9, so keep an eye out. 
**PB is leaving turbolinks in for now**


### Resources
* [jQuery Masonry](http://masonry.desandro.com/()
* [jQuery Masonry Gem](https://github.com/kristianmandrup/masonry-rails)
* [jQuery Turbolinks Gem](https://github.com/kossnocorp/jquery.turbolinks) - we're potentially not going to use this


## 1. Add the Masonry and Turbolinks gems  
*/Gemfile*

### Masonry Gem

Bottom of list before environments.
```
gem 'masonry-rails', '~> 0.2.0'
```

### jquery-turbolinks

This goes after turbolinks
```
gem 'jquery-turbolinks' # don't add this if you're removing Turbolinks
```


## 2. Always bundle install to install a new gem  

*terminal*
* Stop the Server
* Install
* Restart the server

```
bundle install
rails server -p $PORT -b $IP
```


## 3. Modify our application.js file  
*/app/assets/javascripts/application.js*
**Note refer to the doco for more options**
This gets loaded on every page eg under */app/views/layouts/application.html.erb* - javascript_include_tag

Q: What is jquery.imagesloaded.min? 
A: It's a jQuery plugin that triggers a callback after all images have been loaded, which Masonry likes to use.

The change is made after turbolinks and before the require_tree

```
//= require masonry/jquery.masonry
//= require masonry/jquery.imagesloaded.min
```


## 4. Modify our application.css file  
*/app/assets/stylesheets/application.css*
**Note refer to the doco for more options**
This gets loaded on every page eg under */app/views/layouts/application.html.erb* - stylesheet_link_tag


```
 *= require 'masonry/transitions'
```


## 5. Update our Pins Index  
*/app/views/pins/index.html.erb*

Complete rework of the page:
* remove header
* remove the table
* move the if user_sign_in to the header partial (next step)
* cleanup the rest of the table stuff eg the <tr> (table row tags) 
* remove the <br> at the end
* wrap the entire file in a div of id pins ```<div id="pins">```
* make a new pin class of "box" and enclose each pin     ```<div class="box">```
* We will create styling for this under stylesheets shortly. *pins.css.scss*


```
<div id="pins">
  <% @pins.each do |pin| %>
    <div class="box">
      <%= image_tag pin.image.url(:medium) %>
      <%= pin.description %>
      <%= pin.user.email if pin.user %>
      <%= link_to 'Show', pin_path(pin) %>
      <% if pin.user == current_user %>
        <%= link_to 'Edit', edit_pin_path(pin) %>
        <%= link_to 'Destroy', pin, method: :delete, data: { confirm: 'Are you sure?' } %>
      <% end %>
    </div>
  <% end %>
</div>
```


## 6. Adding Pins directly from the header  
*/app/views/layouts/_header.html.erb*
We are placing this under the logic for user_signed_in? above Account Settings

```
.
.
.
     <li><%= link_to 'New Pin', new_pin_path %></li>
.
.
.
```


## 7. Update our Pins stylesheet for Masonry CSS  
*/app/assets/stylesheets/pins.css.scss*

This file might not exist and need to be created.

* Center the pins
* define the box styling for the box tags
* fit the img to the box above (force the fit)

```
.
.
.
#pins {
  margin: 0 auto;
}

.box {
  margin: 5px;
  width: 214px;
}

.box img {
  width: 100%;
}
```

## 7. Update our Pins JavaScript for Masonry  
We are styling pins so will add it to the pins.coffee file in assets/javascripts.
Rails needs javascript to be seperate to the page so we write it in this file and then tell rails to load it on the page.

**Note: you need to use either spaces or TABS but dont mix**

This is done via the 
```
$ ->
```

##What are we doing in jQuery? ##

* Cycle through the pins on the page
* once the images are loaded
* call the jQuery Masonry for that pin
* tell it how to find the item selector
* tell it we must fit within the defined width.

http://guides.rubyonrails.org/working_with_javascript_in_rails.html#how-turbolinks-works


*/app/assets/javascripts/pins.coffee*

```
.
.
.
$ ->
  $(document).on "turbolinks:load", ->
    $('#pins').imagesLoaded ->
      $('#pins').masonry
        itemSelector: '.box'
        isFitWidth: true
```


## 8. Modify our application.js file for jQuery Turbolinks  
This way it forces a reload if we have changed the page.

Note the doco: it muse be loaded after jquery and before turbolinks.
//= require jquery.turbolinks

*/app/assets/javascripts/application.js*

**Don't do this step if you're removing Turbolinks.**

```
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require bootstrap
//= require turbolinks
//= require masonry/jquery.masonry
//= require masonry/jquery.imagesloaded.min
//= require_tree .
```

## 9. Update our Pins Index View for transitions and styling (animation)
*/app/views/pins/index.html.erb*

* Turn animation on with: ```<div id="pins" class="transitions-enabled">```
* IMAGE: style the div box class with bootstrap:    ``` <div class="box panel panel-default"> ```
* OTHER: Style the body:	```       <div class="panel-body"> ```


```
<div id="pins" class="transitions-enabled">
  <% @pins.each do |pin| %>
    <div class="box panel panel-default">
      <%= image_tag pin.image.url(:medium) %>
      <div class="panel-body">
        <%= pin.description %>
        <%= pin.user.email if pin.user %>
        <%= link_to 'Show', pin_path(pin) %>
        <% if pin.user == current_user %>
          <%= link_to 'Edit', edit_pin_path(pin) %>
          <%= link_to 'Destroy', pin, method: :delete, data: { confirm: 'Are you sure?' } %>
        <% end %>
      </div>
    </div>
  <% end %>
</div>
```

## 10. Add to the .gitignore file  
Currently the images being uploaded to dev are being stored in "/public/system" and we dont want this stored.

*/.gitignore*

```
.
.
.
/public/system/*
```


## 11. Git Dance
Save and setup

```
git status
git add --all
git commit -am "Added jQuery masonry"
git push
```


-----

# Tweaks to Index Page and Niceties

* Click on picture to get to the page
* Add some icons to make it nicer
* Add pagination to the page load
* Prep for user profiles

### Resources
[Bootstrap Panels](http://getbootstrap.com/components/#panels)


## 1. Update our Pins index for clickable images  

* Add a link_to the existing image_tag:       ```<%= link_to image_tag(pin.image.url(:medium)), pin %>```
* Remove the 'Show' and its link as its now redudant.
* Add the Edit/Destroy in a new div called actions.          ``` <div class="actions">```
* Wrap the description and email in ```<p>``` tags so they get new lines
* Style the user email in bold ```<strong>```

Basically we are moving the existing line with the link_to and replaceing the 'Show' with the image.  We need to wrap it in parenthesis so rails knows what we want exactly.

*/app/views/pins/index.html.erb*

```
<div id="pins" class="transitions-enabled">
  <% @pins.each do |pin| %>
    <div class="box panel panel-default">
      <%= link_to image_tag(pin.image.url(:medium)), pin %>
      <div class="panel-body">
        <p<%= pin.description %></p>
        <strong><%= pin.user.email if pin.user %></strong>
        <% if pin.user == current_user %>
          <div class="actions">
            <%= link_to 'Edit', edit_pin_path(pin) %>
            <%= link_to 'Destroy', pin, method: :delete, data: { confirm: 'Are you sure?' } %>
          </div>
        <% end %>
      </div>
    </div>
  <% end %>
</div>
```

## 2. Update our Pins show page for styling 

* Move the back link to the top of the page.
* remove the '|' from the Edit line.
* Add a div class row to the rest so we can format (center and offset).  This needs 2 lines (class="row", class="col-md-offset-2 etc.")
* Add it to a bootstrap panel 
* Configure the panel heading and body
* Remove the Description tag
* Add the user (have to update to @pin )
* Wrap the description and email in ```<p> tags so they get new lines </p>```
* Replace the :medium from the image with :large after adding to pin.rb

### Note if you want a new image size that doesnt exist you need to edit the model.rb file and then regen missing styles

```
rake paperclip:refresh:missing_styles
```


*/app/views/pins/show.html.erb*

```
<%= link_to 'Back', pins_path %>

<div class="row">
  <div class="col-md-offset-2 col-md-8">
    <div class="panel panel-default">
      <div class="panel-heading center">
        <%= image_tag @pin.image.url(:large) %>
      </div>
      <div class="panel-body">
        <p><%= @pin.description %></p>
        <p><strong><%= @pin.user.email if @pin.user %></strong></p>

        <% if @pin.user == current_user %>
         <%= link_to 'Edit', edit_pin_path(@pin) %>
        <% end %>

      </div>
    </div>
  </div>
</div>
```

-----

# Adding icons with Glyphicons

Cool icons from Bootstrap. Locate the icon from the resources below and implement with the span class

### Resources
[Bootstrap Glyphicons](http://getbootstrap.com/components/#glyphicons)

**Note - bootstrap examples that include dots . indicate it should be a class**

## 1. Add Glyphicons to the header partial
We are placing this where the New Pin etc lines go and as per the bootstrap instructions using a <SPAN> class

There are various ways we could do this.

### Using Raw to show it inline (Raw tells rails to process vs show) 
This is effectively concatenating the text.
```
<li><%= link_to raw('<span class="glyphicon glyphicon-plus"></span> New Pin'), new_pin_path %></li>
```

### Use a block (clearer code)
We can spread it out over multiple lines:
* Where is the link going
* details
* end

```
<li>
  <%= link_to new_pin_path do %>
    <span class="glyphicon glyphicon-plus"></span> New Pin
  <% end %>
</li>
```


*/app/views/layouts/_header.html.erb*
Example with additional code shown to get context.
```
        <!-- Show a signin or logout as appropriate -->
        <% if user_signed_in? %>
            <li>
              <%= link_to new_pin_path do %>
                <span class="glyphicon glyphicon-plus"></span> New Pin
              <% end %>
            </li>
            <li><%= link_to "Account Settings", edit_user_registration_path %></li>
            <li><%= link_to "Log out", destroy_user_session_path, method: :delete %></li>
        <% else %>
            <li><%= link_to "Sign in", new_user_session_path %></li>
        <% end %> <!-- logic for user session -->
```


## 2. Add Glyphicons to the Pin index  View
Same as above but different icons. For edit and delete.  
Also change destroy to delete

*/app/views/pins/index.html.erb*

```
            <%= link_to edit_pin_path(pin) do %>
              <span class="glyphicon glyphicon-edit"></span>
              Edit
            <% end %>
            
            <%= link_to pin, method: :delete, data: { confirm: 'Are you sure?' } do %>
              <span class="glyphicon glyphicon-trash"></span>
              Delete
            <% end %>
```



## 3. Add Glyphicons to the show page  
As per above for edit on the single pin view

*/app/views/pins/show.html.erb*
```
      <%= link_to edit_pin_path(@pin) do %>
        <span class="glyphicon glyphicon-edit"></span>
        Edit
      <% end %>
```


## 4. Add Glyphicons URL for Chrome (if needed)
This is only needed if chrome looks like not loading Glyhicons.  Not an issue 2017-05

*app/assets/stylesheetsbootstrap_and_customization.css.scss*
```
@import 'bootstrap-sprockets';
@import 'bootstrap';
@import url("//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css");
```

-----

# Changing the Root Route

In this APP, the pins should display on the homepage.
To do some we are going to make the pins index view the home page and change the home page to be included as a partial when needed.

## 1. Change our routes so the root goes to Pins  
*/config/routes.rb*

```
.
.
.
  root "pins#index"
.
.
.
```

## 2. Make Home a partial  

### Why/Logic?
We want to keep the functionality that was already in the old home.
To do this we will rename display as a partial

**Rename**
```
/app/views/pages/home.html.erb
```

**To**
```
/app/views/pages/_home.html.erb
```



## 3. Render the new Home partial on Pins index  
We want to render the Welcome/Prompt if the user hasnt logged in.  
Edit the view for the Pins Index and place this where we want it (at the top in this case.)

*/app/views/pins/index.html.erb*

```
<%= render 'pages/home' unless user_signed_in? %>
.
.
.
```
## Notes on if/unless
### Render on NOT signed in? (unless)
We want to render if the user hasnt signed in. In rails this is using unless.
```
unless user_signed_in?
```
### Render on user signed in? (if)
We want to render ONLY IF the user has signed in. In rails this is using if.
```
if user_signed_in?
```

### Cleanup the old logic in _home.html.erb
We have changed the logic to only show this if the user hasnt logged in so we can remove the logic in the file...

#### Old file

```
<div class="jumbotron">
  <h1>Welcome</h1>
  <p>Spicy jalapeno bacon ipsum dolor amet jowl dolor eu andouille turducken ribeye adipisicing meatloaf burgdoggen labore. Aliqua salami in hamburger pork chop dolore. Ut prosciutto in boudin, pariatur est dolore. Excepteur ut ham short loin ad laborum pork loin meatball short ribs. Ham et velit tenderloin beef ribs. Lorem turducken meatball, duis bresaola meatloaf fugiat ut mollit tri-tip tempor pig minim.
</p>

  <% if user_signed_in? %>
    <!== do something for our signed in users -->
    <p></p>  
    <p>Thanks for signing in :-)</p>    
  <% else %>
    <!== Prompt them to Login or SignUp -->
    <p></p>
    <p>
      <%= link_to "Log in", new_user_session_path,  class: "btn btn-default btn-lg" %>
      <%= link_to "Sign up", new_user_registration_path, class: "btn btn-primary btn-lg" %>
    </p>
  <% end %>  <!== user_sign_in block -->
</div>
```

#### Updated file

```
<div class="jumbotron">
  <h1>Welcome</h1>
  <p>Spicy jalapeno bacon ipsum dolor amet jowl dolor eu andouille turducken ribeye adipisicing meatloaf burgdoggen labore. Aliqua salami in hamburger pork chop dolore. Ut prosciutto in boudin, pariatur est dolore. Excepteur ut ham short loin ad laborum pork loin meatball short ribs. Ham et velit tenderloin beef ribs. Lorem turducken meatball, duis bresaola meatloaf fugiat ut mollit tri-tip tempor pig minim.
</p>

    <!== Prompt them to Login or SignUp -->
    <p></p>
    <p>
      <%= link_to "Log in", new_user_session_path,  class: "btn btn-default btn-lg" %>
      <%= link_to "Sign up", new_user_registration_path, class: "btn btn-primary btn-lg" %>
    </p>
</div>
```


## 4. The git dance
Push to github and heroku

```
git add .
git commit -am "Update show view and change root path"
git push
git push heroku master
```

-----


# Re Order Pins (or other)
Reorder the pins on the index page so that they show up reverse-chronologically. We'll also explore other Active Record queries.

## 1. Active Record queries  
[http://guides.rubyonrails.org/active_record_querying.html](http://guides.rubyonrails.org/active_record_querying.html)

* order
* limit
* find_by
* etc.

To check what fields we can use...take a look at */db/schema.rb*

### Note
These can be chained with . so for example 

**Get the pins in descending order by created_at**
```
@pins = Pin.all.order("created_at DESC")
```

As above Limit the results.
```
@pins = Pin.all.order("created_at DESC").limit(3)
```



## 2. Update Pins Controller  

We need to locate the ```index```

*app/controllers/pins_controller.rb*

```
..
  def index
     # @pins = Pin.all # original
     
     #active record query - created_at descending order.
      @pins = Pin.all.order("created_at DESC")
  end
..
```


## 3. Commit to Git  
```
git add .
git commit -am "Load pins in index action in reverse chronological order"
```

-----

# Implement Pagination

At some point you'll want numbered pages or pagination as otherwise the page will be too large/take too long to load.

## 1. Install will_paginate gem  
[https://github.com/mislav/will_paginate#basic-will_paginate-use](https://github.com/mislav/will_paginate#basic-will_paginate-use)

### Add will_paginate gem to Gemfile

bottom of the Gemfile before group :development etc.


*/Gemfile*

```
.
.
.
gem 'will_paginate', '~> 3.0.5'
.
.
.
```

### Install
And then run...
```
bundle install
```


## 2. Add Paginate Method to pins_controller 

[https://github.com/mislav/will_paginate#basic-will_paginate-use](https://github.com/mislav/will_paginate#basic-will_paginate-use)

This becomes chainable just like other Active Record queries we covered above with DESC.
```
.paginate(:page => params[:page])
```

The default is 50.  We can speficy how many we want as follows (eg 8)

```
.paginate(:page => params[:page], :per_page => 8)
```

### Default pagination (50)
*app/controllers/pins_controller.rb*
```
.
.
.
 def index
   @pins = Pin.all.order("created_at DESC").paginate(:page => params[:page])
 end
.
.
.
```

## 4. Add additional arguments to change the per page limit  

Lets adjust as needed (in this case 8 is a good start)
*app/controllers/pins_controller.rb*

```
.. 
def index
   @pins = Pin.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
 end
..
```


## 5. Render page links in the view.  
We need to give the users a way to change pages.

Add to the very bottom of index.html.erb

*app/views/pins/index.html.erb*

```
..
<%= will_paginate @pins %>
```


## 6. Change the Paginator to use Bootstrap Styling
Create a Paginator using will_paginate-bootstrap gem  

[https://github.com/nickpad/will_paginate-bootstrap#install](https://github.com/nickpad/will_paginate-bootstrap#install)

### Add will_paginate gem to Gemfile

After the existing paginator gem.  
This will allow us to use a renderer

*/Gemfile*
```
..
gem 'will_paginate-bootstrap'
..
```

### Bundle Install to Add New Gem

```
bundle install
```

### Update pagination to use the renderer  
In your view, use the renderer: 
BootstrapPagination::Rails option with the will_paginate helper.

You can wrap it in a div tag to center if you want.

*app/views/pins/index.html.erb*

```
.
.
.
<div class="center">
   <%= will_paginate @pins, renderer: BootstrapPagination::Rails %>
</div>
```


## 7. Restart server to load will_paginate_bootstrap gem
Close running server (ex. CTRL + C)

```
rails server -p $PORT -b $IP
```

-----

# Adding names to users (adding fields to a table)

Using migrations, you can add attributes to your tables.
In this example, add a name field to your users, but you can do the same thing with usernames, addresses, and anything else.

## 1. Create database migration to add name column to users

[Rails Migration Documentation](http://guides.rubyonrails.org/migrations.html#creating-a-migration)

```
rails generate migration AddNameToUsers name:string
```


## 2. Run migration file

### locally 
```
rake db:migrate
```

### heroku (you will need to push first)
```
heroku run rake db:migrate
```


## 3. Edit the devise page to add names
Edit devise account settings to ask users for names when they sign up  

Copy a form-group and amend as needed.

* change the label 
* confirm the field type
* change the name 

*app/views/devise/registrations/edit.html.erb*

```
.
.
.
     <div class="form-group">
       <%= f.label :name %>
       <%= f.text_field :name, class: "form-control", :autofocus => true %>
     </div>
.
.
.
```


## 4. Update permitted parameters (security + allow name)

We are using devise so this needs an update to "White label" attribute on form for strong parameters  

[Devise Strong Parameters Documentation](https://github.com/plataformatec/devise#strong-parameters)

**Note** We need to figure out which methods need to be updated.eg

* sign_in
* sign_up
* account_update


### Define a method in application controller to run with a before action

We are going to run this in the core application_controller so it runs globally under the conditions we want.
**We need it to run for sign_up  and account_update.**

*app/controllers/application_controller.rb*

#### Old file
```
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
```

## Updates 
```
class ApplicationController < ActionController::Base
 # Prevent CSRF attacks by raising an exception.
 # For APIs, you may want to use :null_session instead.
 protect_from_forgery with: :exception
 before_filter :configure_permitted_parameters, if: :devise_controller?

protected

 def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
 end
   
end
```

### Note: older Versions of devise use a different syntax. See below:
```
  devise_parameter_sanitizer.for(:sign_up) << :name
  devise_parameter_sanitizer.for(:account_update) << :name
```


## 5. Add name field under devise registrations view.  (signup)

*app/views/devise/registrations/new.html.erb*

```
.
.
.
      <div class="form-group">
        <%= f.label :name %>
        <%= f.text_field :name, autofocus: true, class: "form-control" %>
      </div>
.
.
.
```



## 8. Commit changes to Git.  
```
git add .
git commit -am "Added Names to users"
```


-----

# Validation for fields 

Validations are the Rails way of making sure that the data your users are putting into forms are good. You can use validations to make sure that a user actually gives you their name, that their email address is actually an email address, and other things.

## 1. Active Record Validations - Making sure name isn’t blank
[Active Record Validations Documentation](http://edgeguides.rubyonrails.org/active_record_validations.html)

### Validating the presence of a name
```
  validates :name, presence: true
```

*app/models/user.rb*

### Updated example file
```
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  validates :password,  :presence => true,
                        :confirmation => true,
                        :length => {:within => 8..40},
                        :on => :create,
                        #:format => {:with => /\A.*(?=.{10,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\@\#\$\%\^\&\+\=]).*\Z/ }
                        :format => {:with => /\A.*(?=.{08,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).*\Z/ }
                        
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :name, presence: true
         
  has_many :pins
end

```


## 2. Add validation for pins 

*app/models/pin.rb*

```
.
.
.
  validates :image, presence: true
  validates :description, presence: true
.
.
.
```

-----

# Replace eMails with Names... (views)
We are asking a user for their name so we can show their name to other users to identify them instead of showing their email, which could become a privacy concern after a while. 


##1. Replacing email with names on pin views.
We are going to swap out pin.name for pin.email

*app/views/pins/index.html.erb*
**Original (with eMail)**
```
.
.
.
        <p><strong><%= pin.user.email if pin.user %></strong></p>
.
.
.

```

**New (with Names)**
```
.
.
.
        <p><strong><%= pin.user.name if pin.user %></strong></p>
.
.
.

```

*app/views/pins/show.html.erb*
new
```
.
.
.
        <p><strong><%= @pin.user.name if @pin.user %></strong></p>
.
.
.
```

## 2. Commit changes to git. 
```
git add .
git commit -am "Add names to users"
git push
git push heroku master
heroku run rake db:migrate
```


-----

# Cleaning up users (what happens if a user is deleted etc.)


## 1. The bug
Some of the pins are showing "edit" and "delete" buttons when we are signed out. Those buttons should only be visible when the user is signed in (...and not for every user!). 
We do some detective work below but basically its due to the fact that the logic we are using fails (something returns true when it shouldnt.)


## 2. Find the files with code related to the bug

**existing file example**
*views/pins/index.html.erb*

```
        <% if pin.user == current_user %>
          <div class="actions">
            <%= link_to edit_pin_path(pin) do %>
              <span class="glyphicon glyphicon-edit"></span>
              Edit
            <% end %>
            
            <%= link_to pin, method: :delete, data: { confirm: 'Are you sure?' } do %>
              <span class="glyphicon glyphicon-trash"></span>
              Delete
            <% end %>
            
            </div>
        <% end %>

```

**existing file example**
*views/pins/show.html.erb*
```
        <% if @pin.user == current_user %>
          <%= link_to edit_pin_path(@pin) do %>
            <span class="glyphicon glyphicon-edit"></span>
            Edit
          <% end %>
        <% end %>
```


## 3. Identify the cause of the bug
In both views/pins/index and views/pins/show we are trying to make sure that the "edit" and "delete" controls only appear if the pin belongs to the current user.

*views/pins/index.html.erb*
```
<% if pin.user == current_user %>
```

*views/pins/show.html.erb*
```
<% if @pin.user == current_user %>
```

It looks like the way we are doing this is not working every time.

### Why?
Let's find out... by analyzing our "if" statement in one of the cases where it is failing.

```
heroku run rails console
```

Once in the console...

```
> pin = Pin.find(58) #get the id of a buggy pin from the url for its show page 
                     #this id will most likely not be 58 for you
=> #<Pin id:58, ... , user_id: 83, ... > 
#again, the user_id you get will probably be different

> pin.user #finds the user for this pin
=> nil 
#this is what you should get if you called pin.user on a buggy pin

> User.find(83)
=> ActiveRecord::RecordNotFound: Couldn't find User with id=83 
#this means that the user that created that pin no longer exists!
```

**Someone created an account, uploaded a pin, and then deleted their account. This is why "pin.user" returns nil.**

**The "current_user" will also be nil when no one is logged in.**

For any pin that doesn't have a user our "if" statement will evaluate to true when we are not logged in. Both sides of the "==" will be nil so the statement will be true.

```
<% if @pin.user == current_user %>
```
Eg if not logged in the current_user will evaluate true.
When this "if" statement evaluates to true we will see everything inside it, meaning we will see the "edit" and "destroy" links.


## 4. Fix the bug
There are two options for how we can prevent the "edit" and "delete" links from appearing when they shouldn't.

### Option 1 - fix the "if" statement
Since we never want anyone to see "edit" and "destroy" links if they are not signed in we can add a clause to our "if" statement that checks that the "current_user" is not nil.

*views/pins/index.html.erb*
```
<% if current_user && pin.user == current_user %>
```

*views/pins/show.html.erb*
```
<% if current_user && @pin.user == current_user %>
```


The way "&&" works in Ruby our "if" statement will only pass if both side of the "&&" are true.
```
false && false  #false
true && false   #false
false && true   #false
true && true    #true
```

Now we don't see any "edit" or "destroy" links anywhere when we are signed out.


### Option 2 - "dependent: :destroy"
The underlying problem is that we are not removing a user's pins when they delete their account. 
**Think before implementing as you may not need to implement this.  Eg We may have content that we can show and only edit if the user has rights.  EG for content we dont necessarily delete because a user no longer exists.**


Original *models/user.rb*
```
Class User < ActiveRecord::Base
  ...
  has_many :pins
  ...
end
```

Modified *models/user.rb*
```
Class User < ActiveRecord::Base
  ...
  has_many :pins, dependent: :destroy
  ...
end
```

This destroys a user's pins automatically when the user object is destroyed. Now when we delete an account we don't see that user's pins at all.


## 5. Why not do both? 
Do option 1 and option 2. Why not?


## 6. Commit changes
```
git add .
git commit -am "Fix a bug where Edit/Delete links show up on pins without users"
git push
git push heroku master
```


## 7. Clean up old pins in your database 
The last thing we want to take care of is removing old pins for users that don't exist anymore. Remember "dependent: :destroy" will work from now on but it won't remove old pins.

terminal
```
heroku run rails console
```

Once in the console...

```
> Pin.includes(:user).where(users: {id: nil}) #should return all the pins with no user
> Pin.includes(:user).where(users: {id: nil}).destroy_all
```

To read more about what we're doing in the console check out:
[http://guides.rubyonrails.org/active_record_querying.html](http://guides.rubyonrails.org/active_record_querying.html)

-----

# Wrap Bootstrap Theme onto a Rails App

## Download a theme and review/investigate theme elements.
In this case [Freelancer](https://startbootstrap.com/template-overviews/freelancer/)

Look at the theme and figure out what we have eg
*the index.html* gives us an idea as to how it works.
* Site Navigation
* Header
* etc 

```
index.html
/css
/fonts
/freelancer/css/...
/less
```

Basically find the *sections* of the site from the *index.html* as these are the bits that we will put into our rails .erb
You can use this by viewing the index.html with the browser *web inspector* to figure out what section is what.

Figure out the elements you want.

## Copy .css files

### From
```
/BootStrapThemeName/css/*.css
```

### To
```
/app/assets/stylesheets
```


## Copy image files

### From
```
/BootStrapThemeName/img/*.*  #include any folders
```

### To
```
/app/assets/images
```


## Copy JavaScript

### From
```
/BootStrapThemeName/js/*.*  #include any folders
```

### To
```
/app/assets/javascripts
```

**This might need tweaking but its a good start**



## Design Elements

### Navigation bar
* Copy from index.html to the /app/views/layouts/_header.html.erb
* Dont forget to render this in application.html.erb with 
```
  <%= render 'layouts/header' %>
```


### Fix Colours etc. 
YOu might need to go fishing through lookating at the browser with th eelement inspector to find the hex colours.
We will need to edit the following file and comment out bootstrap as we are automatically loading another version and this is overriding things.

*/app/assets/stylesheets/bootstrap_and_customization.css*
```
/* @import 'bootstrap'; */
```


## Wire up the Page Links
*application.html.erb* or *_header.html.erb*

* Add Li (links) following their style to pages as needed
* Home, About,  etc.
* Change the hard coded to use embedded ruby

**Change from**
```
<a href="#about">About</a>
```

**Change To **
```
<%= link_to "Home", root_path %>
<%= link_to "About", about_path %>
```

## Fix the Jumbotron 
* Find the element eg Header in the .html example
* Move it to the Specific page eg the home page
* Reword/fix as needed
* remove any old stuff


## Fix broken image links
If images that came in the theme arent loading?


### Change the src=
```
<img class="img-responsive" src="img/profile.png" alt>
```


### Firstly: Replace the .html with a rails image_tag
```
<%= image_tag("profile.png") %>
```


### Secondly: Add in the class
```
<%= image_tag("profile.png", class: "img-response") %>
```

-----

# Page Specific CSS

How can we determine what page we are on?

## Wrap the application.html.erb body in a Class
We wrap the body code for each page in a class we can then query.
```
<body class="<%= controller_name %> <%= action_name %>">
```

## Style the css using above
*/app/assets/stylesheets/pages.css.scss*

Fill in the scope for each page with the style tags you need.

```
.home{
  background-color:orange;
}

.about{
  background-color:blue;
}
```

