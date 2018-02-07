class AccessToken
  def self.get
    client = Faraday.new('http://localhost:8888/rest/v1/')
    session = client.post 'session?username=root&password=secret' #, { username: 'root', password: 'secret' }
    session.headers['ehr-session']
  end

  def self.drop(session)
    client = Faraday.new('http://localhost:8888/rest/v1/')
    client.headers['Ehr-Session'] = session
    session = client.delete 'session?username=root&password=secret'
  end
end
