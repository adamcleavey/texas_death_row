class ChangeSummaryAndLastStatementToText < ActiveRecord::Migration
  def change
		change_column :executions, :summary, :text, :limit => nil
		change_column :executions, :last_statement, :text, :limit => nil
  end
end
