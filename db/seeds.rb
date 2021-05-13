Developer.destroy_all
Game.destroy_all

Author.destroy_all

@developer_1 = Developer.create!(name: 'Bethesda', year_founded: 1986, still_active: true, city: 'Bethesda', number_of_staff: 420)
@developer_2 = Developer.create!(name: 'Capcom', year_founded: 1979, still_active: true, city: 'Chuo Ward, Osaka', number_of_staff: 2832)
@developer_3 = Developer.create!(name: 'Konami', year_founded: 1969, still_active: true, city: 'Tokyo', number_of_staff: 9499)

@game_1 = @developer_1.games.create!(name: 'Skyrim', year_released: 2010, consoles: 'PS4', physical_release: true, esrb_rating: 'M')
@game_2 = @developer_2.games.create!(name: 'Resident Evil 7', year_released: 2017, consoles: 'PS4', physical_release: true, esrb_rating: 'M')
@game_3 = @developer_1.games.create!(name: 'Fallout 4', year_released: 2015, consoles: 'PS4', physical_release: true, esrb_rating: 'M')
@game_4 = @developer_2.games.create!(name: 'Super Puzzle Fighter II Turbo', year_released: 1996, consoles: 'Playstation', physical_release: true, esrb_rating: 'E')
@game_5 = @developer_3.games.create!(name: 'Metal Gear Solid', year_released: 1998, consoles: 'Playstation', physical_release: true, esrb_rating: 'M')
@game_6 = @developer_3.games.create!(name: 'Metal Gear Solid 3: Snake Eater', year_released: 2004, consoles: 'Playstation 2', physical_release: true, esrb_rating: 'M')

@author_1 = Author.create!(name: 'C.S. Lewis', alive: false, age: 64)
@author_2 = Author.create!(name: 'Leigh Bardugo', alive: true, age: 46)

@author_1.books.create!(title: 'Narnia', series: true, page_count: 237)
@author_1.books.create!(title: 'Prince Caspian', series: true, page_count: 237)

@author_2.books.create!(title: 'Shadow and Bone', series: true, page_count: 237)
@author_2.books.create!(title: 'Siege and Storm', series: true, page_count: 357)
