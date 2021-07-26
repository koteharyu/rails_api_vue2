require 'rails_helper'

RSpec.describe "Api::UsersControllers", type: :request do
  describe "POST / users" do
    let(:user_params) { { user: { name: 'haryu', email: "haryu@example.com", password: "password", password_confirmation: "password" } } }
    it 'ユーザーの作成に成功すること' do
      post api_users_path, params: user_params
      expect(response).to have_http_status(201)
      json = JSON.parse(response.body)
      expect(json['user']).to include({
        "id"=>be_present,
        "name"=>"haryu",
        "email"=>"haryu@example.com",
      })
    end

    let(:invalid_user_params) { { user: { name: 'haryu', email: "haryu@example.com", password: "password", password_confirmation: "inpassword" } } }
    it 'ユーザーの作成に失敗すること' do
      post api_users_path, params: invalid_user_params
      expect(response).to have_http_status(422)
      json = JSON.parse(response.body)
      expect(json['error']).to be_present
    end
  end

  describe 'GET /api/users/:id' do
    let(:user) { create(:user) }
    it 'ユーザーの詳細情報を取得できること' do
      get api_user_path(user)
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json['user']).to include({
        'id' => user.id,
        'name' => user.name,
        'email' => user.email,
        'introduction' => user.introduction
      })
    end
  end
end
