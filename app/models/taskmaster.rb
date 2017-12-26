# frozen_string_literal: true

class Taskmaster < ApplicationRecord
  validates :work_rating, inclusion: 1..10, allow_nil: true
  
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :employees, dependent: :destroy

  belongs_to :workshop

  mount_uploader :avatar, AvatarUploader
end
