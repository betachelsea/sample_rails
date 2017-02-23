require 'rails_helper'

describe "test" do

  # RSpec Core 3.5
E1659FWU

  # Shared Examples
  #   described_class を活用する
  #   describe Model1 do .

  # 引数をとれる letも使える
  # shared_examples 変数の違うものを並べる 引数をとれる
  # it_behaves_like "例" do
  #   let(:hoge) { "ここに変数" }
  # end
  # 
  # it_behaves_like "hoge", "引数"

  # 自動include
  # shared_examples "test", name: :sushi do
  # end
  #
  #describe String, name: :sushi do
  #end


  # shared_contextについて
  # describe "test", include_shared: true do
  #  # ここですでにshareされている状態
  # end

  # Command Line
  #
  # --example オプション
  #   特定の名前で実施するrspecをフィルタする
  # 
  # --format documentaiton
  #   (結果をカッコよくする)
  #
  # 途中の行から実行
  # bundle exec rspec spec/models/sushi_spec.rb:5
  # (5行目から)
  #
  # Only Failures
  #   RSpec.configure do |c|
  #     c.example_status_persistence_file_path = "examples.txt"
  #    end
  #
  #   rspec --only-failures
  #   rspec --next-failure
  #

  # Hooks
  #
  # `around` hooks
  # describe "around hook" do |example|
  #   puts "around example before"
  #   example.run
  #   puts "around example after"
  # end
  #
  # it "gets run in order" do
  #   puts "in the example"
  # end
  #
  # =>
  #   around example before
  #   in the example
  #   around example after
  #
  #
  #configに書いてfilterで共有
  # c.before(:example, :before_example) { puts "hello" }
  #
  # it("test", :before_example) { puts "example!!" }
  #
  # before/after, example/context など使い分けが可能

  # Subject / Helper methods
  # 発見はとくになし
  #

  # Metadata
  #
  #  describe 'テストだよ' do
  #   before do |example|
  #     expect(example.description).to eq('A')
  #   end
  #
  #   it "A" do |example|
  #     expect(example.description).to eq("A")
  #   end
  #
  #   let(:desc) {|example| example.description }
  #  end

  # described_class 便利だよね

  #
  # described "無視する", if: false do
  # end
  #
  # described "無視する", unless: true do
  # end
  #
  #
  shared_examples "test" do
    let(:neta) { "ねた" }
    it "注文できる" do
      expect(Sushi.order(neta)).to eq("へいおまち")
    end
  end

  shared_examples "test" do |param1, param2|
    let(:neta) { "ねた" }
    it "注文できる" do
      expect(Sushi.count).to eq("へいおまち")
    end
  end

  it_behaves_like "test" do
    let(:aiueo) { "これを使えるぞ" }
  end

  it_behaves_like "test" do
    let(:aiueo) { "これを使える2" }
  end

end
