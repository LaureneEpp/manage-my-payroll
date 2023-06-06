class Employee < ApplicationRecord
  belongs_to :team
  has_many :payslips

  has_one :departement, through: :team
  belongs_to :position

  has_one_attached :avatar
  after_commit :add_default_avatar, on: %i[create update]

  def fullname
    "#{first_name} #{last_name}"
  end

  def avatar_thumbnail
    avatar.variant(resize_to_limit: [300,300]).processed
  end

  private

  def add_default_avatar
    return if self.avatar.attached?
    avatar.attach(
      io:
        File.open(Rails.root.join("app", "assets", "images", "anonymous.jpg")),
      filename: "anonymous.jpg",
      content_type: "image/jpg",
    )
  end
end
