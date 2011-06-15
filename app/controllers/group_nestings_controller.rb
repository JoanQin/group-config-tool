class GroupNestingsController < ApplicationController
  # GET /group_nestings
  # GET /group_nestings.xml
  
  helper_method :sort_column, :sort_direction
  def index
    @group_nestings = Group.find(:all, :conditions=>["id not in(?)", [1]]).paginate(:per_page=> 20, :page=>params[:page], :order=>(sort_column + " " + sort_direction))

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @group_nestings }
    end
  end

  # GET /group_nestings/1
  # GET /group_nestings/1.xml
  def show
    @group_nesting = GroupNesting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @group_nesting }
    end
  end

  # GET /group_nestings/new
  # GET /group_nestings/new.xml
  def new
    @group_nesting = GroupNesting.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group_nesting }
    end
  end

  # GET /group_nestings/1/edit
  def edit
    @group_nesting = GroupNesting.find(params[:id])
  end

  # POST /group_nestings
  # POST /group_nestings.xml
  def create
    @group_nesting = GroupNesting.new(params[:group_nesting])

    respond_to do |format|
      if @group_nesting.save
        format.html { redirect_to(groups_url, :notice => 'Group nesting was successfully created.') }
        format.xml  { render :xml => @group_nesting, :status => :created, :location => @group_nesting }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @group_nesting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /group_nestings/1
  # PUT /group_nestings/1.xml
  def update
    @group_nesting = GroupNesting.find(params[:id])

    respond_to do |format|
      if @group_nesting.update_attributes(params[:group_nesting])
        format.html { redirect_to(groups_url, :notice => 'Group nesting was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group_nesting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /group_nestings/1
  # DELETE /group_nestings/1.xml
  def destroy
    @group_nesting = GroupNesting.find(params[:id])
    @group_nesting.destroy

    respond_to do |format|
      format.html { redirect_to(groups_url, :notice=> 'Group nesting was successfully deleted.') }
      format.xml  { head :ok }
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
