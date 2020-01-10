class AddRegFeesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :reg_fees, :integer
  end
end
