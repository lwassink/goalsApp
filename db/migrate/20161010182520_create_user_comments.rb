class CreateUserComments < ActiveRecord::Migration
  def change
    create_table :user_comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :goal, index: true, foreign_key: true
      t.text :body

      t.timestamps null: false
    end
  end
end
