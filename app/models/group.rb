class Group < ActiveRecord::Base
  has_one :group_category
  
  def self.search(search, sort, direction)
    if search
      #where('Group.name LIKE ?', "%#{search}%")
      Group.find_by_sql("select a.*, b.category_name from groups a 
                          join group_categories b on a.category_id = b.id 
                          where a.name like '%#{search}%' or b.category_name like '%#{search}%'
                          order by #{sort} #{direction}")
    else
      scoped
    end
  end
   

end
