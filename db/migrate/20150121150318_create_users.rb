class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name

      t.timestamps null: false
    end
    (1..50).to_a.each {|u| User.create(name: "user#{u}")}
  end
end

