module Middleman::GithubApi
  class Extension < ::Middleman::Extension
    option :repo, nil, 'target repository'

    def initialize(app, options_hash={}, &block)
      # Call super to build options from the options_hash
      super
      @app = app.inst

      repository = options_hash[:repo]
      unless repository
        $stderr.puts("middleman-github_api: repository option is missing")
        return
      end

      hash = {
        repository: repository,
      }

      require "octokit"
      access_token = ENV["MIDDLEMAN_GITHUB_API_ACCESS_TOKEN"]
      unless access_token
        $stderr.puts("middleman-github_api: GitHub access token is missing")
        $stderr.puts("Set token to MIDDLEMAN_GITHUB_API_ACCESS_TOKEN of environment variables")
        $stderr.puts("e.g.: $ export MIDDLEMAN_GITHUB_API_ACCESS_TOKEN=xxx")
        hash[:commits] = []
        @app.data.store(:github_api, hash)
        return
      end

      client = Octokit::Client.new(access_token: access_token)
      date = Time.now.strftime("%Y-%m-%d")
      raw_commits = client.commits_on(repository, date)
      commits = []
      raw_commits.each do |commit|
        commits << client.commit(repository, commit.sha)
      end
      hash[:commits] = commits

      @app.data.store(:github_api, hash)

      # set up your extension
      # puts options.my_option
    end

    def after_configuration
      # Do something
    end

    # A Sitemap Manipulator
    # def manipulate_resource_list(resources)
    # end

    # module do
    #   def a_helper
    #   end
    # end
  end
end
