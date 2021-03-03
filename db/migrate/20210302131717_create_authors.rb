class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :birthdate

      t.timestamps
    end

    add_index :authors, :email, unique: true
  end
end
