# Require core library
require 'middleman-core'

::Middleman::Extensions.register(:github_api) do
  require 'middleman-github_api/extension'
  ::Middleman::GithubApi::Extension
end
