class Article < ApplicationRecord
    belongs_to :student, optional: true
    belongs_to :category, optional: true
end
