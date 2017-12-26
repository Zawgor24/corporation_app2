# frozen_string_literal: true

class Factory < ApplicationRecord
  belongs_to :corporation

  has_many :details, dependent: :destroy
  has_many :workshops, dependent: :destroy

  has_one  :principal, dependent: :destroy

  mount_uploader :avatar, AvatarUploader
end
