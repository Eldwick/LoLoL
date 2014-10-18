class ListOfList < ActiveRecord::Base
# run this from the rails console once and only once
# to populate the DB
   def self.load
      page = Wikipedia.find('List of lists of lists')
      raw = page.content
      var = raw.scan(/\[(.*?)\]/)
      output = var.join(",").gsub!(/\[/, '').split(",")
      output.each do |list|
         ListOfList.create!(title: list)
      end
   end
   
end