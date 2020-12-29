class AddEngagementToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :engagement, :integer, default: 0
  end
end
