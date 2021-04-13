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

Given the following serializer class:
```ruby
# app/serializers/user_serializer.rb

class UserSerializer
  include JSONAPI::Serializer

  set_type :user

  belongs_to :team
  has_one    :blog
  has_many   :blog_posts

  attributes :first_name, :last_name, :email

  attribute :created_at do |user|
    user.created_at.iso8601
  end

  attribute :updated_at do |user|
    user.updated_at.iso8601
  end

  meta do |user|
    {
      blog_posts_count: user.blog_posts_count
    }
  end

  link(:self) { |user| "example.com/path/to/user/#{user.id}" }
end
```

This is how to use `rspec_jsonapi_serializer` in your tests:
```ruby
# spec/serializers/user_serializer_spec.rb

RSpec.describe UserSerializer, type: :serializer do
  subject { described_class.new(user) }

  let(:user) do
    User.new(
      id: 1,
      first_name: 'John',
      last_name: 'Doe',
      email: 'john.doe@example.com',
      created_at: Time.utc(2021),
      updated_at: Time.utc(2021)
    )
  end

  it { is_expected.to have_type(:user) }

  it { is_expected.to belong_to(:team) }
  it { is_expected.to have_one(:blog) }
  it { is_expected.to have_many(:blog_posts) }

  it { is_expected.to serialize_attribute(:first_name) }
  it { is_expected.to serialize_attribute(:last_name) }
  it { is_expected.to serialize_attribute(:email) }
  it { is_expected.to serialize_attribute(:created_at).as('2021-01-01T00:00:00Z') }
  it { is_expected.to serialize_attribute(:updated_at).as('2021-01-01T00:00:00Z') }

  it { is_expected.to serialize_meta(:blog_posts_count).as(0) }
  it { is_expected.to serialize_link(:self).as('example.com/path/to/user/1') }
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
