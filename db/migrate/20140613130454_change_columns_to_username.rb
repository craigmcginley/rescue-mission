class ChangeColumnsToUsername < ActiveRecord::Migration
  def change
    remove_column :questions, :user
    remove_column :answers, :user
    add_column :questions, :user_name, :string, null: false
    add_column :answers, :user_name, :string, null: false
  end
end
