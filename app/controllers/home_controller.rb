class HomeController < ApplicationController
  # home page
  def index
    @communities = Community.all.limit(5)
    @posts = Post.order(id: :desc).limit(20)
  end

  # about page
  def about
  end

  # tutorials page
  # def tutorials
  #   @tutorials = Tutorial.where(parent_id: nil)
  # end

  #contact page
  def contact
  end

  def interactive
  end

  def welcome
  end

  def privacy
  end

  def queue
  end

  def profile 
    @profile = Student.find_by_username params[:username]
    @posts = @profile.posts
  end 

end
