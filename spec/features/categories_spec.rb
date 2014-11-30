require 'spec_helper'

describe 'Categories', type: :feature do
  describe 'new' do
    it 'allows to create a new category' do
      visit '/admin/categories/new'
      fill_in 'category[name]', with: 'Manualidades'
      click_button 'Save'

      expect(page).to have_content('New category added successfully')
      expect(page).to have_content('Manualidades')
    end
  end

  describe 'edit' do
    it 'allows to update an existing category' do
      category = Category.create!(name: 'Merceria')

      visit '/admin/categories'
      click_link "edit_#{category.name}"

      fill_in 'category[name]', with: 'Manualidades'
      click_button 'Update'

      expect(page).to have_content('Category was updated successfully')
      expect(page).to have_content('Manualidades')
      expect(page).not_to have_content('Merceria')
    end
  end
end
