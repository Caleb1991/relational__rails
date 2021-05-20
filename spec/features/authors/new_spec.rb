require 'rails_helper'
RSpec.describe 'Authors Create New Page' do
  before :each do
    @author_1 = Author.create!(name: 'C.S. Lewis', alive: false, age: 64)
    @author_2 = Author.create!(name: 'Leigh Bardugo', alive: true, age: 46)

    @book_1 = @author_1.books.create!(title: 'Narnia', series: true, page_count: 237)
    @book_2 = @author_1.books.create!(title: 'Prince Caspian', series: true, page_count: 237)
    @book_3 = @author_2.books.create!(title: 'Shadow and Bone', series: true, page_count: 237)
    @book_4 = @author_2.books.create!(title: 'Siege and Storm', series: true, page_count: 357)

    visit "/authors"
  end

  # user story 11
  it "has a link to add a new author" do
    click_link 'Create New Author'
    expect(current_path).to eq('/authors/new')
  end

  it "can create a new author" do
    visit '/authors/new'

    fill_in("Name", with: 'Emmy')
    fill_in("Alive", with: true)
    fill_in("Age", with: 19)

    click_button 'Create Author'
    new_author_id = Author.last.id
    expect(current_path).to eq('/authors')
    expect(page).to have_content('Emmy')
    visit "/authors/#{new_author_id}"
    expect(page).to have_content(true)
  end
end