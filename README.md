# RSpecJSONAPISerializer

RSpec matchers for the [jsonapi-serializer](https://github.com/jsonapi-serializer/jsonapi-serializer) gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec_jsonapi_serializer'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rspec_jsonapi_serializer

## Usage

Add this line to your RSpec config in `rails_helper.rb` (or `spec_helper.rb` if you're not using Rails):

```ruby
RSpec.configure do |config|
  config.include(RSpecJSONAPISerializer::Matchers, type: :serializer)
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/teamintricately/rspec_jsonapi_serializer. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/teamintricately/rspec_jsonapi_serializer/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RSpecJSONAPISerializer project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rspec_jsonapi_serializer/blob/master/CODE_OF_CONDUCT.md).
