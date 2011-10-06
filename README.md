# Guard::Yeti

## Install

Please be sure to have [Guard](https://github.com/guard/guard) and [Yeti](http://yuilibrary.com/projects/yeti/) installed before continue.

Install the gem:

    $ gem install guard-yeti

Add it to your Gemfile (inside test group):

    gem 'guard-yeti'

Add guard definition to your Guardfile with:

    $ guard init yeti

## Usage

Please read the [Guard usage documentation](https://github.com/guard/guard#readme).

start the yeti server and open the posted url in a browser


```
yeti --server
```

## Guardfile

Please read [Guard doc](https://github.com/guard/guard#readme) for more info about the Guardfile DSL.

### Rails app

``` ruby
guard 'yeti' do
  watch(%r{^public/javascripts/.*\.js}) { |m| "public/javascripts/test/#{m[1]}_test.html" }
  watch(%r{^public/javascripts/test/.*\.html}) 
end
```
## Author

[Simon Højberg](http://twitter.com/shojberg)
