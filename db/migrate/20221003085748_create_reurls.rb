class CreateReurls < ActiveRecord::Migration[6.1]
  def change
    create_table :reurls do |t|
      t.text :originUrl
      t.string :token

      t.timestamps
    end
  end
end
