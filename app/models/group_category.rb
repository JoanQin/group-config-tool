class GroupCategory < ActiveRecord::Base
  validates :category_name, :presence=>true
  validates :category_name, :uniqueness=>true
  belongs_to :groups
  belongs_to :group_nesting
end
