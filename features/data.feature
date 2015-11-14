Feature: data

  Scenario: target repository
    Given a fixture app "empty-app"
    And a file named "config.rb" with:
      """
      activate :github_api, repo: "myokoym/middleman-github_api"
      """
    And a file named "source/index.html.erb" with:
      """
      <%= data.github_api[:repository] %>
      """
    When I run `middleman build --verbose`
    Then the exit status should be 0
    And the file "build/index.html" should contain "myokoym/middleman-github_api"

  Scenario: commits (no access token)
    Given a fixture app "empty-app"
    And a file named "config.rb" with:
      """
      activate :github_api, repo: "myokoym/middleman-github_api"
      """
    And a file named "source/index.html.erb" with:
      """
      <%= data.github_api[:commits].size %>
      """
    When I run `middleman build --verbose`
    Then the exit status should be 0
    And the file "build/index.html" should contain "0"
