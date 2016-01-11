# CopyHawk

Copyhawk Gem allows you to access all your Copyhawk content programmatically inside any Ruby application.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'copy_hawk'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install copy_hawk

## Usage

Three environment variables are required for this gem to work correctly. COPYHAWK_SITE_TOKEN,COPYHAWK_ACCOUNT_TOKEN, COPYHAWK_DEFAULT_LANGUAGE. Your site token and you account token can be found inside your site's dashboard on [copyhawk's](https://www.copyhawk.co) site.
In order to use the Gem simply get an Eyas from the copy_hawk module. After getting an Eyas, you will have 3 interfaces you can use. They are:

`preview_copy(label, language)`
Get Preview Copy fetches Staged content.
Label is your script's label and language is the specific language you require. Language is optional and every request will default to your Default Language in case its not provided on every request.

`single_copy(label, language)`
Get Single Copy fetches live content, one label at a time.
Label is your script's label and language is the specific language you require. Language is optional and every request will default to your Default Language in case its not provided on every request.

`multi_copy(labels, language)`
Get Multi Copy fetches live content by a list of labels in one single request. If any labels in the list are not Live or defined, the API will return a 404.
Labels are your scripts' label and language is the specific language you require. Language is optional and every request will default to your Default Language in case its not provided on every request.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/copyhawk/ruby-sdk. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
