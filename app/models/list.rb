class List < ActiveRecord::Base
    has_many :entries
    belongs_to :listoflist
    scope :random, -> {offset(rand(List.count)).first}
    scope :search, -> (search) {where("lower(title) like ?", "%#{search.downcase}%").uniq}

    def self.wiki(title)
      Wikipedia.find(title)
    end

    def self.load
      List.destroy_all
      ListOfList.all.each do |list|
         if List.wiki(list.title).content == nil
            list.delete
         else
            output = List.wiki(list.title).content.scan(/\[\[(.*?)\]\]/).flatten
            output.each do |title|
               List.create(title: title, listoflist_id: list.id) if title.length < 40
            end
         end
      end
    end

    def self.scrub
      List.all.each do |list|
         if List.wiki(list.title).content == nil
            list.delete
         end
      end
   end
end
