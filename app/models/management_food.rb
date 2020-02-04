class ManagementFood < ApplicationRecord
  belongs_to :management
  belongs_to :food
end
