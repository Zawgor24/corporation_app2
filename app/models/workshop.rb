# frozen_string_literal: true

class Workshop < ApplicationRecord
  has_many :taskmasters, dependent: :destroy

  has_one :manager, dependent: :destroy

  belongs_to :factory
end
