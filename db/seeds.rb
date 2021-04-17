# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

case Rails.env
when "development"
  user = User.new(email: "test@test.com")
  user.password = "password"
  user.save!
  Contact.create(user_id: user.id, email: user.email)
  about = About.create!(user_id: user.id, bio: Faker::Lorem.paragraph_by_chars(number: rand(300..450), supplemental: false))
  about.photo.attach(io: URI.open(Faker::Avatar.image), filename: "image.png")
  about.resume.attach(io: URI.open("https://writing.colostate.edu/guides/documents/resume/functionalSample.pdf"), filename: "resume.pdf")

  rand(15..25).times do 
    film = Film.create!(user_id: user.id, 
      title: Faker::Hipster.sentence, 
      vimeo_link: "https://vimeo.com/#{rand(10000..524159197)}",
      description: Faker::Hipster.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4),
      release_date: Faker::Date.between(from: '2014-01-01', to: '2021-01-01')
    )

    rand(1..15).times do
      CastMember.create(film_id: film.id,
        role: Faker::Job.position,
        name: Faker::Name.unique.name
      )
    end

    rand(0..15).times do
      Award.create(film_id: film.id,
        festival: "#{Faker::Company.buzzword} #{Faker::Company.industry}".titleize,
        place: rand(1..10).ordinalize
      )
    end
  end


when "production"
  User.create!(email: "liambice@gmail.com", password: "CasaBonita1")
  Contact.create(user_id: user.id, email: user.email)
  About.create(user_id: user.id)
end