class CreateAnnouncements < ActiveRecord::Migration[6.1]
  def change
    create_table :announcements do |t|
      t.text :content
      t.integer :user_id
      t.timestamp :date

      t.timestamps
    end
  end
end
