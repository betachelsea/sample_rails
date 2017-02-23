# https://relishapp.com/rspec/rspec-core/v/3-5/docs/example-groups/shared-examples#sharing-metadata-automatically-includes-shared-example-groups

class Sushi
  def buy; end
  def purchased?; end
end

class Donut
  def buy; end
  def purchased?; end
end

shared_examples "商品に関する確認", test_method: :goods do
  it { expect(described_class.method_defined?(:buy)).to eq(true) }
  it { expect(described_class.method_defined?(:purchased?)).to eq(true) }
end

describe Sushi, test_method: :goods do
end

describe Donut, test_method: :goods do
end
