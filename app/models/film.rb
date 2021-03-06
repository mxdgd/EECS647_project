class Film < ApplicationRecord
   has_many :cast_members, dependent: :destroy
   has_many :awards, dependent: :destroy
   validates :title, presence: true
   validates :vimeo_link, presence: true
   validates :description, presence: true
   validates :release_date, presence: true
   accepts_nested_attributes_for :awards, reject_if: :all_blank, allow_destroy: true
   accepts_nested_attributes_for :cast_members, reject_if: :all_blank, allow_destroy: true
end
