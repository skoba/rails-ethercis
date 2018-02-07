class Base
  include Her::Model

  def self.site_url
    Ethercis['site']
  end

  def self.port
    Ethercis['port']
  end

  def self.path_prefex
    Ethercis['path_prefix']
  end

  def self.username
    Ethercis['username']
  end

  def self.password
    Ethercis['password']
  end

  def self.set_ehr_session

  end
end
