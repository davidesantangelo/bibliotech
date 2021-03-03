class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books, id: :uuid do |t|
      t.string :title
      t.text :description
      t.boolean :visibility, default: true
      t.string :isbn
      t.references :publisher, null: true, foreign_key: true, type: :uuid
      t.references :author, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :books, :isbn, unique: true
    add_index :books, :title
  end
end
