require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:gelato) { Dessert.new("gelato", 100, "Tony") }

  describe "#initialize" do
    it "sets a type" do
      expect(gelato.type).to eq(gelato.type)
    end
    it "sets a quantity" do
      expect(gelato.quantity).to eq(gelato.quantity)
    end

    it "starts ingredients as an empty array" do
      expect(gelato.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {gelato.quantity("2.8", "dmiitri")}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      gelato.add_ingredient("nutella")
      expect(gelato.ingredients).to include("nutella")
    end
  end

  describe "#mix!" do
    # it "shuffles the ingredient array" do
    #   gelato.add_ingredient("milk")
    #   gelato.add_ingredient("vanilla")
    #   gelato.add_ingredient("sugar")
    #   gelato.mix!
    #   expect(gelato.ingredients).to 
    # end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do 
      gelato.eat(2)
      expect(gelato.quantity).to eq(98)
    end

    it "raises an error if the amount is greater than the quantity" do
       expect {gelato.eat(200)}.to raise_error('not enough left!')
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(gelato.chef).to eq(gelato.chef.titleize)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      
    end
  end
end
