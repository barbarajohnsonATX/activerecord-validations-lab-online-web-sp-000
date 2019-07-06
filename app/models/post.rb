class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction ) }
  validates :title, exclusion: { in: %w("Guess" "Won't Believe") }
  
  validate :clickbaity_title

  private

  def clickbaity_title
    if file_name.present? && !%w{.jpg .png .jpeg .tif}.include?(File.extname(file_name.downcase))
      errors.add(:file_name, :invalid_extension)
    end
  end
  

end
