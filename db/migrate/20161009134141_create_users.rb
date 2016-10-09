class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :profile_img_url
      t.decimal :wallet, precision: 13, scale: 2
      t.text :bio

      t.timestamps
    end
  end
end
