class ChangeBodyToText < ActiveRecord::Migration
  def change
    remove_column :messages, :body
    add_column :messages, :body, :text
  end
end
