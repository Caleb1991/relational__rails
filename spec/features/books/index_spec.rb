require 'rails_helper'
RSpec.describe 'Books Index Page' do
  before :each do
    @author_1 = Author.create!(name: 'C.S. Lewis', alive: false, age: 64)
    @author_2 = Author.create!(name: 'Leigh Bardugo', alive: true, age: 46)

    @book_1 = @author_1.books.create!(title: 'Narnia', series: true, page_count: 237)
    @book_2 = @author_1.books.create!(title: 'Prince Caspian', series: true, page_count: 237)
    @book_3 = @author_2.books.create!(title: 'Shadow and Bone', series: true, page_count: 237)
    @book_4 = @author_2.books.create!(title: 'Siege and Storm', series: true, page_count: 357)

    visit "/books"
  end

  it "shows child and its attributes" do
      expect(page).to have_content(@book_1.title)
      expect(page).to have_content(@book_1.series)
      expect(page).to have_content(@book_1.page_count)

      expect(page).to have_content(@book_2.title)
      expect(page).to have_content(@book_2.series)
      expect(page).to have_content(@book_2.page_count)

      expect(page).to have_content(@book_3.title)
      expect(page).to have_content(@book_3.series)
      expect(page).to have_content(@book_3.page_count)

      expect(page).to have_content(@book_4.title)
      expect(page).to have_content(@book_4.series)
      expect(page).to have_content(@book_4.page_count)
  end
end