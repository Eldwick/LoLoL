class List < ActiveRecord::Base
   has_many :entries
   scope :random, -> {offset(rand(List.count)).first}
end
