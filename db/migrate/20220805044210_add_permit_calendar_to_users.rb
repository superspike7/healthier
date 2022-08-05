class AddPermitCalendarToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :permit_calendar, :boolean, default: false
  end
end
