class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction ) }
  validates :title, exclusion: { in: %w("Guess" "Won't Believe") }
  
  validate :clickbaity_title

  private

  def clickbaity_title
    if title.present? && expiration_date < Date.today
      errors.add(:not_clickbaity, "title not clickbait-y")
    end
  end
  

end
