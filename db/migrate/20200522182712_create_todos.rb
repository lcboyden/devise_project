class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :list
      t.string :task
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
