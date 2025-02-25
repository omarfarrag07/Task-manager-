class SprintsController < ApplicationController
  before_action :set_sprint, only: %i[ show edit update destroy ]

  # GET /sprints or /sprints.json
  def index
    @sprints = Sprint.all
  end

  # GET /sprints/1 or /sprints/1.json
  def show
  end

  # GET /sprints/new
  def new
    @sprint = Sprint.new
  end

  # GET /sprints/1/edit
  def edit
  end

  # POST /sprints or /sprints.json
  def create
    @sprint = Sprint.new(sprint_params)

    respond_to do |format|
      if @sprint.save
        format.html { redirect_to sprint_url(@sprint), notice: "Sprint was successfully created." }
        format.json { render :show, status: :created, location: @sprint }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sprint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sprints/1 or /sprints/1.json
  def update
    respond_to do |format|
      if @sprint.update(sprint_params)
        format.html { redirect_to sprint_url(@sprint), notice: "Sprint was successfully updated." }
        format.json { render :show, status: :ok, location: @sprint }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sprint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sprints/1 or /sprints/1.json
  def destroy
    @sprint.destroy!

    respond_to do |format|
      format.html { redirect_to sprints_url, notice: "Sprint was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sprint
      @sprint = Sprint.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sprint_params
      params.require(:sprint).permit(:project_id, :name, :start_date, :end_date)
    end
end
