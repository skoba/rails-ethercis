class Base
  include Her::Model
 
  def self.host
    Ethercis['host']
  end

  def self.port
    Ethercis['port']
  end

  def self.path_prefix
    Ethercis['path_prefix']
  end

  def self.username
    Ethercis['username']
  end

  def self.password
    Ethercis['password']
  end

  def self.full_uri
    uri = URI.join(self.host, self.path_prefix)
    uri.port = 8888
    uri.to_s
  end

  def self.connection
    @@con ||= Faraday::Connection.new self.full_uri
  end  
  
  def self.set_ehr_session
    self.connection.params = {'username' => self.username, 'password' => self.password }
    res = self.connection.post 'session'
    self.connection.headers['Ehr-Session'] = res['ehr-session']
  end
end
