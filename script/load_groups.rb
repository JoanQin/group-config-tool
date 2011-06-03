Group.transaction do
  (1..1000).each do |i|
    Group.create(:name=>"Group #{i}", :category_id=>"#{Random.new.rand(1..12)}", :department_id=>"#{i}".rjust(4, '0'))
  end
end