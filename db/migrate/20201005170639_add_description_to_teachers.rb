class AddDescriptionToTeachers < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :description, :string
  end
end
