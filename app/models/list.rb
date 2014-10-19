class List < ActiveRecord::Base
  validates :title, uniqueness: true
  has_many :entries, primary_key: :p_id
  belongs_to :listoflist
  scope :random, -> {offset(rand(List.count)).first}
  scope :search, -> (search) {where("lower(title) like ?", "%#{search.downcase}%").uniq}

  def self.nuke(text)
    List.all.each do |list|
      if list.title.downcase.include? "#{text}"
        list.delete
      end
    end
  end

end
