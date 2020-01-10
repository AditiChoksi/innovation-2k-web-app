class AddCoCoordinatorToEvents < ActiveRecord::Migration
  def change
    add_column :events, :co_coordinator, :string
  end
end
