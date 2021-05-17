require 'rails_helper'
RSpec.describe 'Books Show Page' do
  before :each do
    @author_1 = Author.create!(name: 'C.S. Lewis', alive: false, age: 64)
    @author_2 = Author.create!(name: 'Leigh Bardugo', alive: true, age: 46)

    @book_1 = @author_1.books.create!(title: 'Narnia', series: true, page_count: 237)
    @book_2 = @author_1.books.create!(title: 'Prince Caspian', series: true, page_count: 237)
    @book_3 = @author_2.books.create!(title: 'Shadow and Bone', series: true, page_count: 237)
    @book_4 = @author_2.books.create!(title: 'Siege and Storm', series: true, page_count: 357)

    @id_1 = @book_1.id.to_s
    @id_2 = @book_2.id.to_s
    @id_3 = @book_3.id.to_s
    @id_4 = @book_4.id.to_s

    visit "/books"
  end

  # user story 4
  it "shows child1 and its attributes" do
    visit "/books/" + @id_1
    expect(page).to have_content(@book_1.title)
    expect(page).to have_content(@book_1.series)
    expect(page).to have_content(@book_1.page_count)
  end
  it "shows child2 and its attributes" do
    visit "/books/" + @id_2
    expect(page).to have_content(@book_2.title)
    expect(page).to have_content(@book_2.series)
    expect(page).to have_content(@book_2.page_count)
  end
  it "shows child3 and its attributes" do
    visit "/books/" + @id_3
    expect(page).to have_content(@book_3.title)
    expect(page).to have_content(@book_3.series)
    expect(page).to have_content(@book_3.page_count)
  end
  it "shows child4 and its attributes" do
    visit "/books/" + @id_4
    expect(page).to have_content(@book_4.title)
    expect(page).to have_content(@book_4.series)
    expect(page).to have_content(@book_4.page_count)
  end
end