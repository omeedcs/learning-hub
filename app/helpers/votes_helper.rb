module VotesHelper

    def is_upvoted post
         student_signed_in? && current_student.upvoted_post_ids.include?(post.id) ? " active" : "" 
    end

    def is_downvoted post
        student_signed_in? && current_student.downvoted_post_ids.include?(post.id) ? " active" : "" 
    end
    
end