class Message < ActiveRecord::Base
  scope :recent_five, -> { order("updated_at DESC").limit(5) }
end
