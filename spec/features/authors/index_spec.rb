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

  # user story 11
  it "can has a link to add a new author" do
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

  it "has a edit link to edit author" do
    page.find(:id, "edit_author_#{Author.last.id}").click
    expect(current_path).to eq("/authors/#{Author.last.id}/edit")
  end
end