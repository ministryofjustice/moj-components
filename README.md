# MoJ Components

This gem provides reusable components for the [MoJ Design System](https://design-patterns.service.justice.gov.uk/). It is built using the [ViewComponent](https://github.com/ViewComponent/view_component) framework.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add moj_components
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install moj_components
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

More [information about each of the components is available here.](https://moj-components-uat.apps.live.cloud-platform.service.justice.gov.uk/)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. 

### Ruby versions in this repo

- Local gem development uses the version in .ruby-version (currently 3.3.11).
- The minimum supported Ruby version for consumers is defined in moj_components.gemspec.
- The dummy Lookbook app deploy/runtime is defined separately in spec/dummy/dockerfile (currently Ruby 4.0.6).
- CI checks both paths:
  - compatibility across supported Ruby versions for the gem
  - production-style runtime smoke checks for the dummy app/Lookbook

## Releasing

Release a new version by running the ["Release gem" workflow](https://github.com/ministryofjustice/moj-components/actions/workflows/release.yml) and entering a version in `X.Y.Z` format (for example, `1.0.0`). The workflow creates a release branch and opens a PR to main for this new version.

The release PR updates:

- lib/moj_component/version.rb
- CHANGELOG.md
- Gemfile.lock
- spec/dummy/Gemfile.lock

After the PR is merged, publish.yml runs automatically, creates and pushes the version tag, and publishes the gem to RubyGems.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ministryofjustice/moj-components. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/ministryofjustice/moj-components/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MojComponents project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ministryofjustice/moj-components/blob/main/CODE_OF_CONDUCT.md).
