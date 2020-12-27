class Post < ApplicationRecord 
    belongs_to :student 
    belongs_to :community
    validates_presence_of :title, :body, :student_id, :community_id
    has_many :comments
end 
