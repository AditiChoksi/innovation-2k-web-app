class AddEmailToEnrollments < ActiveRecord::Migration
  def change
    add_column :enrollments, :email, :string
  end
end
