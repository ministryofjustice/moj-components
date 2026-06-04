# MoJ Components

This gem provides reusable components for the [MoJ Design System](https://design-patterns.service.justice.gov.uk/). It is built using the [ViewComponent](https://github.com/ViewComponent/view_component) framework.

## Installation

TODO: Replace `UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG
```

Install frontend packages that are used by moj-components:

```
npm install govuk-frontend @ministryofjustice/frontend
```

The gem will automatically add the frontend asset paths from node_modules to Rails.

## Usage

You can render components directly in templates using helper methods provided by the gem. E.g.:

```
<%= moj_alert(
      type: :information,
      heading: "Important",
      body: "Your application has been saved.",
      dismiss_href: "#",
      dismiss_text: "Dismiss"
    ) %>
```

More information about each of the components is available here: X

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ministryofjustice/moj-components. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/ministryofjustice/moj-components/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MojComponents project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ministryofjustice/moj-components/blob/main/CODE_OF_CONDUCT.md).
