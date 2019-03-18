# AutoGemUpdater

Auto Gem Updater helps you to keep your gems, up to date.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'auto_gem_updater'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install auto_gem_updater

## Configuration

Configuration options are: `pre_checks, outdated_options, ignore_gems`

To config these options add a file to your `config/initializers` and call it `auto_gem_updater.rb`
This file should look like:
```ruby
AutoGemUpdater.configure do |config|
  config.pre_checks = ['bundle exec rspec']
end
```
each of the options above can be configured inside the above block (e.g `config.pre_checks = ['bundle exec rspec']`)

#### pre_checks
`pre_checks` is expected to be an array of all the checks you want performed before an update to a gem is commit 

For example `[bundle exec rspec, bundle exec rake routes,...]`

## Usage

Once the gem is installed it will add to some rake tasks that will allow you to update your gems.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/auto_gem_updater. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the AutoGemUpdater project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/auto_gem_updater/blob/master/CODE_OF_CONDUCT.md).
