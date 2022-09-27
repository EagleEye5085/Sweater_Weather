require 'rails_helper'

RSpec.describe "user create" do
  describe 'user' do
    it 'creates a new user' do

      user_params = {
        "email": "whatever@example.com",
        "password": "password123",
        "password_confirmation": "password123"
      }

      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)

      result = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful
      # binding.pry
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



  it 'email is already taken' do

   user_params = {
     "email": "whatever@example.com",
     "password": "password123",
     "password_confirmation": "password123"
   }

   headers = {"CONTENT_TYPE" => "application/json"}

   post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)

   user_params_2 = {
     "email": "whatever@example.com",
     "password": "password12309",
     "password_confirmation": "password12309"
   }

   post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params_2)

   expect(response).to_not be_successful

   data = JSON.parse(response.body, symbolize_names: true)

   expect(data).to have_key(:error)
   expect(data[:error]).to eq("email taken")
 end

 it 'password mismatch' do

   user_params = {
     "email": "whatever@example.com",
     "password": "password123",
     "password_confirmation": "password12309"
   }

   headers = {"CONTENT_TYPE" => "application/json"}

   post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)

   data = JSON.parse(response.body, symbolize_names: true)

   expect(data).to have_key(:error)
   expect(data[:error]).to eq("password and confirmation mismatch")
 end

 it 'email format is invalid' do

   user_params = {
     "email": "OopsNotAnEmailAddress",
     "password": "test123",
     "password_confirmation": "test123"
   }

   headers = {"CONTENT_TYPE" => "application/json"}

   post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)

   expect(response).to_not be_successful

   data = JSON.parse(response.body, symbolize_names: true)

   expect(data).to have_key(:error)
   expect(data[:error]).to eq("bad email")
 end

end
