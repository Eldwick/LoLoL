class List < ActiveRecord::Base
    has_many :entries
    belongs_to :listoflist
    scope :random, -> {offset(rand(List.count)).first}
    scope :search, -> (search) {where("lower(title) like ?", "%#{search.downcase}%").uniq}

    def load
      ListOfList.all.each do |element|
          element.each do |entry|
            List.create( text: entry[0] , list_id: entry[1] )
          end
      end
    end
end
