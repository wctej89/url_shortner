require 'digest/sha1'

class User < ActiveRecord::Base
  has_many :urls
  before_create :store_encrypted

  def store_encrypted()
    self.password_hash = encrypt(self.password_hash)
  end

  def encrypt(password)
    half = password.length/2
    salt = "ar2$1@@ss#}s"
    password_with_salt = password[0...half] + salt + password[half..-1]
    Digest::SHA1.hexdigest(password_with_salt)
  end

  def match_pass(given)
    (encrypt(given)) == self.password_hash
  end
end
