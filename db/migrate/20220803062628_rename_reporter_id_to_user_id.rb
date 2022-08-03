class RenameReporterIdToUserId < ActiveRecord::Migration[7.0]
  def change
    rename_column :user_reports, :reporter_id, :user_id
  end
end
