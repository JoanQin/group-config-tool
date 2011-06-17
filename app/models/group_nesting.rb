class GroupNesting < ActiveRecord::Base
  has_one :group_category
  
  def self.findNestedGroups (id)
    GroupNesting.find(
                :all, 
                :select => 'group_id, parent_id',
                :conditions=>["parent_id in (?)", id])
  end
  
end
