class GroupTool < ActiveRecord::Base
  has_many :groups
  has_many :group_nestings
end