require 'spec_helper'

describe Product do
  let(:category) { Category.create(name: 'Merceria') }

  before(:all) { Category.all.map(&:destroy) }

  it 'does not allow to create a product without name' do
    product = Product.create(name: nil)

    expect(product.save).to be false
    expect(product.errors.messages[:name]).to eq(["can't be blank"])
  end

  it 'does not allow to add more than one product with the same name' do
    Product.create(name: 'Aguja', category: category)

    product = Product.new(name: 'Aguja', category: category)

    expect(product.save).to be false
    expect(product.errors.messages[:name]).to eq(['has already been taken'])
  end

  it 'belongs to a category' do
    product = Product.create(name: 'Hilo')

    expect(product.save).to be false
    expect(product.errors.messages[:category]).to eq(["can't be blank"])
  end
end
