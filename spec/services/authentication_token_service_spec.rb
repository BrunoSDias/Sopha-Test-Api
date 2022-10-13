require 'rails_helper'

describe AuthenticationTokenService do
  describe '.call' do
    let(:token) { described_class.call(1) }
    it 'returns authentication token' do
      hmac_secret = described_class::HMAC_SECRET
      decoded_token = JWT.decode token, hmac_secret, true, { algorithm: described_class::ALGORITHM_TYPE }
      expect(decoded_token).to eq(
        [
          { 'user_id' => 1 },
          { 'alg' => 'HS256' }
        ]
      )
    end
  end
end
