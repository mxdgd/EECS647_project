require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  has_many :films
  has_one :about
  has_one :contact

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end