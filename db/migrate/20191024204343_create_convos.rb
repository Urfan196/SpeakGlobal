class CreateConvos < ActiveRecord::Migration[6.0]
  def change
    create_table :convos do |t|
      t.text :message
      t.integer :lesson_id

      t.timestamps
    end
  end
end
