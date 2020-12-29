class CommunitiesController < ApplicationController
    before_action :authenticate_student!, except: [:index, :show]
    before_action :set_community, only: [:show]

    def index 
        @communities = Community.all
    end

    def show
    @posts = @community.posts.limit(20).sort_by{ |p| p.score }.reverse
    @subscriber_count = @community.subscribers.count
    @is_subscribed = student_signed_in? ? Subscription.where(community_id: @community.id, student_id: current_student.id).any? : false
    @subscription = Subscription.new
    end 

    def new
        @community = Community.new
    end

    def create
        @community = Community.new community_values
        @community.student_id = current_student.id

        if @community.save
            redirect_to communities_path
        else 
            render :new 
        end
    end

    private 

    def set_community
        @community = Community.find(params[:id])
    end

    # values we are going to allow to be passed from the browser.
    def community_values 
        params.require(:community).permit(:name, :url, :summary, :rules)
    end 
end 