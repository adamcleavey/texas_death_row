class ChangeColumnPriorRecordToText < ActiveRecord::Migration
  def change
		change_column :executions, :prior_record, :text, :limit => nil
  end
end
