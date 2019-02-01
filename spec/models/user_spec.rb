require 'rails_helper'

RSpec.describe User, type: :model do
 before do
   @user = User.new(name: 'Example User', email: 'example@user.com')
 end

 specify 'should be valid' do
   expect(@user.valid?).to be_truthy
 end

 specify 'name should be present' do
   @user.name = ''
   expect(@user.valid?).to be_falsey
 end

 specify 'email should be present' do
   @user.email = ''
   expect(@user.valid?).to be_falsey
 end

 specify 'name should not be too long' do
   @user.name = 'a' * 51
   expect(@user.valid?).to be_falsey
 end

 specify 'email should not be too long' do
   @user.email = 'a' * 244 + '@user.com'
   expect(@user.valid?).to be_falsey
 end

  specify 'email validation should accept valid addresses' do
    valid_addresses = %w[example@user.com user@foo.com]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      expect(@user.valid?).to be_truthy, "#{valid_address.inspect} should be valid"
      #inspect配列のリテラルを出力
    end
  end

  specify 'email validation should reject invalid addresses' do
    invalid_addresses = %w[example@user,com user_at_foo.org]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      expect(@user.valid?).to be_falsey, "#{invalid_address.inspect} should be invalid"
    end
  end


end
