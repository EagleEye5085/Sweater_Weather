class User < ApplicationRecord

  validates :email, uniqueness: true, presence: true, email: true

  has_secure_password

  after_validation :get_api_key

  def get_api_key
    if self.api_key == nil
      self.update(api_key: SecureRandom.hex(25))
    end
  end

end
