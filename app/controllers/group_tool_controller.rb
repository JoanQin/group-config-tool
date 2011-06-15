class GroupToolController < ApplicationController
  
  helper_method :sort_column, :sort_direction
  def index
    @groups = Group.search(params[:search], sort_column, sort_direction).paginate(:per_page=> 20, :page=>params[:page], :order=>(sort_column + " " + sort_direction))
    @group_nestings = GroupNesting.find(:all, :conditions=>{ :parent_id => 0})
    
   
  end
  
  
  private
  
  def sort_column
    Group.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
 

end
