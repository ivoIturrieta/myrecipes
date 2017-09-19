class AddChefToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :chef_id, :integer
  end
end
