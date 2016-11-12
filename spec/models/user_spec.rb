require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { FactoryGirl.create(:user) }

  describe '引数をstubの戻り値に利用する' do
    before do
      allow(user).to receive(:order_sushi){|value| "#{value}ください" }
    end
    it { expect(user.order_sushi("たまご")).to eq("たまごください") }
    it { expect(user.order_sushi("いくら")).to eq("いくらください") }
    it { expect(user.order_sushi("えんがわ")).to eq("えんがわください") }
  end


  def user_eat_sushi
    sushi = Sushi.create(name: "甘エビ")
    user.eat(sushi)
  end

  it "userがsushiを食べることを確認" do
    expect(user).to receive(:eat) do |arg|
      expect(arg.class).to eq(Sushi)
    end
    sushi = Sushi.create(name: "甘エビ")
    user.eat(sushi)
  end

  describe "mock取り止めテスト" do
    let(:user) { User.new }
    before { allow(user).to receive(:hello).and_return("mocked hello!") }

    it "mockで設定した値が得られる" do
      expect(user.hello).to eq("mocked hello!")
    end

    context "mockをやっぱり取りやめた場合" do
      # and_call_original で mockを取り止めることができる
      before { allow(user).to receive(:hello).and_call_original }

      it "元に戻した値が得られる" do
        expect(user.hello).to eq("original hello!")
      end

    end
  end
end
