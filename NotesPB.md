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
```
<%= link_to "About", about_path %>
```
























Starting Point is
Day 9
