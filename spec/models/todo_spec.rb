require "rails_helper"

RSpec.describe Todo, type: :model do
  describe ".with_category" do
    it "returns only todos in the selected category" do
      work_todo = Todo.create!(description: "Write report", category: "Work")
      Todo.create!(description: "Buy groceries", category: "Personal")

      results = Todo.with_category("Work")

      expect(results).to contain_exactly(work_todo)
    end
  end
end
