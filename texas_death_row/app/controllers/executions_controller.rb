class ExecutionsController < ApplicationController
  before_action :set_execution, only: [:show, :edit, :update, :destroy]

  # GET /executions
  # GET /executions.json
  def index
    @executions = Execution.all
		respond_to do |format|
			format.html
			format.csv { send_data @executions.to_csv }
			format.xls
			format.json { render json: @executions.to_json }
		end
  end

  # GET /executions/1
  # GET /executions/1.json
  def show
  end

  # GET /executions/new
  def new
    @execution = Execution.new
  end

  # GET /executions/1/edit
  def edit
  end

  # POST /executions
  # POST /executions.json
  def create
    @execution = Execution.new(execution_params)

    respond_to do |format|
      if @execution.save
        format.html { redirect_to @execution, notice: 'Execution was successfully created.' }
        format.json { render action: 'show', status: :created, location: @execution }
      else
        format.html { render action: 'new' }
        format.json { render json: @execution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /executions/1
  # PATCH/PUT /executions/1.json
  def update
    respond_to do |format|
      if @execution.update(execution_params)
        format.html { redirect_to @execution, notice: 'Execution was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @execution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /executions/1
  # DELETE /executions/1.json
  def destroy
    @execution.destroy
    respond_to do |format|
      format.html { redirect_to executions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_execution
      @execution = Execution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def execution_params
      params.require(:execution).permit(:age, :age_at_offense, :age_when_received, :codefendants, :computed_age_at_offense, :computed_age_executed, :computed_age_recieved, :computed_days_before_received_after_offense, :computed_days_between_received_and_executed, :county, :date_executed, :date_received, :dob, :edu_level, :eyes, :first_name, :gender, :height, :info_sheet, :last_name, :last_statement, :number, :offense_date, :prior_occupation, :prior_record, :race, :summary, :tdcj, :victim_info, :weight)
    end
end
