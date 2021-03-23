class About < ApplicationRecord
  has_one_attached :photo
  has_one_attached :resume
end