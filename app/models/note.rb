class Note < ApplicationRecord
  validates :content, presence: true, length: {maximum: 100 }
end
