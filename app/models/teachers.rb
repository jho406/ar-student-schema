require_relative '../../db/config'

# implement your Student model here
class Teacher < ActiveRecord::Base 
  validates :email, :uniqueness=> true, :format => { :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/}  
  validates :raw_phone, :length => { :minimum => 10 }

  def name
    first_name + " " + last_name
  end

  def raw_phone
    phone.gsub(/\D/, '')
  end

end

# class Customer < ActiveRecord::Base
#   has_many :orders, :dependent => :destroy
# end
 
# class Order < ActiveRecord::Base
#   belongs_to :customer
# end