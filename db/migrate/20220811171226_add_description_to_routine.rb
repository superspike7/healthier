class AddDescriptionToRoutine < ActiveRecord::Migration[7.0]
  def change
    add_column :routines, :description, :text
  end
end
