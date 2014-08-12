class VolunteerGroupMapHistoriesController < ApplicationController
  before_action :set_volunteer_group_map_history, only: [:show, :edit, :update, :destroy]

  # GET /volunteer_group_map_histories
  # GET /volunteer_group_map_histories.json
  def index
    @volunteer_group_map_histories = VolunteerGroupMapHistory.all
  end

  # GET /volunteer_group_map_histories/1
  # GET /volunteer_group_map_histories/1.json
  def show
  end

  # GET /volunteer_group_map_histories/new
  def new
    @volunteer_group_map_history = VolunteerGroupMapHistory.new
  end

  # GET /volunteer_group_map_histories/1/edit
  def edit
  end

  # POST /volunteer_group_map_histories
  # POST /volunteer_group_map_histories.json
  def create
    @volunteer_group_map_history = VolunteerGroupMapHistory.new(volunteer_group_map_history_params)

    respond_to do |format|
      if @volunteer_group_map_history.save
        format.html { redirect_to @volunteer_group_map_history, notice: 'Volunteer group map history was successfully created.' }
        format.json { render action: 'show', status: :created, location: @volunteer_group_map_history }
      else
        format.html { render action: 'new' }
        format.json { render json: @volunteer_group_map_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /volunteer_group_map_histories/1
  # PATCH/PUT /volunteer_group_map_histories/1.json
  def update
    respond_to do |format|
      if @volunteer_group_map_history.update(volunteer_group_map_history_params)
        format.html { redirect_to @volunteer_group_map_history, notice: 'Volunteer group map history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @volunteer_group_map_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /volunteer_group_map_histories/1
  # DELETE /volunteer_group_map_histories/1.json
  def destroy
    @volunteer_group_map_history.destroy
    respond_to do |format|
      format.html { redirect_to volunteer_group_map_histories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_volunteer_group_map_history
      @volunteer_group_map_history = VolunteerGroupMapHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def volunteer_group_map_history_params
      params.require(:volunteer_group_map_history).permit(:group_id, :volunteer_id, :join_at, :quit_at, :is_leader)
    end
end
