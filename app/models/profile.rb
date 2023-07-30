class Profile < ApplicationRecord
  belongs_to :user
  has_many :questions
  has_one_attached :avatar


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
