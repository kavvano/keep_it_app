class KeepItUp < ApplicationRecord
  with_options presence: true do
    validates :user, :tweet
  end
end
