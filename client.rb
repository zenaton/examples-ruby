require 'bundler/setup'
require 'dotenv/load'
require 'zenaton'

app_id = ENV['ZENATON_APP_ID']
api_token = ENV['ZENATON_API_TOKEN']
app_env = ENV['ZENATON_APP_ENV']

raise "Please add your Zenaton application id on '.env' file (https://zenaton.com/app/api)" unless app_id
raise "Please add your Zenaton api token on '.env' file (https://zenaton.com/app/api)" unless api_token
raise "Please add your Zenaton environment on '.env' file (https://zenaton.com/app/api)" unless app_env

Zenaton::Client.init(app_id, api_token, app_env)
