# Middleman::GithubApi

A Middleman extension for GitHub API.

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
