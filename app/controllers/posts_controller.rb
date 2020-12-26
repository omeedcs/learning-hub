class PostsController < ApplicationController
    before_action :authenticate_student!, except: [:index, :show]
    before_action :set_post, only: [:show]

    def index 
        @posts = Post.all
    end

    def show
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
        @post = Post.find(params[:id])
    end

    # values we are going to allow to be passed from the browser.
    def post_values 
        params.require(:post).permit(:title, :body)
    end 
end 