class Answer < ActiveRecord::Base
  validates :body, presence: true, length: {minimum: 50}
  validates :question_id, presence: true

  belongs_to :question
  belongs_to :answer

  def body_html
    MarkdownRenderer.render(self.body)
  end

end
