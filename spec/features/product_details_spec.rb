require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see the product details by clicking on the product from the homepage" do
    # ACT
    visit root_path
    # puts page.html

    # within('.product header') do
    # page.click_link("Red Bookshelf", :match => :first)
    # click_button("Details", :match => :first)
    first('h4').click
    # end

    expect(page).to have_css('dt', text: 'Description')
    save_screenshot
    # This screenshot below shows that we are on the cart page
  end


end
