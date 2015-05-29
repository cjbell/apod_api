class Post < ActiveRecord::Base
  scope :on_day,
    ->(date){ published_between(date.beginning_of_day, date.end_of_day) }
  scope :in_month,
    ->(date){ published_between(date.beginning_of_month, date.end_of_month) }
  scope :in_year,
    ->(date){ published_between(date.beginning_of_year, date.end_of_year) }
  scope :published_between,
    ->(start_date, end_date){ where(published_at: start_date..end_date) }

  scope :posted, ->{ order('published_at ASC') }
  scope :latest, ->{ order('published_at DESC') }
  scope :images, -> { where(video_embed_url: nil) }
end