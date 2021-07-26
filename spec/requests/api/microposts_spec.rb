require 'rails_helper'

RSpec.describe "Api::Microposts", type: :request do
  describe 'GET /api/microposts' do
    let!(:microposts) { create_list(:micropost, 5) }
    it 'マイクロポスtの一覧が取得できること' do
      get api_microposts_path
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json['microposts']).to match_array(microposts.map { |micropost|
        include(
          'id' => micropost.id,
          'content' => micropost.content,
          'user' => include('id' => micropost.user.id)
        )
      })
    end
  end
end
