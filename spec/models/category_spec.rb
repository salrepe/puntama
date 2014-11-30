require 'spec_helper'

describe Category do
  it 'does not allow to create a category without name' do
    category = Category.create(name: nil)

    expect(category.save).to be false
    expect(category.errors.messages).to eq(name: ["can't be blank"])
  end

  it 'does not allow to add more than one category with the same name' do
    Category.create(name: 'Manualidades')

    category = Category.new(name: 'Manualidades')

    expect(category.save).to be false
    expect(category.errors.messages).to eq(name: ["has already been taken"])
  end
end
