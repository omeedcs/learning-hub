class HpPost < ApplicationRecord 
    belongs_to :student 
    belongs_to :community
    validates_presence_of :title, :body, :account_id, :community_id
