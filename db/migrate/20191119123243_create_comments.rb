class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :article, index: true

      t.timestamps
    end
    add_foreign_key :comments, :articles, on_delete: :cascade
  end
end
