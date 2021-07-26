require 'rails_helper'

RSpec.describe "Api::Me::Accounts", type: :request do
  describe "PATCH /api/me/account" do
    let(:user) { create(:user) }
    let(:token) { Jwt::TokenProvider.call(user_id: user.id) }
    let(:headers) { { Authorization: "Bearer #{token}" } }
    let(:user_params) { { user: { name: "update_name", introduction: "update_introduction"} } }
    it 'プロフィールが更新できること' do
      patch api_me_accounts_path, params: user_params, headers: headers
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json['user']).to include({
        'id' => user.id,
        'name' => 'update_name',
        'email' => user.email,
        'introduction' => 'update_introduction'
      })
    end
  end
end
