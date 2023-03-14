require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validating products' do
    before :each do
      @category = Category.create(name: "douglas fur")
      @product = Product.create(name: "Giant Tea", description: "a medium sized plant", image: "plante_1.jpg", price_cents: 0, quantity: 1, category: @category)
    end

    describe 'Validations' do
      it 'should validate name to not be present' do
        @product.name = nil
        @product.save
        expect(@product.name).to_not be_present
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it 'should validate price to not be present' do
        @product.price_cents = nil
        @product.save
        expect(@product.price_cents).to_not be_present
        expect(@product.errors.full_messages).to include("Price cents is not a number")
        expect(@product.errors.full_messages).to include("Price is not a number")
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'should validate quantity to not be present' do
        @product.quantity = nil
        @product.save
        expect(@product.quantity).to_not be_present
        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end
      it 'should validate category to not be present' do
        @product.category = nil
        @product.save
        expect(@product.category).to_not be_present
        expect(@product.errors.full_messages).to include("Category must exist")
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
    end
  end
end