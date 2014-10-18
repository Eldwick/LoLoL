class List < ActiveRecord::Base
   has_many :entries
   scope :random, -> {offset(rand(List.count)).first}
   scope :search, -> (search) {where("lower(title) like ?", "%#{search.downcase}%").uniq}

end
