require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class AddReferencesToStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.references :teacher
    end
  end
end
