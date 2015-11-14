Feature: middleman-github_api is activated

  Scenario: Activate middleman-github_api
    Given a fixture app "empty-app"
    And a file named "config.rb" with:
      """
      activate :github_api
      """
    When I run `middleman build --verbose`
    Then the exit status should be 0
    And the output should not contain "Unknown Extension: github_api"
