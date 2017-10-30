# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'shoulda/matchers'
require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) { User.new(email: "test@example.com", password: "password") }

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }

    #IDEA Solutions create session_token before validation...
    context 'when validating presence of session_token' do
      it 'should ensure a user\'s session_token' do
        user = User.new(email: "test@example.com", password_digest: "Test1")
        expect(user.valid?).to be true
      end
    end

    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:session_token) }

    #TODO let @password = '12345', then check if flash[:errors].empty?
    it 'should validate length of password is greater than 6'

    #IDEA ShouldaMatchers has this functionality!
    # it { should validate_length_of(:password).is_at_least(6) }
  end

  describe 'class methods' do
    describe '::find_by_credentials' do
      it 'should return nil if a user is not found' do
        expect(User.find_by_credentials("test2@example.com", "password")).to eq(nil)
      end

      it 'should return nil if the password is incorrect' do
        expect(User.find_by_credentials("test@example.com", "hunter12")).to eq(nil)
      end

      # TODO This is broken--probably due to the model.
      it 'should return a user when given correct arguments' do
        expect(User.find_by_credentials("test@example.com", "password")).to eq(user)
      end
    end

    describe '#is_password?' do
      it 'should return true if its argument matches the password from the digest' do
        expect(user.is_password?("password")).to be true
      end

      it 'should return false otherwise' do
        expect(user.is_password?("hunter12")).to be false
      end
    end

    describe '#reset_session_token' do
      it 'issues a new session_token' do
        #TODO solution includes this
        #user_valid?
        old_token = user.session_token
        user.reset_session_token!

        expect(user.reset_session_token!).to_not eq(old_token)
      end

      it 'should return a new session_token' do
        expect(user.reset_session_token!).to eq(user.session_token)
      end
    end

  end

end
