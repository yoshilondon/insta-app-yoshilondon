# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  avatar                 :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  profile                :text
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :profile, dependent: :destroy

  def display_name
    self.name
  end

  def prepare_profile
    profile || build_profile
    # profileに値があれば使って、無ければbuildを使う
  end


  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'myavatar.png'
    end
  end

  validates :name, presence: true, uniqueness: true
  validates :profile, length: { maximum: 200 }
end
