class VotesController < ApplicationController
    def create
        post_id = params[:post_id]
        vote = Vote.new
        vote.post_id = params[:post_id]
        vote.upvote = params[:upvote]
        vote.student_id = current_student.id
    
    # we are checking if vote by this current user exists on the post. 
    existing_vote = Vote.where(student_id: current_student.id, post_id: post_id)
    @new_vote = existing_vote.size < 1
    
    respond_to do |format|
        format.js {
    if existing_vote.size > 0
        # we want to remove existing vote
        existing_vote.first.destroy
    else 
        # we want to save the new vote
    if vote.save
        @success = true
    else 
        @success = false
        end
    end 
        @post = Post.find(post_id)
         @is_upvote = params[:upvote]
        render "votes/create"
    }
    end
end

private 
    def vote_params
        params.require(:vote).permit(:upvote, :post_id)
    end 
end