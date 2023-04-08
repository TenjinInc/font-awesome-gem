# Gem Wrapper: FontAwesome - Free

This is an unofficial thin wrapper gem to distribute the free version of
the [FontAwesome](https://github.com/FortAwesome/Font-Awesome) icon library.

Please see that project for the original documentation on how to use FontAwesome in general. Continue below for details
specific to using this gem.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add font-awesome-free

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install font-awesome-free

## Usage

TODO: Write usage instructions here

## Versioning

The gem's versioning will mirror the original library's. Any gem-specific version updates will be indicated by a fourth
version number after patch. For example, compared to `1.0.0.0`:

* `2.0.0.0` FontAwesome major change
* `1.1.0.0` FontAwesome minor change
* `1.0.1.0` FontAwesome patch change
* `1.0.0.1` Wrapper gem change

As the wrapper gem is intended to be as minimal as possible, it will not distinguish between major/minor/patch.

## Development

After checking out the repo, run:

    bundle install 

To install this gem onto your local machine, run:

    bundle exec rake install

To release a new version, **update the version number** in `version.rb`, and then run:

    bundle exec rake release

which will:

1. create a git tag for the version,
2. push git commits and the created tag,
3. and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/TenjinInc/font-awesome-gem. This project is
intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to
the [code of conduct](https://github.com/TenjinInc/font-awesome-gem/blob/master/CODE_OF_CONDUCT.md).

Contributions to the gem-specific files are welcome, but any changes to the original project should be directed there.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

The original licence is available under its own licencing terms.

## Code of Conduct

Everyone interacting in the gem project's codebases, issue trackers, chat rooms and mailing lists is expected to follow
the [Code of Conduct](https://github.com/TenjinInc/font-awesome-gem/blob/master/CODE_OF_CONDUCT.md).
