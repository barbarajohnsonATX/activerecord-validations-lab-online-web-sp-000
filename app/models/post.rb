class ClickbaityValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # pattern matcher =~ operator
    # /\d/ - A digit character ([0-9])
    unless value =~ /(Won't Believe|Secret|Top \d|Guess)/
      record.errors[attribute] << ("Not a clickbait title")
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true, clickbaity: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction ) }

end



