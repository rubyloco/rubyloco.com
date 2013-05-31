# Ruby LoCo Website [![Build Status](https://travis-ci.org/rubyloco/rubyloco.com.png?branch=master)](https://travis-ci.org/rubyloco/rubyloco.com)

Rubyists of Loudoun County, VA. We meet the last Friday of every month, [please
join us](http://rubyloco.com/).

Our website is built using [Middleman](http://middlemanapp.com/), a static
site generator.

## Getting Started

Make sure ruby is installed. Duh. [RVM](https://rvm.io/),
[rbenv](http://rbenv.org/), whatever. Here's an example of getting rbenv up
and running using [homebrew](http://brew.sh/).

```bash
$ brew install rbenv
$ brew install ruby-build
```

A
[vendor everything](http://ryan.mcgeary.org/2011/02/09/vendor-everything-still-applies/)
approach in your development is recommended.

```bash
$ git clone git@github.com:rubyloco/rubyloco.com.git
$ cd rubyloco.com
$ rbenv install `cat .ruby-version` # if you lack this ruby version
$ bundle install --path vendor --local
```

Run the middleman server in development.

```bash
$ bundle exec middleman
$ open http://localhost:4567
```

## Publishing

The site is hosted on GitHub pages. To publish:

```bash
$ bundle exec middleman build --clean && middleman deploy
```

This will build the site, create a new commit in the gh-pages branch, and
automatically push that branch to origin.

## Some aliases to help with the middleman workflow

```bash
alias m="bundle exec middleman"
alias mpublish="m build --clean && m deploy"
```
