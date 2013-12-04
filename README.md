# Marionette

`marionette` is a simple CLI tool that provides useful scaffolding functionalities for puppet codebases.  
It provides an out of the box integration with frameworks, and tools such as rspec-puppet, serverspec, and vagrant, freeing you from having to setup all these frameworks everytime you start a new project, which means you can focus right away on the real work, and get things done.

**Note:** This is a proof of concept version, and will likely be rewritten.

## Installation

Installing `marionette` into the current directory:

    $ curl -L https://raw.github.com/drborges/marionette/master/install.sh | $SHELL

Installing `marionette` into a specific path:

    $ curl -L https://raw.github.com/drborges/marionette/master/install.sh | $SHELL /dev/stdin --path "/destination/path"

**Note:** For now you'll have to restart your shell session inorder to have `marionette` CLI available.

## Usage

#### Generating a new module:

    $ marionette generate module user-module

#### Generating a new module with code examples (unit, and integration tests):

    $ marionette generate module user-module --examples

#### Generating a new module into a specific path:

    $ marionette generate module user-module --path /home/user/puppet


# Why not Puppet Module Tool?

The idea behind Marionette is to provide a simple and ready to use puppet development workflow, enabling the developer to easily focus on good practices such as testing (TDD FTW), and reduce the development feedback loop, rather than only generate code for you.
