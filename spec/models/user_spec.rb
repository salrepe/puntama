require 'spec_helper'

describe User do
  describe '#authenticated?' do
    let(:email) { 'email@email.com' }
    let(:password) { '123445' }

    context 'when the password is valid' do
      it 'returns true' do
        user = User.create(email: email, password: password)

        expect(user.authenticated?(password)).to be true
      end
    end

    context 'when the password is not valid' do
      it 'returns false' do
        user = User.create(email: email, password: password)

        expect(user.authenticated?('no_valid_pass')).to be false
      end
    end
  end
end
