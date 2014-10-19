class List < ActiveRecord::Base
  validates :title, uniqueness: true
  has_many :entries, primary_key: :p_id
  belongs_to :listoflist
  scope :random, -> {offset(rand(List.count)).first}
  scope :search, -> (search) {where("lower(title) like ?", "%#{search.downcase}%").uniq}

  def self.wiki(title)
    Wikipedia.find(title)
  end

  def self.load
    ListOfList.all.each do |list|
      output = List.wiki(list.title).content.scan(/\[\[(.*?)\]\]/).flatten
      output.each do |title|
        List.create(title: title, listoflist_id: list.id, game: false) if title.length < 40
      end
    end
  end

  def self.list_of_scrub
    List.all.each do |list|
      unless list.title.downcase.include? "list of"
        list.delete
      else
        puts list.id
      end
    end
  end

  def self.valid_link_scrub
    List.all.each do |list|
      List.wiki(list.title).links == nil ? list.delete : puts(list.id)
    end
  end

  def self.nuke(text)
    List.all.each do |list|
      if list.title.downcase.include? "#{text}"
        list.delete
      end
    end
  end

end
