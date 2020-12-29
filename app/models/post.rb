class Post < ApplicationRecord 
    belongs_to :student 
    belongs_to :community
    validates_presence_of :title, :body, :student_id, :community_id
    has_many :comments

    def score 
        # upvote minus downvotes in order to score this.
        if self.upvotes > 0 || self.downvotes > 0 
            self.upvotes > 0 ? (self.upvotes - self.downvotes) : (self.downvotes * -1)
        else 
            0
        end 
    end
end 
