# Ruby LoCo website

Rubyists of Loudoun County, VA. We meet the last Friday of every month, please join us.

## Getting Started

Install ruby. Duh.

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
$ bundle exec middleman --clean && middleman deploy
```

## Some aliases to help with the middleman workflow

```bash
alias m="bundle exec middleman"
alias mpublish="m build --clean && m deploy"
```
