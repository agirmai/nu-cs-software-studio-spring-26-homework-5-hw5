Feature: Filter todos by category
  As a user
  I want to filter my todo list by category
  So that I can focus on related tasks

  Background:
    Given the following todos exist:
      | description     | category |
      | Buy groceries   | Personal |
      | Write report    | Work     |
      | Call dentist    | Personal |

  Scenario: User filters todos by an existing category
    Given I am on the todos page
    When I filter todos by "Work"
    Then I should see "Write report"
    And I should not see "Buy groceries"
    And I should not see "Call dentist"

  Scenario: Category filter with no matches
    Given I am on the todos page
    When I filter todos by "School"
    Then I should see "No todos found"
    And I should not see "Buy groceries"
    And I should not see "Write report"
