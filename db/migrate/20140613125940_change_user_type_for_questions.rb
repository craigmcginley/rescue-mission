class ChangeUserTypeForQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :user_id
    remove_column :answers, :user_id
    add_column :questions, :user, :string, null: false
    add_column :answers, :user, :string, null: false
  end
end
