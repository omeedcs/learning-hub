class TutorialsController < ApplicationController

  def index
    @tutorials = Tutorial.where(parent_id: nil)
  end
end