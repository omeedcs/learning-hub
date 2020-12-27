class SubscriptionsController < ApplicationController

    def create
        @subscription = Subscription.new(subscription_params)
        @subscription.student_id = current_student.id
        @subscription.save
        redirect_to community_path(@subscription.community_id)
    end 

    # allows us to keep track of subscriptions -Omeed
    def subscription_params
        params.require(:subscription).permit(:community_id)
    end
end