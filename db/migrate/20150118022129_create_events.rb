class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :dept
      t.string :coordinator
      t.integer :contact
      t.string :email

      t.timestamps
    end
  end
end
