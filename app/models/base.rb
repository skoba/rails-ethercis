class Base
#  include Her::Model

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

  def self.subject_namespace
    Ethercis['subject_namespace']
  end

  protected
  def self.connection
    @@con ||= Faraday::Connection.new self.full_uri
  end  
  
  def self.set_ehr_session
    res = self.connection.post 'session', self.account
    self.connection.headers['Ehr-Session'] = res.headers['ehr-session']
  end

  def self.close_ehr_session
    self.connection.delete 'session', self.account
  end

  def self.account
    @@account ||= {'username' => self.username, 'password' => self.password }
  end
end
