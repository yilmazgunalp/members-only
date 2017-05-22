class User < ApplicationRecord
before_create :remember
has_secure_password





def remember
token = SecureRandom.urlsafe_base64
update_attribute(:remember_token, Digest::SHA1.hexdigest(token.to_s))
end	

end
