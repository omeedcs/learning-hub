class PostsController < ApplicationController
    before_action :authenticate_student!, except: [:index, :show]
    before_action :set_post, only: [:show]
    before_action :auth_subscriber, only: [:new]

    def index 
        @posts = Post.all
    end

    def show
        @comment = Comment.new
    end 

    def new
        @community = Community.find(params[:community_id])
        @post = Post.new
    end

    def create
        @post = Post.new post_values
        @post.student_id = current_student.id
        @post.community_id = params[:community_id]

        if @post.save
            redirect_to community_path(@post.community_id)
        else 
            @community = Community.find(params[:community_id])
            render :new
        end
    end

    private 

    def set_post
        @post = Post.includes(:comments).find(params[:id])
    end

    # we are checking if the user is a subscriber to this specific thread before they contribute.
    # good for flow management, and will help us keep track of student engagement to see what topics we need to focus on moving forward.
    def auth_subscriber
        unless Subscription.where(community_id: params[:community_id], student_id: current_student.id).any?
            redirect_to root_path, flash: {danger: "You are not authorized to view this page."}
        end
    end 

    # values we are going to allow to be passed from the browser.
    def post_values 
        params.require(:post).permit(:title, :body)
    end 
end 