# frozen_string_literal: true

# Create country codes
require 'csv'

path = 'db/country_code.csv'

CSV.foreach(path) do |row|
  unless row[0].eql?('COUNTRY')
    CountryCode.create!(
      country: row[0],
      dialingcode: row[4]
    )
  end
end

# CREATE PLANS
Plan.create!(duration_in_months: 12, name: 'Free', price: 0.0)
Plan.create!(duration_in_months: 1, name: 'Monthly', price: 19.9)
Plan.create!(duration_in_months: 6, name: 'Semi-Anually', price: 15.9)
Plan.create!(duration_in_months: 12, name: 'Anually', price: 12.9)

def random_birthdate(start_date, end_date)
  range_in_days = (end_date - start_date).to_i
  random_days = rand(range_in_days + 1)
  start_date + random_days
end

BATCH_SIZE = 1000

(0...100_000).each_slice(BATCH_SIZE) do |batch|
  users = []

  batch.each do |t|
    users << {
      bio: "Biography user #{t}",
      birthdate: random_birthdate(Date.new(1990, 1, 1), Date.new(2000, 12, 31)),
      confirmation_code: SecureRandom.alphanumeric(4),
      confirmed_at: Date.today,
      email: "user_#{t}@email.com",
      password_digest: "password123" ,
      gender: %w[male female].sample,
      username: "#{t}_Username",
      phone_number: '8599990123',
      created_at: DateTime.now,
      updated_at: DateTime.now
    }
  end

  User.transaction do
    User.insert_all(users)
  end

  puts DateTime.now
end