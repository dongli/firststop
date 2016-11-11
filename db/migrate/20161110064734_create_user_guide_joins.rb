class CreateUserGuideJoins < ActiveRecord::Migration[5.0]
  def change
    create_table :user_guide_joins do |t|
      t.references :editor, class_name: 'User'
      t.references :guide

      t.timestamps
    end
  end
end
