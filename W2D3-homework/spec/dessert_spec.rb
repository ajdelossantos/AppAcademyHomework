require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs
(the `it` statements without blocks)!
Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:donut) { Dessert.new('donut', 13, "chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(donut.type).to eq('donut')
    end

    it "sets a quantity" do
      expect(donut.quantity).to eq(13)
    end

    it "starts ingredients as an empty array" do
      expect(donut.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new('donut', "hella", "chef") }
        .to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(donut.ingredients).to_not include('sugar')
      donut.add_ingredient('sugar')
      expect(donut.ingredients).to include('sugar')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      # TODO Other approaches; are these valid?
        # expect(donut.ingredients).to receive(shuffle!) => returns error
        # call shuffle 100 times and ensure it returns the original order
        # less than n times

      ingredients = ["sugar", "flour", "butter", "eggs", "oil", "salt"]

      ingredients.each do |i|
        donut.add_ingredient(i)
      end

      donut.mix!

      expect(donut.ingredients).to_not eq(ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      # TODO Is the initial expect necessary
      expect(donut.quantity).to eq(13)
      donut.eat(3)
      expect(donut.quantity).to eq(10)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { donut.eat(100) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name"
      # This doesn't work...
      # expect(donut.serve).to include(chef.titleize)

      # TODO Why are method stubs the preferred solution here? i.e.:
      # allow(chef).to receive(:titleize).and_return("Chef Ramsey")
      # expect(donut.serve).to eq("Chef Ramsey has made 13 donuts!")

  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
      # This doesn't work...
      # expect(chef).to receive(:bake).with(dount)

      # TODO Why does #make_more need to be invoked for above line to work
      # donut.make_more

  end
end
