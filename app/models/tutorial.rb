class Tutorial < ApplicationRecord
    belongs_to :parent, class_name: "Tutorial", optional: true
    has_many :subtutorials, class_name: "Tutorial", foreign_key: :parent_id, dependent: :destroy
end
