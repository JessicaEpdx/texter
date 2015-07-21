class CreateNumbers < ActiveRecord::Migration
  def change
    create_table :numbers do |t|
      t.string :phone
      t.integer :message_id
    end
  end
end
