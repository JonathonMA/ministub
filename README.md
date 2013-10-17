# Ministub

Tired of using OpenStruct and singleton methods for your
stubbing needs in Minitest? Suffering from a painful case of
RSpec envy? Look no further.

## Installation

Add this line to your application's Gemfile:

    gem 'ministub'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ministub

## Usage

Include the stub helper to get some nice sugar:

    include Ministub::TestHelper

We've got random object stubs:

    foo = [stub, stub]
    assert_equal 2, foo.size

We've got stubbed methods:

    person = stub name: "Jim"
    person.name # => "Jim"

Our stubbed methods don't care how they're called, they're
stubs!

    jim = stub friendly_with?: true
    fred = stub
    assert jim.friendly_with?(stub)

Stubbed methods can be a callable:

    jim = stub speak: ->(words) { words.upcase }
    assert_equal "SHOUT", jim.speak("shout")

Or define your method stubs afterwards:

    jim, bob = stub, stub
    jim.stub! :name, "Jim"

Or with a block:

    bob.stub!(:name) { "Bob" }

Oh and name your stubs!

    stub :jim
    jim.inspect # => #<Ministub(jim)>

That should cover it.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
