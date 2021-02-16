class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  validates :body, length: { minimum: 1, maximum: 280 }
  validates :publish_at, presence: true
  
  after_initialize do 
    # publish a hour from now
    #self.publish_at ||= 1.hour.from_now
    self.publish_at ||= 24.hours.from_now  
  end
  
  def published?
    tweet_id?
  end
end
