# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(email: 'test@test.com', password: 'test')

adminUser = User.create(email: 'admin@admin.com', password: 'admin')
adminUser.add_role :admin


# Dog Breed Groups
DogBreedGroup.create(name: 'Sporting Group')
DogBreedGroup.create(name: 'Hound Group')
working_group = DogBreedGroup.create(name: 'Working Group')
DogBreedGroup.create(name: 'Terrier Group')
DogBreedGroup.create(name: 'Toy Group')
DogBreedGroup.create(name: 'Non-Sporting Group')
DogBreedGroup.create(name: 'Herding Group')
DogBreedGroup.create(name: 'Miscellaneous Group')
DogBreedGroup.create(name: 'Foundation Stock Group')

# Dog Breeds
DogBreed.create(name: 'Boxer', dog_breed_group: working_group)

# Data tables test
=begin
for i in 0..100
  DogBreed.create(name: "DataTable_Test #{i}", dog_breed_group: working_group)
end
=end

# Countries
usa_country = Country.create(name: "United States")
can_country = Country.create(name: "Canada")

#States
State.create(name: "Alabama", alpha2: "AL", country_id: usa_country.id)
State.create(name: "Ontario", alpha2: "ON", country_id: can_country.id)
