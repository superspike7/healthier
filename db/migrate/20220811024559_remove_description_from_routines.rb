class RemoveDescriptionFromRoutines < ActiveRecord::Migration[7.0]
  def change
    remove_column :routines, :description, :string
  end
end
