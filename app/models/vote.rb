class Vote < ApplicationRecord 
    belongs_to :student
    belongs_to :post

    validates_uniqueness_of :student_id, scope: :post_id

    after_create :increment_vote, :add_engagement
    after_destroy :decrement_vote

    private 

    def increment_vote
        field = self.upvote ? :upvotes : :downvotes
        Post.find(self.post_id).increment(field).save
    end

    def decrement_vote
        field = self.upvote ? :upvotes : :downvotes
        Post.find(self.post_id).increment(field).save
    end

    def add_engagement
        student = Student.find(self.student_id)
        student.increment(:engagement, 1).save
    end

    def remove_engagement
        student = Student.find(self.student_id)
        student.decrement(:engagement, 1).save
    end
end