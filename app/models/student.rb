require_relative '../../db/config'

# implement your Student model here
class Student < ActiveRecord::Base 
  validates :email, :uniqueness=> true, :format => { :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/}  
  validates :age, :numericality => {:greater_than => 5}
  validates :raw_phone, :length => { :minimum => 10 }

  def name
    first_name + " " + last_name
  end

  def age
    now = Date.today
    now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

  def raw_phone
    phone.gsub(/\D/, '')
  end


end