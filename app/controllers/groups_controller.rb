
class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.xml
  helper_method :sort_column, :sort_direction
  
  def index        
    #@groups = Group.search(params[:search])     
    #@groups = Group.paginate :page=>params[:page], :order=>'id', :per_page=>10
    @groups = Group.search(params[:search], sort_column, sort_direction).paginate(:per_page=> 20, :page=>params[:page], :order=>(sort_column + " " + sort_direction))
    @group_nestings = GroupNesting.all
    
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.xml
  def show
    @group = Group.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.xml
  def new
    @group = Group.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
    
  end

  # POST /groups
  # POST /groups.xml
  def create
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        format.html { redirect_to(groups_url, :notice => 'Group was successfully created.') }
        format.xml  { render :xml => @group, :status => :created, :location => @group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.xml
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to(groups_url, :notice => 'Group was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.xml
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to(groups_url,:notice => 'Group was successfully deleted.') }
      format.xml  { head :ok }
    end
  end
  
  # it will show all the groups by a given category id
  def viewByCategory
    @groups = Group.find(:all, :conditions=>["category_id in (?)", params[:id]]).paginate(:per_page=> 20, :page=>params[:page], :order=>(sort_column + " " + sort_direction))
 
  end
  
  #it will show all the nested group under the given group id
  def viewNestGroup
    idstr = []
    @nestingroups = GroupNesting.findNestedGroups(params[:id])
    idstr[0] = params[:id] 
    while @nestingroups.count > 0
      idstr2 = []
      for nid in @nestingroups
        idstr << nid.group_id
        idstr2 << nid.group_id
      end
      @nestingroups = GroupNesting.findNestedGroups(idstr2)
    end
    
    @totalnesting = GroupNesting.findNestedGroups(idstr)
    @groups = Group.search(params[:search], sort_column, sort_direction).paginate(:per_page=> 20, :page=>params[:page], :order=>(sort_column + " " + sort_direction))
    
    respond_to do |format|
      format.html  #viewNestGroup.html.erb
    end
  end
  
  private
  
  def sort_column
    Group.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
