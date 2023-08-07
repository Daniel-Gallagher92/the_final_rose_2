class AddDescriptionToBachelorettes < ActiveRecord::Migration[7.0]
  def change
    add_column :bachelorettes, :description, :string
  end
end
