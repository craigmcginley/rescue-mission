class UserFieldsNotRequired < ActiveRecord::Migration
  def up
    change_column :questions, :user_id, :integer, null: true
    change_column :answers, :user_id, :integer, null: true
  end

  def down
    change_column :questions, :user_id, :integer, null: false
    change_column :answers, :user_id, :integer, null: false
  end
end
