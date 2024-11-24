class Task < ApplicationRecord
  belongs_to :user
  belongs_to :lane

  enum status: {
    todo: "待處理",
    doing: "進行中",
    done: "已完成",
  }
end
