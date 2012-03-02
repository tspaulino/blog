Feature: User views posts
  In order to have a functional blog
  A admin user
  Should see published posts

  Scenario: User viewing only published posts
    Given I have published posts titled "A new post"
    And I have unpublished posts titled "An unpublished post"
    When I am on the posts page
    Then I should see a post titled "A new post"
    And I should not see a post titled "An unpublished post"

  Scenario: Admin publishing a new post
    Given I have published posts titled "A new post"
    And I have unpublished posts titled "An unpublished post"
    When I publish a post titled "An unpublished post"
    And I am on the posts page
    Then I should see a post titled "A new post"
    And I should see a post titled "An unpublished post"
