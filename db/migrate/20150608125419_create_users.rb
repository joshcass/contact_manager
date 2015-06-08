class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :provider
      t.text :uid
      t.string :name
      t.text :image

      t.timestamps null: false
    end
  end
end
