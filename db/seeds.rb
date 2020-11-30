# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(
    email: "manager@demo.com",
    password: "manager@demo.com"
)

yes_or_no = ["Yes", "No"]
random_number = Random.new.rand(1..100)
random_price = Random.new.rand(1000..20000)

house_description = {
    air_conditioned: yes_or_no.sample,
    rooms: random_number,
    floors: random_number
}

complex_description = {
    units: random_number
}

commercial_description = {
    parking: random_number,
    shops: random_number
}

subtypes = {house: "house", complex: "complex", commercial: "commercial"}

20.times do |x|
    
    subtype = subtypes.values.sample
    case subtype
    when "house"
        description = house_description
        path = 'app/assets/images/house.jpg'
        filename ='house.jpg'
    when "complex"
        description = complex_description
        path = 'app/assets/images/complex.jpg'
        filename ='complex.jpg'
    when "commercial"
        description = commercial_description
        path = 'app/assets/images/commercial.jpeg'
        filename ='commercial.jpeg'
    end

    building = Building.create(
        owner: Faker::Name.name,
        address: Faker::Address.street_address,
        sqmt: random_number,
        price: random_price,
        subtype: subtype,
        description: description
    )

    building.building_image.attach(io: File.open(Rails.root.join(path)), filename: filename)

end