# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  def fullname
    firstname = User.where({:id => self.id}).at(0).first_name
    lastname = User.where({:id => self.id}).at(0).last_name
    return firstname.capitalize + " " + lastname.capitalize
  end
end
