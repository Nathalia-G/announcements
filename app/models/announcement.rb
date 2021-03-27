class Announcement < ApplicationRecord
      belongs_to :user
      default_scope -> { order(created_at: :desc) }
      validates :content, length: { maximum: 140 }, presence: true
end
