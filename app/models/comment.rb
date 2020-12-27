class Comment < ApplicationRecord 
    belongs_to :post 
    belongs_to :student

    # checking to make sure if comment is valid
    validates_presence_of :message, :student_id, :post_id

end 
