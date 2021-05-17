require 'rails_helper'
RSpec.describe 'Authors/Books Show Page' do
  before :each do
    @author_1 = Author.create!(name: 'C.S. Lewis', alive: false, age: 64)
    @author_2 = Author.create!(name: 'Leigh Bardugo', alive: true, age: 46)

    @book_1 = @author_1.books.create!(title: 'Narnia', series: true, page_count: 237)
    @book_2 = @author_1.books.create!(title: 'Prince Caspian', series: true, page_count: 237)
    @book_3 = @author_2.books.create!(title: 'Shadow and Bone', series: true, page_count: 237)
    @book_4 = @author_2.books.create!(title: 'Siege and Storm', series: true, page_count: 357)

    @id_1 = @author_1.id.to_s
    @id_2 = @author_2.id.to_s
  end

    # user story 2 & 7
  it "displays books by author attributes" do
    visit "/authors/" + @id_1 + "/books"
    expect(page).to have_content(@author_1.name)
    expect(page).to have_content(@author_1.age)
    expect(page).to have_content(@author_1.alive)
    expect(page).to have_content(@author_1.book_count)

    expect(page).to have_content(@book_1.title)

    expect(page).to have_content(@book_2.title)
  end

  it "displays  books by author attributes" do
    visit "/authors/" + @id_2 + "/books"
    expect(page).to have_content(@author_2.name)
    expect(page).to have_content(@author_2.age)
    expect(page).to have_content(@author_2.alive)
    expect(page).to have_content(@author_2.book_count)

    expect(page).to have_content(@book_3.title)

    expect(page).to have_content(@book_4.title)
  end
end