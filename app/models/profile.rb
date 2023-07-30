class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  scope :discipline, -> (discipline) {where(discipline: discipline)}
  scope :work_experience, -> (work_experience) {where(work_experience: work_experience)}
  scope :city, -> (city) {where("lower(city) = ?", city.downcase)}


  validates_uniqueness_of :user_id

  geocoded_by :city
  after_validation :geocode

  TECH_STACK_OPTIONS = %i[
    Ruby
    Rails
    ViewComponent
    PostgreSQL
    SQLite
    MySQL
    Redis
    Tailwind
    Bootstrap
    FactoryBot
    RSpec
    Minitest
    CSS
    Stimulus
    Turbo
    Heroku
    Hatchbox.io
    React
  ]
end
