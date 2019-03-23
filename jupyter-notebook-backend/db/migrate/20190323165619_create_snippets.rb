class CreateSnippets < ActiveRecord::Migration[5.2]
  def change
    create_table :snippets do |t|
      t.string :name
      t.text :code
      t.timestamps
    end
  end
end
