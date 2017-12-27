# frozen_string_literal: true

class Item < ApplicationRecord
  has_and_belongs_to_many :corporations

  mount_uploader :avatar, AvatarUploader
end
