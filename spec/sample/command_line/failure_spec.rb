require "spec_helper"

describe "only failures 確認" do
  it "成功1" do
    expect("文字列".class).to eq(String)
  end

  xit "失敗1" do
    expect(1.class).to eq(String)
  end

  it "成功2" do
    expect(1.class).to eq(Fixnum)
  end

  xit "失敗2" do
    expect([1].class).to eq(Fixnum)
  end
end
