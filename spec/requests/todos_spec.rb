require "rails_helper"

RSpec.describe "Todos index filtering", type: :request do
  it "filters todos by category param" do
    Todo.create!(description: "Write report", category: "Work")
    Todo.create!(description: "Buy groceries", category: "Personal")

    get todos_path, params: { category: "Work" }

    expect(response).to have_http_status(:ok)
    expect(response.body).to include("Write report")
    expect(response.body).not_to include("Buy groceries")
  end

  it "shows empty result when category has no matches" do
    Todo.create!(description: "Write report", category: "Work")

    get todos_path, params: { category: "School" }

    expect(response).to have_http_status(:ok)
    expect(response.body).to include("No todos found")
  end
end
