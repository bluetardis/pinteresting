#Pinteresting - PB Notes

##Check the version
rails -v


##Create new workspace
rails new pinteresting
(This is already done for Cloud9 if you picked a rails environment and is the ~/workspace)


##Check that it actually works
###Start the Rails server
rails server -p $PORT -b $IP

##Git Setup
###Local Config
git config --global user.name "Your Name"
$ git config --global user.name #checks that your name is correct
$ git config --global user.email "your@email.com"
$ git config --global user.email #checks that your email is correct
$ git init
$ ls -a
$ ls (after cd into folder)
$ git status #shows you what files you are tracking (or not tracking)
$ git add . (or -A to add all)
$ git commit -am "initial commit"

####Recover/roll back
$git checkout -f #brings us back to the last version

##Server Config for GitHub
###generate a key ssh (CLOUD9 already as this done)
ssh-keygen -t rsa -C "peter@bluetardis.com.au"

###Test the connection
ssh -T git@github.com

###If all good then go to Git and create a repository
https://github.com/new

###Push up based on the info from Git for the new repository 
(Choose the SSH Option to generate the commands)
git remote add origin git@github.com:bluetardis/pinteresting.git
git push -u origin master




