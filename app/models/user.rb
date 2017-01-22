class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :stays
  validates :name, presence: true
  validates_format_of :email, with: /\@adventuresci\.org/, message: 'must be an adventuresci.org address.'

end