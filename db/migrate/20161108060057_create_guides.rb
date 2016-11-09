class CreateGuides < ActiveRecord::Migration[5.0]
  def change
    create_table :guides do |t|
      t.string :title
      t.text :content
      t.string :toc
      t.references :user

      t.timestamps
    end
  end
end
