# frozen_string_literal: true

class Employee < ApplicationRecord
  validates :work_rating, inclusion: 1..10, allow_nil: true

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  belongs_to :taskmaster

  mount_uploader :avatar, AvatarUploader

  before_create :validate_count_of_employees

  def validate_count_of_employees
    if taskmaster.employees.count >= 10
      taskmaster.errors.add(:taskmaster, "can't has more then 10 employees")
      taskmaster.errors[:taskmaster]
    end
  end
end
