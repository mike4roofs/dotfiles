# Dotfiles

Ubuntu dotfiles.

## Why is this a git repo?

http://dotfiles.github.io/

This project aspire to be a "framework" for managing my personal dotfiles.

This project is heavily inspired by the [Ben Alman](https://github.com/cowboy/dotfiles) dotfiles ( which I found awesome! ).

## What, exactly, does the "dotfiles" command do?

It's really not very complicated. When `dotfiles` is run, it does a few things:

1. Git is installed if necessary, via APT
2. This repo is cloned into the `~/.dotfiles` directory (or updated if it already exists).
2. "actions"  are executed (in alphanumeric order, hence the "50_" names).

Note:

* The `backups` folder only gets created when necessary. Any files in `~/` that would have been overwritten get backed up there.
* Files in `bin` are executable shell scripts (Eg. [~/.dotfiles/bin][bin] is added into the path).
* Files in `files/source` get sourced whenever a new shell is opened (in alphanumeric order, hence the "50_" names).
* Files in `conf` just sit there. If a config file doesn't _need_ to go in `~/`, put it in there.
* Files in `caches` are cached files, only used by some scripts. This folder will only be created if necessary.

## Installation

* You need to be an administrator (for `sudo`).
* You might want to set up your ubuntu server [like I do it](/cowboy/dotfiles/wiki/ubuntu-setup), but then again, you might not.
* Either way, you should at least update/upgrade APT with `sudo apt-get -qq update && sudo apt-get -qq dist-upgrade` first.
* You you're looking to my dotfiles and try to install it, you need to have Zsh installed, or you have to tweak the script ( a .zshrc file is linked, while no .bashrc files is ). Please note that in addition to Zsh I'm using [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)

### Actual Installation

Download:

```sh
$ wget https://raw.github.com/endorama/dotfiles/master/bin/dotfiles && bash ./dotfiles install
```

After download, to properly install dotfiles and execute all actions:

```sh
$ bash .dotfiles/bin/dotfiles
```

After this the .dotfiles/bin folder will be included in your PATH, so simply running `dotfiles` will update dotfiles.

## The "init" step
A whole bunch of things will be installed, but _only_ if they aren't already.

* APT packages
  * build-essential
  * libssl-dev
  * git-core
  * tree
  * sl
  * id3tool
  * cowsay
  * nmap
  * telnet
  * htop
* Nave
  * node (latest stable)
    * npm
    * grunt-cli
    * linken
    * bower
    * node-inspector
    * yo
* rbenv
  * ruby 2.0.0-p247
* gems
  * bundler
  * awesome_print
  * pry
  * lolcat

## The folder structure

├── action                all action to be performed
├── bin                     executable that will be available
├── conf                    all files used for dotfiles execution
│   └── first_time.sh         this file will be run ( if exists ) only on first execution
├── files                 all files used by action. By default all files inside the same folder are sourced
│   ├── appmanager          put appmanager scripts here
│   ├── closure             put closure scripts here
│   ├── copy                put files to be copied here
│   ├── init                put initialization scripts here
│   ├── link                put files to be linked here 
│   └── source              put files to be sources ( every shell session ) here
└── libs                  files to store git submodules and dotfiles lib files
    ├── appmanager          don't touch this! All appmanager helpers are here
    ├── dotfiles            don't touch this! All dotfiles helpers are here
    └── shared              don't touch this! All shared helpers are here


Inside files/*.sh you have some variable available for easy management:

* dot_folder: the root of the dotfiles repository
* dot_files ($dot_folder/files): the files folder
* dot_libs ($dot_folder/libs): the libs folder
* dot_cache ($dot_folder/caches): the cache folder

There are also a set of output helpers.  
To each method you can pass a string that will be printed:

* e_header(): print a header line ( bold blue )
* e_success(): print a success line ( prepend a green tick )
* e_error(): print an error line ( prepend a red cross )
* e_warn(): print a warning line ( a bold yellow line )
* e_arrow(): print a progress line ( prepend a yellow arrow )

* e_ok(): utility function to print a e_success with text "ok"  
* e_abort(): print error and exit with status code  
  $1 => error message, $2 => exit code
* e_return(): print warning and return  
  $1 => warn message

Also, you can use 2 function to test for command or variable existance:

* test_for_command: test of existance of given command  
  $1 => command human name  
  $2 => command executable ( if none $1 will be used )  
  Will execute a $1_installer function if command is not found  
* test_for_var(): test of existance of given variable  
  $1 => variable name  
  $2 => variable to be checked  

## The ~/ "copy" step
Any file in the `copy` subdirectory will be copied into `~/`. Any file that _needs_ to be modified with personal information (like a .gitconfig, which contains an email address and private key) should be _copied_ into `~/`. Because the file you'll be editing is no longer in `~/.dotfiles`, it's less likely to be accidentally committed into your public dotfiles repo.

## The ~/ "link" step
Any file in the `link` subdirectory gets symbolically linked with `ln -s` into `~/`. Edit these, and you change the file in the repo. Don't link files containing sensitive data, or you might accidentally commit that data!

## Aliases and Functions
To keep things easy, the `~/.zshrc` file is extremely simple, and should never need to be modified. Instead, add your aliases, functions, settings, etc into one of the files in the `source` subdirectory, or add a new file. They're all automatically sourced when a new shell is opened.

## Scripts
In addition to the aforementioned dotfiles script, there are a few other bash scripts and program.

This includes some git submodule that will be installed into libs folder.

## Appmanager
In case you need to install custom applications from source ( chrome canary, phantomjs ) or for which you were using the command line, there is a easy way to do that.

Using the `bin/appmanager` script you can install, uninstall, run or upgrade application using custom defined Bash scripts.

To add a new script, drop it in `files/appmanager`, calling it `application-name.sh`. Simply as that.

Now you can run `appmanager list` and your script will be shown.

Inside the `application-name.sh` you can define 4 functions ( are all optionals ):

- {application-name}_install: This function will be executed when you run `appmanager install application-name`
- {application-name}_run: This function will be executed when you run `appmanager run application-name`
- {application-name}_uninstall: This function will be executed when you run `appmanager uninstall application-name`
- {application-name}_upgrade: This function will be executed when you run `appmanager upgrade application-name`

Inside this function you have 3 variables related to your application:

- appmng_bin_dir="/opt/bin": the destination for binaries. `/opt/bin` is included in PATH, so a simply symlink here are you're good to go
- appmng_dest_dir="/opt": the destination folder for your application
- appmng_app_dir="$appmng_dest_dir/{application-name}": the folder in which your application will be installed. `appmanager` automatically test for existance and create this folder if it doesn't
- appmng_cli_args: extra command line assed to the run method

## Libs
If you need to include a third party library ( in the form of a git repository ) you can use Git submodules.

## Inspiration
<https://github.com/gf3/dotfiles>  
<https://github.com/mathiasbynens/dotfiles>  
<https://github.com/cowboy/dotfiles>
(and 4+ years of accumulated crap)

Heavily inpired by [Ben Alman dotfiles](https://github.com/cowboy/dotfiles).

## License
Copyright (c) 2013 "Endorama" Edoardo Tenani
Licensed under the MIT license. 
http://endorama.mit-license.org
