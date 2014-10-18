class ListOfList < ActiveRecord::Base
   has_many :lists
# run this from the rails console once and only once
# to populate the DB
   def self.load
      ListOfList.delete_all
      page = Wikipedia.find('List of lists of lists')
      output = page.content.scan(/\[\[(.*?)\]\]/).flatten
      output.each do |list|
         ListOfList.create!(title: list)
      end
   end
   
end