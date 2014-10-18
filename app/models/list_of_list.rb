class ListOfList < ActiveRecord::Base

   def load
      page = Wikipedia.find('List of lists of lists')
      page = Wikipedia.find('List of lists of lists')
      raw = page.content
      var = raw.scan(/\[(.*?)\]/)
      output = var.join(",").gsub!(/\[/, '').split(",")
      output.each do |list|
         ListOfList.create!(name: list)
      end
   end
end
