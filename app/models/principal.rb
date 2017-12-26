# frozen_string_literal: true

class Principal < ApplicationRecord
  extend Enumerize

  validates :work_rating, inclusion: 1..10

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  enumerize :sex, in: %i[male female]

  belongs_to :factory

  mount_uploader :avatar, AvatarUploader
end
