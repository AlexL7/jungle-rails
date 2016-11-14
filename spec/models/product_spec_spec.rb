require 'rails_helper'
#require 'shoulda/matchers'

RSpec.describe Product, type: :model do

  before do
      @product = Product.create(
                       name:"Fancy Chair",
                       description: "Elegant chair sutible for all rooms",
                       image:'/images/fancy_chair',
                       price_cents: 8900,
                       quantity: 10
                      )

      @category = Category.create(name: "chairs")
  end




  context "Validations" do
    it "has a name" do
      expect(@product.name).to be_truthy
    end

    it "has a price" do
      expect(@product.price).to be_truthy
    end

    it "has a quantity" do
      expect(@product.quantity).to be_truthy
    end

    it "has a category" do
      expect(@product.quantity).to be_truthy
    end

      it "should validate a product" do
      expect(@product).to eq(nil)
    end
  end





end