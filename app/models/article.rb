class Article < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: { message: "ユーザを入力してください" }
end
