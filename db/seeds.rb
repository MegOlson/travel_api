class Seed
  def self.begin
    seed = Seed.new
    seed.generate_content
  end

  def generate_content
    Destination.destroy_all
    Review.destroy_all
    
    20.times do |i|
      destination = Destination.create!(
        city: Faker::Address.city,
        country: Faker::Address.country
      )

      5.times do |s|
        review = destination.reviews.create!(
          author: Faker::Name.name,
          content: Faker::Lorem.sentence(3),
          rating: Faker::Number.between(1, 5)
        )
        puts "Review #{s}: Author is #{review.author}, content is #{review.content}, and rating is #{review.rating}."
      end

      puts "Destination #{i}: City is #{destination.city} and country is #{destination.country}."
    end
  end
end

Seed.begin
