class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false#, presence: true
      t.string :name, null: false#, presence: true

      t.timestamps
    end
  end
end
