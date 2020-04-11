class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

    def full_name 
        "#{self.first_name} #{self.last_name}"
    end 

    def list_roles 
        role_show = self.characters.map do |role|
            id = role.show_id
            "#{role.name} - #{Show.find(id).name}"
        end 

        role_show 
    end 
end