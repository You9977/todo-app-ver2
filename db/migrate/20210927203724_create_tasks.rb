class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string   :title
      t.string   :category
      t.text     :detail
      t.datetime :deadline
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :tasks, [:user_id, :created_at]
  end
end
