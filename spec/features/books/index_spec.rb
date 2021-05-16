require 'rails_helper'
RSpec.describe 'Books Index Page' do
  before :each do
    @author_1 = Author.create!(name: 'Bethesda', year_founded: 1969, still_active: true, city: 'Bethesda', number_of_staff: 420)
    @author_2 = Author.create!(name: 'Capcom', year_founded: 1972, still_active: true, city: 'Denver', number_of_staff: 1600)

    @author_1.books.create!(title: 'Narnia', series: true, page_count: 237)
    @author_1.books.create!(title: 'Prince Caspian', series: true, page_count: 237)
    @author_2.books.create!(title: 'Shadow and Bone', series: true, page_count: 237)
    @author_2.books.create!(title: 'Siege and Storm', series: true, page_count: 357)

    visit "/books"
  end

  it "shows child and its attributes" do
    within("#book-#{@book_1.id}") do
      expect(page).to have_content(@book_1.title)
      expect(page).to have_content(@book_1.series)
      expect(page).to have_content(@book_1.page_count)
    end

    within("#book-#{@book_2.id}") do
      expect(page).to have_content(@book_2.title)
      expect(page).to have_content(@book_2.series)
      expect(page).to have_content(@book_2.page_count)
    end

    within("#book-#{@book_3.id}") do
      expect(page).to have_content(@book_3.title)
      expect(page).to have_content(@book_3.series)
      expect(page).to have_content(@book_3.page_count)
    end

    within("#book-#{@book_4.id}") do
      expect(page).to have_content(@book_4.title)
      expect(page).to have_content(@book_4.series)
      expect(page).to have_content(@book_4.page_count)
    end
  end
end