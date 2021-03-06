class GroupCategoriesController < ApplicationController
  # GET /group_categories
  # GET /group_categories.xml
  
  helper_method :sort_column, :sort_direction
  def index
    @group_categories = GroupCategory.find(:all, :order=>"order_by")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @group_categories }
    end
  end

  # GET /group_categories/1
  # GET /group_categories/1.xml
  def show
    @group_category = GroupCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @group_category }
    end
  end

  # GET /group_categories/new
  # GET /group_categories/new.xml
  def new
    @group_category = GroupCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group_category }
    end
  end

  # GET /group_categories/1/edit
  def edit
    @group_category = GroupCategory.find(params[:id])
  end

  # POST /group_categories
  # POST /group_categories.xml
  def create
    @group_category = GroupCategory.new(params[:group_category])

    respond_to do |format|
      if @group_category.save
        format.html { redirect_to(group_categories_url, :notice => 'Group category was successfully created.') }
        format.xml  { render :xml => @group_category, :status => :created, :location => @group_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @group_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /group_categories/1
  # PUT /group_categories/1.xml
  def update
    @group_category = GroupCategory.find(params[:id])

    respond_to do |format|
      if @group_category.update_attributes(params[:group_category])
        format.html { redirect_to(group_categories_url, :notice => 'Group category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /group_categories/1
  # DELETE /group_categories/1.xml
  def destroy
    @group_category = GroupCategory.find(params[:id])
    @group_category.destroy

    respond_to do |format|
      format.html { redirect_to(group_categories_url, :notice => 'Group category was successfully deleted.') }
      format.xml  { head :ok }
    end
  end
  
  
  
end
