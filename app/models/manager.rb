# frozen_string_literal: true

class Manager < ApplicationRecord
  validates :work_rating, inclusion: 1..10, allow_nil: true

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  belongs_to :workshop

  mount_uploader :avatar, AvatarUploader
end
