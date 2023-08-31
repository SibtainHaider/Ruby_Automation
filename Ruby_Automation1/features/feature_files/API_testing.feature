Feature: API Testing

  Scenario: Testing the API
    Given There is an API with "Verify API"
    Then User Hit Post "Verify API" with "Post File"
    Then User Hit Get "Verify API"
    Then User Hit Put "API put" with "Update File"
    Then User Hit Delete "API put"

