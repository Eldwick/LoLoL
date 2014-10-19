class List < ActiveRecord::Base
  validates :title, uniqueness: true
  has_many :entries, primary_key: :p_id
  belongs_to :listoflist
  scope :random, -> {offset(rand(List.count)).first}
  scope :search, -> (search) {where("lower(title) like ?", "%#{search.downcase}%").uniq}

  def self.nuke(text)
    List.all.each do |list|
      if list.title.include? "#{text}"
        list.delete
      end
    end
  end

    def self.dedupe
    # find all models and group them on keys which should be common
    grouped = all.group_by{|model| [model.name,model.year,model.trim,model.make_id] }
    grouped.values.each do |duplicates|
      # the first one we want to keep right?
      first_one = duplicates.shift # or pop for last one
      # if there are any more left, they are duplicates
      # so delete all of them
      duplicates.each{|double| double.destroy} # duplicates can now be destroyed
    end
  end


end
