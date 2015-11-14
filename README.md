# Middleman::GithubApi

[![Gem Version](https://badge.fury.io/rb/middleman-github_api.svg)](http://badge.fury.io/rb/middleman-github_api)

A [Middleman][] extension for GitHub API as [Data Files](https://middlemanapp.com/advanced/data_files/).

[Middleman]: https://middlemanapp.com/

## Installation

Add this line to your application's Gemfile:

    gem 'middleman-github_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install middleman-github_api

## Usage

Set access token for environment variables:

```bash
$ export MIDDLEMAN_GITHUB_API_ACCESS_TOKEN=xxx
```

config.rb:

```ruby
activate :github_api, repo: "myokoym/middleman-github_api"
```

source:

```erb
<% data.github_api[:commits].each do |commit| %>
  <% commit.files.each do |file| %>
    <pre>
      <%= file.patch %>
    </pre>
  <% end %>
<% end %>
```

## Example

https://github.com/myokoym/middleman-github_api-example
