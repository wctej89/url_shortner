class Url < ActiveRecord::Base
  belongs_to :user
  
	after_create :generate_key
	validates :url, :format => {:with => /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/, :message => "Invalid URL" }

	def generate_key
	  combo=(0..9).to_a + ('A'..'Z').to_a + ('a'..'z').to_a
	  self.url_short = combo.sample(6).join
	  self.save
	end
  # Remember to create a migration!
end
