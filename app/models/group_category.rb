class GroupCategory < ActiveRecord::Base
  validates :category_name, :presence=>true
  validates :category_name, :uniqueness=>true
  has_many :groups
end
