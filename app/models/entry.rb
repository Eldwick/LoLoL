class Entry < ActiveRecord::Base
    belongs_to :list

    def self.wiki(title)
      Wikipedia.find(title)
    end

    def self.load
      Entry.destroy_all
      List.all.each do |list|
          if Entry.wiki(list.title).content == nil
            puts 'nil'
            list.delete
          else
            output = Entry.wiki(list.title).content.scan(/\'\'\[\[(.*?)\]\]\'\'/).flatten
            if output.length > 50
               puts 'too long'
               list.delete
            elsif output.length < 1
               puts 'no entries'
               list.delete
            else
                output.each do |entry|
                  Entry.create(text: entry, list_id: list.id) if entry.length < 40
                end
            end
          end
      end
    end

end
