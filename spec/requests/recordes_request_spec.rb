require 'rails_helper'

RSpec.describe 'Recordes', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/recordes/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/recordes/create'
      expect(response).to have_http_status(:success)
    end
  end
end
