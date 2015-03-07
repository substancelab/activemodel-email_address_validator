# Email Address Validator

Whenever I have wanted to validate an email address it has been because I wanted to be somewhat certain I can send an email to someone. Usually this happens as part of a signup procedure.

At this point I have pretty much one criteria:

1. Only reject email addresses that aren't realistically in use by a potential user. Err on the side of accepting too much.

Quite frankly, I don't care about the RFC at this point, neither does the user. I care that my users can enter their email address and get on with using my product. I appreciate it if the application catches any misspellings, though.

## Requirements

* Should not accept local email addresses: No user ever needed to sign up using `"postmaster@localhost"` or `"bob@1.2.3.4"` even though they are perfectly valid email addresses.
* Must work with I18n: If not configured otherwise, the default translation key must be `"errors.messages.invalid"`. If an attribute translation exists, that must be used.

## Usage examples

### Simplest case

    validates :email, :email_address => true

### Bring your own regex

If you want to use a specific regular expression:

    validates :email, :email_address => {:format => /.+@.+\..+/}

### Stricter case

This also checks that the domain actually has an MX record. Note this might take a while because of DNS lookups.

    validates :email, :email_address => {:mx => true}

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activemodel-email_address_validator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activemodel-email_address_validator

## Resources

* http://stackoverflow.com/questions/201323/using-a-regular-expression-to-validate-an-email-address
* http://davidcel.is/blog/2012/09/06/stop-validating-email-addresses-with-regex/
* http://blog.myitcv.org.uk/2013/03/14/validators-in-rails-using-email-as-an-example.html

## Other libraries

### Serverside

* https://github.com/balexand/email_validator
* https://github.com/codyrobbins/active-model-email-validator
* https://github.com/franckverrot/activevalidators
* https://github.com/hallelujah/valid_email
* https://github.com/validates-email-format-of/validates_email_format_of

### Clientside

* https://github.com/mailcheck/mailcheck

## Contributing

1. Fork it ( https://github.com/substancelab/activemodel-email_address_validator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
