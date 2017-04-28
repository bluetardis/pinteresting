# Pinteresting - PB Notes

This is the pinteresting sample for:

[Pinteresting](https://pinteresting-peterbishop.c9users.io)

by [Blue Tardis](https://bluetardis.com)


## Check the version
```
rails -v
```


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
## Git Setup
### Local Config
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

#### Recover/roll back
```
git checkout -f #brings us back to the last version
```


## Server Config for GitHub
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
(What is the Upstream)
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


-----
# Rails WhiteList / BugFix

This fixes the following error:
Cannot render console from 122.108.59.33! Allowed networks: 127.0.0.1

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
# Creating the home page
```
rails generate controller pages home
```
This makes a homepage for us at
https://pinteresting-peterbishop.c9users.io/pages/home

We can go edit the files
/app/views/pages/home.html.erb

## fyi you can destroy pages with 
```
rails destroy whatever blah blah
```


-----
# Set the Root Path with Routes
We need to go tell Rails how to route pages.

The file for this lives here
/config/routes.rb
and the initial line was generated when we made the home page

The home page is actually called the Root Route so we need to add that.  There are hints in the file itself.
```
root 'pages#home'
```


-----
# Make a page manually 
*use this to make from scratch rather than rails generate*

## Step1. Controller
/app/controllers/pages_controller.rb

We need to edit this to create other pages eg about...

edit eg copy the block from *home* and then change it to *about*
```
def about 
end 
```


## Step2. The View
/views/pages/*SOMETHING_GOES_HERE*.html.erb
*make a new file "about.html.erb" and put something in it*
```
<h1>About US</h1>
<p>We are working on our App!</p>
```



## Step3. Fix the route 
*This way rails can find it and do its magic stuff*
/config/routes.rb
```
get "about" => "pages#about"    # create about_path
```


-----
# Embedded Ruby (.erb)
this allows us to  include ruby in the html file for realtime stuff
Ruby embeds are formatted like this:
use <%= *SOMETHING_GOES_HERE* %>

In HTML, a link with a stub looks like this
```
<a href="#">here</a>
```

In Ruby on Rails a link will look like this
```
<%= link_to "here", "#" %>
```

## Use ruby to make a link to another page on the site
```
<p>Sign up <%= link_to "here", "#" %>.</p>

```

----
# A note on SEO 
*Search Engine Optimisation*

## 1. Most Important: You need to provide good content 
SEO without good content, is bound to fail
Sustainable strategy - Having quality traffic

## 2. Each page targets one specific keyword (and maybe a second) 
Figuring out what keyword to rank for requires research
What terms are competitive?
What are people searching for?
Long-tail vs. Short-tail keywords

### Summary
* Each page or keyword should match.   (Darling Harbour vs Sydney)
* Use google adwords "Keyword Planner" to determine Competition vs Sweetspot.


## 3. Title Tag
HTML Title Tag - needs to include the keywords for that page to target
eg
Primary Keyword - Maybe Secondary Keyword | Brand Name
Meta tags too (like keywords, description)


### META Tags to populate
```
title
description
keywords
```

## 4. The URL Matters
### Setup with keywords
Terms in the URL (eg. http://moz.com/learn/seo/on-page-factors)
Not obscure numbers (eg. http://www.imdb.com/title/tt0468569/)

### keep the keyword in the URL rather than generalisation.
```
good example is moz.com
bad example is imdb.com
```

#### moz.com for SEO tips

## 5. Content is important
### Length:
You want at least 500 words per page for google to rank it.

### Density:
Keyword density is important (how many times do you use the keywords)

### Links
* It must link to and back from the page properly.
Then get as many links to this as possible.
Post on Twitter
Post on Reddit


-----
# Creating Navigation Links
Basic approach is to link to a page defined in routes.rb  get "about" => "pages#about"
FYI - the general home path is *root_path*

```
<%= link_to "About", about_path %> 
<%= link_to "Home", root_path %>
```

We could do this for every page however if its a common element then we probably want to do something like the following.



# Navigation bar
Make it a little bit easier for users to move around your site with navigation links. In Rails, layouts make it really easy to create something (like a navigation bar) and have it show up on every page in your app.


/views/layouts/application.html.erb

This is the template that is the "theme" or for all pages.

Place this before the *<%= yield %> if you want it as a header.


------
# Bootstrap Installation and Initial Integration

## Resources
Bootstrap 3 [GitHub Gem](https://github.com/twbs/bootstrap-sass): where you go to install the gem

Bootstrap 3 [Main Site Documentation](http://getbootstrap.com/): where you go after installation to look at documentation on using Bootstrap styles and components

[rubygems.org](http://www.rubygems.org/): the official Ruby Gems site



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


## Add it to the Asset pipeline
/app/assets/ is where our optimised pipeline is
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

### What is Application.css file?
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


------
# Bootstrap Customization Part1

## What can I do?
Take a look at the site for live examples.
http://getbootstrap.com/getting-started/#examples

*This includes templates*


##Note: We need CSS Containers to make our pages responsive by default
We are going to stick them into containers.
So reference here: and look for the container example
http://getbootstrap.com/css/#type

Use .container for a responsive fixed width container.

```
<div class="container">
  ...
</div>
```

Use .container-fluid for a full width container, spanning the entire width of your viewport.
```
<div class="container-fluid">
  ...
</div>
```


### 1. Add a container to your app!
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

Create the file *app/views/layouts/_header.html.erb*

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
Note: we have referenced it as "layouts/header" and *not*  "_header.html.erb"




### 3. Create link to partial
app/views/layouts/application.html.erb
```
     <%= render 'layouts/header' %>
```
This replaces our previous Home and About info and comes before the main app container with the yield statement.


#### 4. Add the nav bar
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


##### The complete original file.
This is under the *Components* part of bootstrap so go find some examples.

http://getbootstrap.com/components/#navbar

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

The actual link needed is //= require bootstrap-sprockets


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

# Whats typical to customise Bootstrap Configuration

## Edit the _header to your content.
Things to change:
* Brand
* Remove search if you dont need it (<form to /form>)
* Populate or delete links on left or right hand sides.
* Same code as before

###Notes:
* we simplified this a lot for our project. Refer to the _header.html.erb
* we need to tweak the code a little more to make the button etc work (responsive component when shrunk)
* check out the code or bootstrap notes on *button* 


## JavaScript and other Dependencies
We have a button in the bar that doesnt work.  Time to add JavaScript support for bootstrap.

/app/assets/javascripts/application.js
*We need to include the Bootstrap components and will do this AFTER jquery lines*
```
//= require bootstrap
```


## Mobile Device Support
The key word to look for is *"Viewport"*
http://getbootstrap.com/getting-started/

Notes are on the Basic-Template page 
as of July 2016 it was the following lines which need to be included in the <head> of *application.html.erb*
```
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

```
Dont forget to stop and restart the rails server.


## Jumbotron
/app/views/pages/home.html.erb
###wrap things in the jumbotron
```
<div class="jumbotron">
  <h1>Welcome to my App!</h1>
  <p>Sign up <%= link_to "here", "#" %>.</p>
</div>
```

###Buttons
CSS components in bootstrap
http://getbootstrap.com/css/#buttons

Its not complete cut and paste but close 
example from bootstrap
```
<button type="button" class="btn btn-primary">Primary</button>
```


our code in the .html.erb
```
  <p>Click here to <%= link_to "Sign up", "#", class: "btn btn-primary btn-lg" %></p>
```

-----
# Bootstrap Customization Part2

## Design Resources

[Variables](http://getbootstrap.com/customize/#variables-basics)
[FlatUI Colors](http://flatuicolors.com/)

Bootstrap 3 [GitHub Gem](https://github.com/twbs/bootstrap-sass): where you go to install the gem

### Notes
We will be working with app/assets/stylesheets/bootstrap_and_customization.css.scss file


The Variables link above shows the various variables we can change/customise.  For now we are going to select and manually overwrite the ones we need.
We need to comvest the @navbar-default-bg shown into $navbar-default-bg

We enter the variable and the new value BEFORE we @import 'bootstrap'; 

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
app/views/layouts/_header.html.erb
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
This gives more control on formatting et
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
https://www.heroku.com/
https://toolbelt.heroku.com/

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

## Create a new APP
```
heroku create 
```

## Clean up Gems for Dev vs Prod
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

## install
bndle install --without production

