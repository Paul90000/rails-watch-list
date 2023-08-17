class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  before_destroy :ensure_no_bookmarks

  private

  def ensure_no_bookmarks
    return false if bookmarks.exists?
  end
end
