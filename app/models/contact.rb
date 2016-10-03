class Contact < ApplicationRecord
  validates :name, :email, :message, presence: true
  validates :name, length: { in: 2..255 }
  validates :email, email: true
  validates :message, length: { in: 2..1024 }
end
