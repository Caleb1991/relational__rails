require 'rails_helper'
RSpec.describe 'Authors Edit Page' do
  before :each do
    @author_1 = Author.create!(name: 'C.S. Lewis', alive: false, age: 64)
    @author_2 = Author.create!(name: 'Leigh Bardugo', alive: true, age: 46)

    @book_1 = @author_1.books.create!(title: 'Narnia', series: true, page_count: 237)
    @book_2 = @author_1.books.create!(title: 'Prince Caspian', series: true, page_count: 237)
    @book_3 = @author_2.books.create!(title: 'Shadow and Bone', series: true, page_count: 237)
    @book_4 = @author_2.books.create!(title: 'Siege and Storm', series: true, page_count: 357)
  end

  it 'has an edit form' do
    visit "/authors/#{@author_1.id}/edit"

    expect(page).to have_content('Name')
    expect(page).to have_content('Alive')
    expect(page).to have_content('Age')
  end

  it 'can edit a author' do
    visit "/authors/#{Author.last.id}/edit"

    click_on("Edit Author")

    fill_in("Name", with: 'Edward')

    click_on 'Edit Author'

    expect(current_path).to eq("/authors/#{@author_1.id}")
    expect(page).to have_content('Edward')
  end
end