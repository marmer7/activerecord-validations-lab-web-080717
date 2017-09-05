class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :title_must_be_click_bait


  def title_must_be_click_bait
    ["Won't Believe", "Secret", "Top", "Guess"].each do |t|
      if self.title && self.title.include?(t)
        return true
      end
    end
    errors.add(:title, "must be click bait!")
  end

end
