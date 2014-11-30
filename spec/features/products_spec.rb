require 'spec_helper'

describe 'Products', type: :feature do
  describe 'new' do
    it 'allows to create a new product' do
      Category.create(name: 'Manualidades')

      visit 'admin/products/new'
      fill_in 'product[name]', with: 'Aguja'
      fill_in 'product[description]', with: 'Una gran aguja desechable'
      fill_in 'product[price]', with: '1234'
      select 'Manualidades', from: 'product[category_id]'
      click_button 'Save'

      expect(page).to have_content('Products')
      expect(page).to have_content('Aguja')
    end
  end
end
