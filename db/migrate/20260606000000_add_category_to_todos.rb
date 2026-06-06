class AddCategoryToTodos < ActiveRecord::Migration[8.0]
  def change
    add_column :todos, :category, :string
  end
end
