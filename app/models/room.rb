class Room < ApplicationRecord
  extend FriendlyId

  belongs_to :user
  has_many :reviews, dependent: :destroy
  # has_many :reviewed_rooms, through: :reviews, source: :room

  scope :most_recent, -> { order('created_at DESC') }

  validates_presence_of :title
  validates_presence_of :slug

  mount_uploader :picture, PictureUploader
  friendly_id :title, use: [:slugged, :history]

  validates_presence_of :title, :location
  validates_length_of :description, minimum: 10, allow_blank: false
  belongs_to :user


  def self.search(query)
    if query.present?
      where (['location ILIKE :query OR title ILIKE :query
                OR description ILIKE :query', query: "%#{query}%"])
    else
      where(nil)
    end
  end

  def complete_name
    "#{title}, #{location}"
  end

end
