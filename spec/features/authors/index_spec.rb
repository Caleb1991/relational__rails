require 'rails_helper'
RSpec.describe 'Authors Index Page' do
  before :each do
    @author_1 = Author.create!(name: 'C.S. Lewis', alive: false, age: 64)
    @author_2 = Author.create!(name: 'Leigh Bardugo', alive: true, age: 46)

    @book_1 = @author_1.books.create!(title: 'Narnia', series: true, page_count: 237)
    @book_2 = @author_1.books.create!(title: 'Prince Caspian', series: true, page_count: 237)
    @book_3 = @author_2.books.create!(title: 'Shadow and Bone', series: true, page_count: 237)
    @book_4 = @author_2.books.create!(title: 'Siege and Storm', series: true, page_count: 357)

    visit "/authors"
  end

  # user story 1
  it "displays each authors name" do
    expect(page).to have_content(@author_1.name)
    expect(page).to have_content(@author_2.name)
  end

  # user story 6
  it "displays each author by most recent " do
    expect(page).to have_content((@author_1.created_at).strftime("Created on: %m/%d/%Y"))
    expect(page).to have_content((@author_2.created_at).strftime("Created on: %m/%d/%Y"))
  end

    it 'has a link to books' do
    click_on 'Books'

    expect(current_path).to eq('/books')
  end

  it 'has a link to create a new author' do
    click_on 'Create New Author'

    expect(current_path).to eq('/authors/new')
  end

  it 'has a link to edit a author' do
    click_on "Edit #{@author_1.name}"

    expect(current_path).to eq("/authors/#{@author_1.id}/edit")
  end

  # it 'has a link to delete a author' do
  #   expect(page).to have_content(@author_1.name)
  #   click_on "Delete #{@author_1.name}"

  #   expect(page).to_not have_content(@author_1.name)
  # end
end