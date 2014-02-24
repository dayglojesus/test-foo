## A Puppet Anti-Pattern?

I realize this is not a conventional Puppet pattern, but using this pattern should work... I think.

What I am going for here is a dynamic module. It loads classes based on hiera data.

If hiera data for a given class is present, it loads (contains) that class. If not, the class isn't loaded and we compile without it.

This pattern allows you to specify no data in the module and push the majority of spec tests down to the sub-class level -- which is where the work gets done.

## Requirements

These are not strict requirements, rather they are what I was using for testing.

- OS X Mavericks
- Xcode Commandline Tools
- [puppet >= 3.4.0](http://downloads.puppetlabs.com/mac/puppet-3.4.0.dmg)
- [facter >= 1.74](http://downloads.puppetlabs.com/mac/facter-1.7.4.dmg)
- [hiera >= 1.3.1](http://downloads.puppetlabs.com/mac/hiera-1.3.1.dmg)

## Setup 

`cd` into the module's parent directory.

If you are using RVM, you probably won't need to `sudo bundle install`, but on vanilla OS X, here's what you need to do:

`sudo bundle install`

Then...

`bundle install`

...to grab the working version of 'hiera-puppet-helper' gem from GitHub.

(Bundler is fussy about installing gems from GitHub system-wide)

## Test

Run:

`rake spec`

Or:

    rake spec_prep
    rspec spec/classes/foo_spec.rb

## Failure

foo_spec.rb Fails.

Why does the spec fail??? I am having difficulty wrapping my head around this.

If you comment out the first spec, the _second spec passes_.

Moreover, after commenting out the first spec, if you change the value of the `hash` variable to a non-hash value like `false`, the _spec fails_ -- which is expected behaviour.

What am I missing? Is this a bug?
