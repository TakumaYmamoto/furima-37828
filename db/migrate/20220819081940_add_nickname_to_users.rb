class AddNicknameToUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :nickname do |t|
      t.string :nickname,           null: false
      t.string :last_name,          null: false
      t.string :first_name,         null: false
      t.string :last_name_kana,     null: false
      t.string :first_name_kana,    null: false
      t.datetime :birth_date,         null: false
    end
  end
end
