Given("the following todos exist:") do |table|
  table.hashes.each do |row|
    Todo.create!(description: row["description"], category: row["category"])
  end
end

Given("I am on the todos page") do
  visit todos_path
end

When("I filter todos by {string}") do |category|
  select category, from: "category_filter"
  click_button "Filter"
end

Then("I should see {string}") do |text|
  expect(page).to have_content(text)
end

Then("I should not see {string}") do |text|
  expect(page).not_to have_content(text)
end
