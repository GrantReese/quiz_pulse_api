class Quiz < ApplicationRecord
    :tite, presence: true
    :category, presence: true
    :description, presence: true
    :created_date, presence: true
    :total_score_possible, presence: true
    :created_by, presence: true

end
