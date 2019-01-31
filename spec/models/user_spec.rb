require 'rails_helper'

RSpec.describe User, type: :model do
 before do
   @user = User.new(name: 'Example User', email: 'example@user.com')
 end

 specify 'should be valid' do
   expect(@user.valid?).to be_truthy
 end
end
