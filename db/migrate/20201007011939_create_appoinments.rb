class CreateAppoinments < ActiveRecord::Migration[6.0]
  def change
    create_table :appoinments do |t|
      t.datetime :schedule
      t.boolean :status
      t.references :user, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
