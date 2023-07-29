class Profile < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :user_id

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
