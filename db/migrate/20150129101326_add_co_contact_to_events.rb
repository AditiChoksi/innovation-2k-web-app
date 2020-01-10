class AddCoContactToEvents < ActiveRecord::Migration
  def change
    add_column :events, :co_contact, :string
  end
end
