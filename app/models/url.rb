class Url < ActiveRecord::Base
	after_create :generate_key
	
	def generate_key
	  combo=(0..9).to_a + ('A'..'Z').to_a + ('a'..'z').to_a
	  self.url_short = combo.sample(6).join
	  self.save
	end
  # Remember to create a migration!
end
