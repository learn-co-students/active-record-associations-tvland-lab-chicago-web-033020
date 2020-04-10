class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    fname = "#{self.first_name} #{self.last_name}" 
  end

  def list_roles  
    roles = self.characters.map {|cha| "#{cha.name} - "}
    self.shows.each_with_index do |val, index|
      roles[index] = "#{roles[index]}#{val.name}"
    end
    roles
  end
end