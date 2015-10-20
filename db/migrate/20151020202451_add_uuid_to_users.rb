class AddUuidToUsers < ActiveRecord::Migration
  def change
      change_table :users do |t|
          t.string :uuid, limit: 36, default: '', null: false
      end
      add_index :users, :uuid, unique: true
  end
end
