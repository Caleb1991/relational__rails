require 'rails_helper'
RSpec.describe 'Authors Index Page' do
  before :each do
    @author_1 = Author.create!(name: 'C.S. Lewis', alive: false, age: 64)
    @author_2 = Author.create!(name: 'Leigh Bardugo', alive: true, age: 46)

    @author_1.books.create!(title: 'Narnia', series: true, page_count: 237)
    @author_1.books.create!(title: 'Prince Caspian', series: true, page_count: 237)
    @author_2.books.create!(title: 'Shadow and Bone', series: true, page_count: 237)
    @author_2.books.create!(title: 'Siege and Storm', series: true, page_count: 357)

    visit "/authors"
  end

  it "displays each authors name" do
    expect(page).to have_content(@author_1.name)
  end

  it "displays each authors name" do
    expect(page).to have_content(@author_2.name)
  end
end