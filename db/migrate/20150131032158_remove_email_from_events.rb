class RemoveEmailFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :email, :string
  end
end
