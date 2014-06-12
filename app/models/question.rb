class Question < ActiveRecord::Base

  validates :title, presence: true, length: {minimum: 40}
  validates :body, presence: true, length: {minimum: 150}
  # validates :user_id, presence: true

  belongs_to :user
  has_many :answers

  def body_html
    MarkdownRenderer.render(self.body)
  end

end
