class ChangeSnippetColumns < ActiveRecord::Migration[5.2]
  def change
    change_column_null :snippets, :name, false
    change_column_null :snippets, :code, false
  end
end
