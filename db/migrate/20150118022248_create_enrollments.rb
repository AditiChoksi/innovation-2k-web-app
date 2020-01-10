class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :receipt_no
      t.string :name
      t.string :college
      t.integer :contact_no
      t.text :team
      t.string :year
      t.string :dept
      t.integer :amt_paid
      t.string :event_name
      t.integer :volunteer_id

      t.timestamps
    end
  end
end
