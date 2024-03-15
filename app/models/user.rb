class User < ApplicationRecord
    validates :username, presence: true, length: { minimum: 5, maximum: 20 }
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :location, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
end
