#Pinteresting - PB Notes

This is the pinteresting sample for:

[Pinteresting](https://pinteresting-peterbishop.c9users.io)

by [Blue Tardis](https://bluetardis.com)

##Check the version
```
rails -v
```


##Create new workspace
```
rails new pinteresting
```

(This is already done for Cloud9 if you picked a rails environment and is the ~/workspace)


##Check that it actually works
###Start the Rails server
```
rails server -p $PORT -b $IP
```


##Git Setup
###Local Config
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

####Recover/roll back
```
git checkout -f #brings us back to the last version
```


##Server Config for GitHub
###generate a key ssh (CLOUD9 already as this done)
```
ssh-keygen -t rsa -C "peter@bluetardis.com.au"
```



###Test the connection
```
ssh -T git@github.com
```


###If all good then go to Git and create a repository
[Link to Github New Repository](https://github.com/new)


###Push up based on the info from Git for the new repository 
(Choose the SSH Option to generate the commands)
```
git remote add origin git@github.com:bluetardis/pinteresting.git
git push -u origin master
```

##The normal git dance
```
git commit -am "What changed"
git push
```



#Creating the home page
```
rails generate controller pages home
```
This makes a homepage for us at
https://pinteresting-peterbishop.c9users.io/pages/home

We can go edit the files
/app/views/pages/home.html.erb



#Set the Root Path with Routes
We need to go tell Rails how to route pages.

The file for this lives initial
/config/routes.rb
and the initial line was generated when we made the home page

The home page is actually called the Root Route so we need to add that.  There are hints in the file itself.
```
root 'pages#home'
```


#Make a page manually
##Step1. Controller
/app/controllers/pages_controller.rb

edit eg copy the block from *home* and then change it to *about*

##Step2. The View
/views/pages/*SOMETHING_GOES_HERE*.html.erb
make a new file "about.html.erb"

##Step3. Fix the route
/config/routes.rb
```
get "about" => "pages#about"

```

#Embedded Ruby (.erb)
this allows us to  include ruby in the html
use <%= *SOMETHING_GOES_HERE* %>

Eg to make a link to another page on the site
```
<p>Sign up <%= link_to "here", "#" %>.</p>

```

----
#A note on SEO 
##Search Engine Optimisation

* Content is important
* Growth Mindset

##Summary
* Each page or keyword should match.   (Darling Harbour vs Sydney)
* Use google adwords "Keyword Planner" to determine Competition vs Sweetspot.

## for getting things right.

###HTML Title Tag - needs to include the keywords for that page to target
eg
Primary Keyword - Maybe Secondary Keyword | Brand Name


###META Tags to populate
```title
description
keywords
```


###The URL Matters
```
keep the keyword in the URL rather than generalisation.
good example is moz.com
bad example is imdb.com
```
####moz.com for SEO tips

###Content is important
Length: You want at least 500 words per page for google to rank it.
Density: Keyword density is important (how many times do you use the keywords)

###Links
Get as many links to this as possible.
Start by having links from your home page.
Post on Twitter
Post on Reddit

----

#Make some links etc.
Basic approach is to link to a page defined in routes.rb  get *"about"* => "pages#about"
FYI - the general home path is *root_path*

```
<%= link_to "About", about_path %> 
<%= link_to "Home", root_path %>

```

#Lets follow DRY and make a Navigation bar
/views/layouts/application.html.erb

This is the template that is the "theme" or for all pages.

Place this before the *<%= yield %> if you want it as a header.

------
#Bootstrap
##Install the bootstrapp-sass gem
Easiest way is to use gems.
Search google for "bootstrap sass gem"

Follow your nose for the readme.

Edit the *Gemfile*
```
gem 'bootstrap-sass'
```
and then proceed to install as per normal.
```
bundle install
```

##Add it to the Asset pipeline
/app/assets/ is where our optimised pipeline is
This has provision for images, java and stylesheets.

We will be working with stylesheets and need to make a new file.
Using the scss precompiler framework (scss)

The name could be anything but we need something human readable
```
/app/assets/stylesheets/bootstrap_and_customization.css.scss
```

Edit this file and add the following:
```
@import 'bootstrap';
```

Initially we will get an error if you havent stopped an restarted the server.  
Basically you need to do this anytime we touch *gems*

So find it *CTRL-C* and then
```
rails server -p $PORT -b $IP
```

##What can I do?
Take a look at the site for live examples.
http://getbootstrap.com/getting-started/#examples

##CSS Containers to make our pages responsive by default
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

We are going to use *.container* and add the info to *application.html.erb* above and below the *<%= yield %>* so it affects our pages.
/views/layouts/application.html.erb


##NavBar
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

##Lets simplify partials to clen things up
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
Note: we have included the layouts/header and *not* the _header.html.erb

## Edit the _header to your content.
Things to change:
*Brand
*Remove search if you dont need it (<form to /form>)
*Populate or delete links on left or right hand sides.
*Same code as before

###Notes:
* we simplified this a lot for our project. Refer to the _header.html.erb
* we need to tweak the code a little more to make the button etc work (responsive component when shrunk)
* check out the code or bootstrap notes on *button* 

####Button and Java
/app/assets/javascripts/application.js
*We need to include the Bootstrap components and will do this AFTER jquery lines*

```
//= require bootstrap
```





































-----

Starting Point is
Day 9
