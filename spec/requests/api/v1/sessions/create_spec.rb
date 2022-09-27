require 'rails_helper'

RSpec.describe "session create" do
  describe 'session' do
    it 'creates a new session' do

      user_params = {
        "email": "whatever@example.com",
        "password": "password123",
        "password_confirmation": "password123"
      }

      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)

      session_params = {
      "email": "whatever@example.com",
      "password": "password123"
    }

    post "/api/v1/sessions", headers: headers, params: JSON.generate(session: session_params)


      result = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful
      expect(result).to have_key(:id)
      expect(result[:id]).to be_a(String)
      expect(result[:type]).to eq("user")
      expect(result[:attributes]).to have_key(:email)
      expect(result[:attributes][:email]).to be_a(String)
      expect(result[:attributes]).to have_key(:api_key)
      expect(result[:attributes][:api_key]).to be_a(String)
      expect(result[:attributes][:api_key].chars.count).to eq(50)
    end
  end

  it 'password is bad' do

    user_params = {
      "email": "whatever@example.com",
      "password": "password123",
      "password_confirmation": "password123"
    }

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)

    session_params = {
    "email": "whatever@example.com",
    "password": "password987"
    }

    post "/api/v1/sessions", headers: headers, params: JSON.generate(session: session_params)


    data = JSON.parse(response.body, symbolize_names: true)

    expect(data).to have_key(:error)
    expect(data[:error]).to eq("Login failed")
  end

  it 'email is bad' do

    user_params = {
     "email": "whatever@example.com",
     "password": "password123",
     "password_confirmation": "password123"
    }

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)

    session_params = {
     "email": "whatever69@example.com",
     "password": "password123"
    }

    post "/api/v1/sessions", headers: headers, params: JSON.generate(session: session_params)


    data = JSON.parse(response.body, symbolize_names: true)

    expect(data).to have_key(:error)
    expect(data[:error]).to eq("Login failed")
  end
end
