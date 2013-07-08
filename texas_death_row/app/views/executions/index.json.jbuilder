json.array!(@executions) do |execution|
  json.extract! execution, :age, :age_at_offense, :age_when_received, :codefendants, :computed_age_at_offense, :computed_age_executed, :computed_age_recieved, :computed_days_before_received_after_offense, :computed_days_between_received_and_executed, :county, :date_executed, :date_received, :dob, :edu_level, :eyes, :first_name, :gender, :height, :info_sheet, :last_name, :last_statement, :number, :offense_date, :prior_occupation, :prior_record, :race, :summary, :tdcj, :victim_info, :weight
  json.url execution_url(execution, format: :json)
end
