# frozen_string_literal: true

class Item < ApplicationRecord
  has_and_belongs_to_many :corporations, class_name: 'Corporation',
                                         join_table: 'corporations_items'

  mount_uploader :avatar, AvatarUploader
end
