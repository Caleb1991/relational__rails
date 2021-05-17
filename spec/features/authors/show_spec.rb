require 'rails_helper'
RSpec.describe 'Authors Index Page' do
  before :each do
    @author_1 = Author.create!(name: 'C.S. Lewis', alive: false, age: 64)
    @author_2 = Author.create!(name: 'Leigh Bardugo', alive: true, age: 46)

    @author_1.books.create!(title: 'Narnia', series: true, page_count: 237)
    @author_1.books.create!(title: 'Prince Caspian', series: true, page_count: 237)
    @author_2.books.create!(title: 'Shadow and Bone', series: true, page_count: 237)
    @author_2.books.create!(title: 'Siege and Storm', series: true, page_count: 357)

    @id_1 = @author_1.id.to_s
    @id_2 = @author_2.id.to_s
  end

  # user story 2 & 7
  it "displays author attributes" do
    visit "/authors/" + @id_1
    expect(page).to have_content(@author_1.name)
    expect(page).to have_content(@author_1.age)
    expect(page).to have_content(@author_1.alive)
    expect(page).to have_content(@author_1.book_count)
  end

  it "displays author attributes" do
    visit "/authors/" + @id_2
    expect(page).to have_content(@author_2.name)
    expect(page).to have_content(@author_2.age)
    expect(page).to have_content(@author_2.alive)
    expect(page).to have_content(@author_2.book_count)
  end
end