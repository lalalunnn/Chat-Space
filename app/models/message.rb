class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  # bodyカラムメッセージに対し、空送信後DBへ保存されないようにバリデーション
  validates :body, presence: true
end
