class CreateExecutions < ActiveRecord::Migration
  def change
    create_table :executions do |t|
      t.string :age
      t.string :age_at_offense
      t.string :age_when_received
      t.string :codefendants
      t.string :computed_age_at_offense
      t.string :computed_age_executed
      t.string :computed_age_recieved
      t.string :computed_days_before_received_after_offense
      t.string :computed_days_between_received_and_executed
      t.string :county
      t.string :date_executed
      t.string :date_received
      t.string :dob
      t.string :edu_level
      t.string :eyes
      t.string :first_name
      t.string :gender
      t.string :height
      t.string :info_sheet
      t.string :last_name
      t.string :last_statement
      t.string :number
      t.string :offense_date
      t.string :prior_occupation
      t.string :prior_record
      t.string :race
      t.string :summary
      t.string :tdcj
      t.string :victim_info
      t.string :weight

      t.timestamps
    end
  end
end
