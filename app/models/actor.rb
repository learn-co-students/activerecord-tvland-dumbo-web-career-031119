class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    return "#{first_name} #{last_name}"
  end

  def list_roles
    list = self.characters.collect{|character|
      "#{character.name} - #{shows.find(character.show_id).name}"
    }
  end
    
end