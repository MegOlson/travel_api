class Seed
  def self.begin
    seed = Seed.new
    seed.generate_destinations
  end

  def generate_destinations
    20.times do |i|
      city =
      destination = Destination.create!(
        city: Faker::Address.city,
        country: Faker::Address.country
      )
      puts "Destination #{i}: City is #{destination.city} and country is #{destination.country}."
    end
  end
end

Seed.begin
