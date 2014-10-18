class List < ActiveRecord::Base
   has_many :entries
   scope :random, -> {List.offset(rand(List.count)).first}
end
