class CreateChapters < ActiveRecord::Migration[5.0]
  def change
    create_table :chapters do |t|
      t.string     :title
      t.string     :abstract
      t.text       :content
      t.string     :toc
      t.references :guide

      t.timestamps
    end
  end
end
