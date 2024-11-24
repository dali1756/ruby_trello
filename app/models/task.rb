class Task < ApplicationRecord
  belongs_to :user
  belongs_to :lane

  enum status: {
    pending: "待處理",
    in_progress: "進行中",
    completed: "已完成",
  }
end
