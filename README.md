# EventMapper

EventMapper is just a small, threaded event library for Ruby I'm writing for a small side project. It's pretty simple and works pretty much the way you'd expect events to work in JavaScript with the exception of being threaded.

## Installation

Add this line to your application's Gemfile:

    gem 'eventmapper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install eventmapper

## Usage

	require 'eventmapper'

	class Thing
	  include EventMapper

	  events_sync? # true by default
	  events_sync = false # enables threaded callbacks
	end

	thing = Thing.new

	thing.on :something do
	  puts "I'm an event handler!"
	end

	thing.fire :something

	# with paramaters

	@thing.on :with_params do |first, second|
      puts "#{first} #{second}"
	end

	@thing.fire :with_params, 'hallo', 'hooman'

## Contributing

1. Fork it ( https://github.com/C0deMaver1ck/EventMapper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
