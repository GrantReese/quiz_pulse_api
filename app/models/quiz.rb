class Quiz < ApplicationRecord
    # validates :title, presence: true, uniqueness: true
    validates :category, presence: true
    validates :description, presence: true
    # validates :created_date, presence: true
    validates :total_score_possible, presence: true, numericality: { 
        less_than_or_equal_to: 100,  only_integer: true }

    # validates :created_by, presence: true
    
    
    #associations
    has_many :users
    has_many :questions
    has_many :do_quiz
    # has_one :category
    # Having issues when I have the relationships between category and quiz



end
