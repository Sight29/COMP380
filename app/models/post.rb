class Post < ApplicationRecord
        extend FriendlyId
      friendly_id :title, use: :slugged  
      belongs_to :author
      has_many :comments

    #give post in descending order based on the ids.
    scope :most_recent, -> { order(id: :desc) }
    #generates new freindly id when the title changes
    def should_generate_new_friendly_id?
    title_changed?
    end
    def display_published_day
        "Published Date #{created_at.strftime('%-b %-d, %Y')}"   #string interpolation
    end


end
