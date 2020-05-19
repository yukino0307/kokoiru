class Post < ApplicationRecord
  validates :title, length: { maximum: 20, allow_blank: true}, presence: true
  validates :explanation, length: { maximum: 500, allow_blank: true}, presence: true
  validates :rating, presence: true
  validates :status, presence: true

  belongs_to :user
  has_one :spot, dependent: :destroy
  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :spot
  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: :reject_image_blank

  def reject_image_blank(attributes)
    attributes['id'].blank? && attributes['image'].blank?
  end
end
