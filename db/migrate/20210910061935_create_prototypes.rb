class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string :title,    null: false
      t.text :catch_copy, null: false
      t.text :concept,    null: false
      t.references :user, null: false, foreign_key: true   #references型を使うと外部キー制約をつける時にforeign_key: trueが使える

      t.timestamps
    end
  end
end
