class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    access == 'A'
  end

  def resident?
    access == 'R'
  end

  def ghost?
    access == 'X'
  end
end
