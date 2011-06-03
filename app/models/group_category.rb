class GroupCategory < ActiveRecord::Base
  validates :name, :presence=>true
  validates :name, :uniqueness=>true
  has_many :groups
end
