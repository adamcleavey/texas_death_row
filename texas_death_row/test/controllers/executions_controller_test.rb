require 'test_helper'

class ExecutionsControllerTest < ActionController::TestCase
  setup do
    @execution = executions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:executions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create execution" do
    assert_difference('Execution.count') do
      post :create, execution: { age: @execution.age, age_at_offense: @execution.age_at_offense, age_when_received: @execution.age_when_received, codefendants: @execution.codefendants, computed_age_at_offense: @execution.computed_age_at_offense, computed_age_executed: @execution.computed_age_executed, computed_age_recieved: @execution.computed_age_recieved, computed_days_before_received_after_offense: @execution.computed_days_before_received_after_offense, computed_days_between_received_and_executed: @execution.computed_days_between_received_and_executed, county: @execution.county, date_executed: @execution.date_executed, date_received: @execution.date_received, dob: @execution.dob, edu_level: @execution.edu_level, eyes: @execution.eyes, first_name: @execution.first_name, gender: @execution.gender, height: @execution.height, info_sheet: @execution.info_sheet, last_name: @execution.last_name, last_statement: @execution.last_statement, number: @execution.number, offense_date: @execution.offense_date, prior_occupation: @execution.prior_occupation, prior_record: @execution.prior_record, race: @execution.race, summary: @execution.summary, tdcj: @execution.tdcj, victim_info: @execution.victim_info, weight: @execution.weight }
    end

    assert_redirected_to execution_path(assigns(:execution))
  end

  test "should show execution" do
    get :show, id: @execution
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @execution
    assert_response :success
  end

  test "should update execution" do
    patch :update, id: @execution, execution: { age: @execution.age, age_at_offense: @execution.age_at_offense, age_when_received: @execution.age_when_received, codefendants: @execution.codefendants, computed_age_at_offense: @execution.computed_age_at_offense, computed_age_executed: @execution.computed_age_executed, computed_age_recieved: @execution.computed_age_recieved, computed_days_before_received_after_offense: @execution.computed_days_before_received_after_offense, computed_days_between_received_and_executed: @execution.computed_days_between_received_and_executed, county: @execution.county, date_executed: @execution.date_executed, date_received: @execution.date_received, dob: @execution.dob, edu_level: @execution.edu_level, eyes: @execution.eyes, first_name: @execution.first_name, gender: @execution.gender, height: @execution.height, info_sheet: @execution.info_sheet, last_name: @execution.last_name, last_statement: @execution.last_statement, number: @execution.number, offense_date: @execution.offense_date, prior_occupation: @execution.prior_occupation, prior_record: @execution.prior_record, race: @execution.race, summary: @execution.summary, tdcj: @execution.tdcj, victim_info: @execution.victim_info, weight: @execution.weight }
    assert_redirected_to execution_path(assigns(:execution))
  end

  test "should destroy execution" do
    assert_difference('Execution.count', -1) do
      delete :destroy, id: @execution
    end

    assert_redirected_to executions_path
  end
end
