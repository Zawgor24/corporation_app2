# frozen_string_literal: true

class Corporation < ApplicationRecord
  has_many :factories, dependent: :destroy

  has_and_belongs_to_many :items

  mount_uploader :avatar, AvatarUploader
end
