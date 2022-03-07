class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :email, presence: true

  def is_number?
    if self =~ /^\d+$/
      true
    else
      false
    end
  end
end
