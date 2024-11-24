class Project < ApplicationRecord
  has_many :user_projects, dependent: :destroy
  has_many :users, through: :user_projects
  has_many :lanes, dependent: :destroy

  after_create :initialize_lanes

  private

  def initialize_lanes
    %w[To-Do Doing Done].each do |lane_name|
      lanes.create(name: lane_name)
    end
  end
end
