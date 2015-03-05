dotfiles
========

A place to keep config files so we can share and track them, with a script to symlink them for you. To get this up and running:

1. Fork this repo at github.com (so you can make changes for yourself)
1. Copy the ssh clone url from the right sidebar of your repo
1. Go to "settings" in the right sidebar of your repo and change the default branch to "maclab"
1. In terminal: Clone your fork into ~/dotfiles: `git clone [paste ssh clone url] dotfiles`, should look like: `git clone git@github.com:yourusername/yourreponame.git dotfiles`
1. Move into your dotfiles directory: `cd ~/dotfiles`
1. Delete unused master branch: `git branch -d master` then `git push origin :master` (don't forget the colon)
1. Add this repo as the upstream branch: `git remote add upstream git@github.com:ericconrad/dotfiles.git`, if you get an error message about upstream already existing, run: `git remote set-url upstream git@github.com:ericconrad/dotfiles.git`
1. Pull all latest changes from upstream: `git fetch upstream` then `git merge upstream/maclab`
1. Make sure you have bash-completion installed by running: `brew list | grep bash-completion` if nothing is returned, run: `cd ~`, then `git clone https://github.com/mxcl/homebrew.git`, then `export PATH=${HOME}/homebrew/bin:${PATH}`, and finally `brew install bash-completion` (don't worry about what it tells you to put in your .bash_profile, it's already there)
1. Make the symlink script executable: `chmod +x ~/dotfiles/symlink.sh`
1. Run the symlink.sh script: `~/dotfiles/symlink.sh`
1. Now open your dotfiles repository to edit the files with your information (specifically lines 16, 17, and 26 of .gitconfig): `cd ~/dotfiles` then `open -a Atom .` (if you're using another application replace "Atom" with the application name)
1. Quit terminal then re-open it, this reloads your .bash_profile. You could also run `source ~/.bash_profile`

## Current dotfiles included

### .bash_profile

Bash configuration file loaded on every terminal session. If you make a change here, make sure you run `source ~/.bash_profile` to reload it. Things that go here are bash aliases, $PATH definition, bash prompt setup, etc.

### .gitconfig

User-level configuration file for all things git. Anything you would normally add with `git config --global --add key.subkey value` can be added in the .gitconfig file as:

```
[key]
	subkey = value
```

We currently set up user config (**which you should change to be your own user/email**), color ui turned on, and git aliases.
