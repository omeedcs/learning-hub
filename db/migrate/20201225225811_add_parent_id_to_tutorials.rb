class AddParentIdToTutorials < ActiveRecord::Migration[6.1]
  def change
    add_column :tutorials, :parent_id, :boolean, default: false
  end
end
