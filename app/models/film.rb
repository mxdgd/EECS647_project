class Film < ApplicationRecord
   has_many :cast_members
   has_many :awards
end
