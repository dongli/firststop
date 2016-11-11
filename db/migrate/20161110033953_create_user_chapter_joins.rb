class CreateUserChapterJoins < ActiveRecord::Migration[5.0]
  def change
    create_table :user_chapter_joins do |t|
      t.references :author, class_name: 'User'
      t.references :chapter

      t.timestamps
    end
  end
end
