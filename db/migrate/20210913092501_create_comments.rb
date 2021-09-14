class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :text,  null: false
      t.references :user, null: false, foreign_key: true
      t.references :prototype, null: false, foreign_key: true
       #references型を使うと外部キー制約をつける時にforeign_key: trueが使える

      t.timestamps
    end
  end
end