dotfiles
========

A place to keep config files so we can share and track them, with a script to symlink them for you. To get this up and running:


####All users
1. Fork this repo at github.com (so you can make changes for yourself)
1. Go to "settings" in the right sidebar of your repo and change the default branch to "maclab"
1. Open the Xcode application (found in your applications folder) and agree to the terms and conditions. (If you do not have Xcode already you will need to [download it](https://developer.apple.com/xcode/downloads/ "Download Xcode"). You will also need login and the [Command Line Tools](https://developer.apple.com/downloads/index.action "Developer Tools") for your version of OS X. This is a one-time per-machine step and you can immediately close out of Xcode afterwards.

####If using GitHub app
1. Open the GitHub app and make sure you are logged into your account using GitHub > Preferences, select "Accounts" and then enter your GitHub username and password, then click "Sign In"
1. Back in your browser, click on the "Clone in Desktop" button. It will automatically take you to the GitHub app and ask where you would like the repository cloned to
1. Make sure you clone your repository to your user (home) directory and name the repository "dotfiles"
2. Click "Clone"
 
####If using Terminal
1. On your repository's page (URL should be github.com/username/repo-name) find the SSH clone URL in the right menu and click the "Copy to clipboard" button. If it says "HTTPS clone URL" above the input box, click on the blue "SSH" link below, this will change the clone URL to use SSH instead of HTTPS, and then click on the "Copy to clipboard" button
1. Open Terminal and clone your fork into a dotfiles directory in your user (home) directory `git clone [paste ssh clone url] ~/dotfiles`, should look like: `git clone git@github.com:yourusername/yourreponame.git ~/dotfiles`
 
####All users
1. Open Terminal
1. Move into your dotfiles directory: `cd ~/dotfiles`
2. Make sure you are on the maclab branch: `git checkout maclab`
1. Delete unused master branch: `git branch -d master` then `git push origin :master` (don't forget the colon)
1. Add this repo as the upstream branch: `git remote add upstream git@github.com:ericconrad/dotfiles.git`, if you get an error message about upstream already existing, run: `git remote set-url upstream git@github.com:ericconrad/dotfiles.git`
1. Pull all latest changes from upstream: `git fetch upstream` then `git merge upstream/maclab`
1. Make sure you have bash-completion installed by running: `brew list | grep bash-completion` if nothing is returned, run: `cd ~`, then `git clone https://github.com/mxcl/homebrew.git`, and finally `brew install bash-completion` (don't worry about what it tells you to put in your .bash_profile, it's already there)
1. Make the symlink script executable: `chmod +x ~/dotfiles/symlink.sh`
1. Run the symlink.sh script: `~/dotfiles/symlink.sh`
1. Now open your dotfiles repository
    - If using GitHub app
        - Open the GitHub app
        - Find your dotfiles repository in the left sidebar and right-click or control-click the name of the repository, then choose "Open in Atom"
        - Edit the files by replacing the dummy GitHub user information with your information (specifically lines 16, 17, and 26 of .gitconfig)
    - If using Terminal
        - Open Terminal
        - Move into your dotfiles directory: `cd ~/dotfiles`
        - Open the dotfiles direcotry in Atom `open -a Atom .` (if you're using another application replace "Atom" with the application name)
        - Edit the files by replacing the dummy GitHub user information with your information (specifically lines 16, 17, and 26 of .gitconfig)
1. Quit terminal then re-open it, this reloads your .bash_profile. You could also run `source ~/.bash_profile`

## What this does
- Gives you color coded terminal inputs that are easier to read
- Formats your inputs so they are more descriptive and easier to understand
- Shows full directory paths so it is easier to understand where you are
- Shows GitHub branch names in your terminal input
- Gives a visual cue when you have changed and un-committed files in your repository
- Provides shortened aliases for frequently used commands 
    - `git status` becomes `git st`
    - `git add --all` becomes `git aa`
    - `git commit -m "message"` becomes `git cm "message"`
    - `ls -la` becomes `la`
    - `cd ..` becomes `..`
    - `showhiddenfiles` will show all hidden files in Finder
    - `hidehiddenfiles` will hide all hidden files in Finder
    - `source ~/.bash_profile` becomes `bp` (helpful for when you've updated your bash profile with other useful things
    
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
