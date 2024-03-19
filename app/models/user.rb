class User < ApplicationRecord
    validates :username, presence: true, length: { minimum: 3, maximum: 25 }
    validate :validate_username
    
    validates :email, presence: true, uniqueness: true, format: { 
        with: URI::MailTo::EMAIL_REGEXP 
    }
    validates :location, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true

    private
    def validate_username
        unless username =~ /\A[a-zA-Z0-9_]+\Z/
            errors.add(:username, "can only contain letters, numbers, and underscores, and must include at least one letter or number")
        end
    end
   
    #associations
   has_many :do_quizzes
   has_many :quizzes, through: :do_quiz
end
