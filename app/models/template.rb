class Template < Base
  collection_path 'rest/v1/template'

  def self.create(params)
    con = Faraday::Connection.new(url: 'http://localhost:8888/rest/v1') do |req|
      req.adapter Faraday.default_adapter
    end
    res = con.post 'session?username=root&password=secret'
    session_id = res.headers['ehr-session']
    acon = Faraday::Connection.new(url: 'http://localhost:8888/',
                                   headers: {'Ehr-Session' => session_id}) do |req|
      req.adapter Faraday.default_adapter
    end
    acon.path_prefix = 'rest/v1/'
    res = acon.post 'template' do |req|
      req.body=File.binread(params[:file])
    end
    acon.delete 'session'
    res
  end

  def self.all
    res = get 'http://localhost:8888/rest/v1/template'
    res.templates
  end

  def delete
    delete "http://localhost:8888/rest/v1/template/#{self.templateId}"
  end
end
