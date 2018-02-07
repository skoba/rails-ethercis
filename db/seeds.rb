# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'csv'
# require 'faraday'
# require 'faraday_middleware'

# url_prefix = "http://localhost:8888/"

# acon = Faraday::Connection.new(url: url_prefix,
#                                headers: {'Ehr-Session' => session_id}) do |con|
#   con.response :json, parser_option: { symbolize_name: true }
#   con.adapter Faraday.default_adapter
# end
# acon.path_prefix = 'rest/v1'

# people_seed_file = File.join(File.dirname(__FILE__), 'person_sample.csv')
# people = CSV.open(people_seed_file, encoding: 'Shift_JIS:UTF-8')

# people.each do |person|
#   Person.create(name: person[0], gender: person[2], date_of_birth: person[4].gsub('/','-'),address: person[5], phone: person[6])
# end

# Person.all.each do |person|
#   res = acon.post "ehr?subjectId=#{person.id}&subjectNamespace=RailsDB"
# #  res = acon.post 'ehr', { 'subjectId'=> person.id.to_s, 'subjectNamespace' => 'RailsDB' }
#   person.ehr_id =res.body['ehrId']
#   person.save
# end

require 'factory_bot'
require 'json'

client = Faraday.new(url: 'http://localhost:8888/rest/v1/')
session = client.post 'session?username=root&password=secret' #, { username: 'root', password: 'secret' }
session_id = session.headers['ehr-session']
client.headers['Ehr-Session'] = session_id

50.times do
  person = FactoryBot.create :person
  result = client.post "ehr?subjectId=#{person.id.to_s}&subjectNamespace='RailsDB"
  person.ehr_id = JSON.parse(result.body)['ehrId']
  person.save
end
  
