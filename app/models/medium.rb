class Medium < ActiveRecord::Base

  validates :title, presence: true
  validates :type, presence: true

  def self.types
    %w(Movie Book Album)
  end

  scope :movies, -> {where(type: 'Movie')}
  scope :books, -> {where(type: 'Book')}
  scope :albums, -> {where(type: 'Album')}
end

class Movie < Medium; end
class Book < Medium; end
class Album < Medium; end
