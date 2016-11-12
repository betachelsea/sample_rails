require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { FactoryGirl.create(:user) }

  describe "stub取り止めテスト" do
    before { allow(user).to receive(:hello).and_return("stubbed hello!") }
    it "stubで設定した値が得られる" do
      expect(user.hello).to eq("stubbed hello!")
    end

    # and_call_original で mockを取り止めることができる
    context "mockをやっぱり取りやめた場合" do
      before { allow(user).to receive(:hello).and_call_original }
      it "元に戻した値が得られる" do
        expect(user.hello).to eq("original hello!")
      end
    end
  end

  describe "引数の中身をチェックしたいテスト" do
    it "userがsushiを食べることを確認" do
      expect(user).to receive(:eat) do |arg|
        expect(arg.class).to eq(Sushi)
      end
      sushi = Sushi.create(name: "甘エビ")
      user.eat(sushi)
    end
  end

  describe "引数をstubの戻り値に利用するテスト" do
    before do
      allow(user).to receive(:order_sushi){|value| "#{value}ください" }
    end
    it { expect(user.order_sushi("たまご")).to eq("たまごください") }
    it { expect(user.order_sushi("いくら")).to eq("いくらください") }
    it { expect(user.order_sushi("えんがわ")).to eq("えんがわください") }
  end

  describe "呼び出した回数に応じて戻り値を切り替えるテスト" do
    before do
      words = ["美味しい", "新鮮ですね", "最高"]
      allow(user).to receive(:say_yum).and_return(*words)
    end
    it '何回も呼び出す' do
      expect(user.say_yum).to eq("美味しい")
      expect(user.say_yum).to eq("新鮮ですね")
      expect(user.say_yum).to eq("最高")
      expect(user.say_yum).to eq("最高") # 未指定は最後の指定がずっと続く
    end
    it '1回だけ呼び出す' do
      expect(user.say_yum).to eq("美味しい")
    end
  end

end
