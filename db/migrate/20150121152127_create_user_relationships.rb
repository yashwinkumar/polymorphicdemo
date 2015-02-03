class CreateUserRelationships < ActiveRecord::Migration
  def change
    create_table :user_relationships do |t|
      t.string :relationable_type
      t.integer :relationable_id
      t.string :type
      t.integer :association_id

      t.timestamps null: false
    end
  end
end


