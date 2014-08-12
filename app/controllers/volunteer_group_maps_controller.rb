class VolunteerGroupMapsController < ApplicationController
  before_action :set_volunteer_group_map, only: [:show, :edit, :update, :destroy,
                                                 :remove_group_for_volunteer, :remove_volunteer_for_group,
                                                 :set_as_group_leader]

  # GET /volunteer_group_maps
  # GET /volunteer_group_maps.json
  def index
    @volunteer_group_maps = VolunteerGroupMap.all
  end

  # GET /volunteer_group_maps/1
  # GET /volunteer_group_maps/1.json
  def show
  end

  #查看某义工所属分组
  def show_group_by_volunteer
    @volunteer = Volunteer.find(params[:volunteer_id])
    maps = VolunteerGroupMap.find_by_sql(["select * from volunteer_group_maps where volunteer_id = ?", @volunteer.id])
    # @groups = Group.find_by_sql(["select a.*, b.id as map_id from groups a inner join volunteer_group_maps b on a.id = b.group_id \
    #   where b.volunteer_id=?", @volunteer_id])
    @list = maps.map {|x|
      [x, Group.find(x.group_id)]
    }

    puts "groups= #{@list}"
    @not_in_groups = Group.all.select{|x| not @list.map{|y| y[1].id}.include?(x.id) }
    # render :template => "groups/index", :locals => {:groups => @groups}
  end

  #为某义工添加某小组
  def add_groups_for_volunteer
    @volunteer = Volunteer.find(params[:volunteer_id])
    groups = params.select{|k, v| k.include? 'groups_'}
    #1. 添加到对应表
    groups.each {|key, new_group_id|
      item = VolunteerGroupMap.new(volunteer_id: @volunteer.id, group_id: new_group_id, join_at: Time.now)
      item.save
    }
    #2. 添加到对应历史表 TODO
    #3. 返回到 show_group_by_volunteer action
    redirect_to show_group_by_volunteer_volunteer_group_maps_path(volunteer_id: @volunteer.id), status: 302
  end

  def remove_group_for_volunteer
    @volunteer_group_map.destroy
    volunteer_id = @volunteer_group_map.volunteer_id
    #2. 添加到对应历史表 TODO

    #3. 返回到 show_group_by_volunteer action
    redirect_to show_group_by_volunteer_volunteer_group_maps_path(volunteer_id: volunteer_id), status: 302
  end

  #查看某小组有哪些义工
  def show_volunteer_by_group
    # render html: 'volunteer/index.html', @volunteers
    # render :template => "volunteers/index", :locals => {:volunteers => @volunteers}

    @group = Group.find(params[:group_id])
    maps = VolunteerGroupMap.find_by_sql(["select * from volunteer_group_maps where group_id = ?", @group.id])
    @list = maps.map {|x|
      [x, Volunteer.find(x.volunteer_id)]
    }
  end

  def remove_volunteer_for_group
    @volunteer_group_map.destroy
    group_id = @volunteer_group_map.group_id
    #2. 添加到对应历史表 TODO
    #3. 返回到 show_volunteer_by_group action
    redirect_to show_volunteer_by_group_volunteer_group_maps_path(group_id: group_id), status: 302
  end

  def set_as_group_leader
    is_leader = params[:is_leader]
    @volunteer_group_map.is_leader = is_leader
    @volunteer_group_map.save
    redirect_to show_volunteer_by_group_volunteer_group_maps_path(group_id: @volunteer_group_map.group_id), status: 302
  end

  # GET /volunteer_group_maps/new
  def new
    @volunteer_group_map = VolunteerGroupMap.new
  end

  # GET /volunteer_group_maps/1/edit
  def edit
  end

  # POST /volunteer_group_maps
  # POST /volunteer_group_maps.json
  def create
    @volunteer_group_map = VolunteerGroupMap.new(volunteer_group_map_params)

    respond_to do |format|
      if @volunteer_group_map.save
        format.html { redirect_to @volunteer_group_map, notice: 'Volunteer group map was successfully created.' }
        format.json { render action: 'show', status: :created, location: @volunteer_group_map }
      else
        format.html { render action: 'new' }
        format.json { render json: @volunteer_group_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /volunteer_group_maps/1
  # PATCH/PUT /volunteer_group_maps/1.json
  def update
    respond_to do |format|
      if @volunteer_group_map.update(volunteer_group_map_params)
        format.html { redirect_to @volunteer_group_map, notice: 'Volunteer group map was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @volunteer_group_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /volunteer_group_maps/1
  # DELETE /volunteer_group_maps/1.json
  def destroy
    @volunteer_group_map.destroy
    respond_to do |format|
      format.html { redirect_to volunteer_group_maps_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_volunteer_group_map
      @volunteer_group_map = VolunteerGroupMap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def volunteer_group_map_params
      params.require(:volunteer_group_map).permit(:group_id, :volunteer_id, :join_at, :is_leader)
    end
end
