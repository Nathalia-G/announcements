class Announcement < ApplicationRecord
      belongs_to :user
      has_many :views
      default_scope -> { order(created_at: :desc) }
      validates :content, length: { maximum: 140 }, presence: true

      attr_accessor :remember_view

 

end
