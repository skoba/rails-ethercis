class Composition < Base
  collection_path 'rest/v1'
#  attributes :id, template_id:, :format, :data, :status
  
  def self.find(id)
    res = get "http://localhost:8888/rest/v1/composition/#{id}?format=ECISFLAT"
    Composition.new(id: id, template_id: res.template_id, format: 'ECISFLAT', data: res.data)
  end

  def self.find_by_ehr_id(ehr_id)
    aql = "select e/ehr_id/value as ehr_id, c/context/start_time/value as start_time, c/name/value as name, c/uid/value as uid from EHR e contains COMPOSITION c"#     sql = "SELECT * FROM ehr.composition WHERE ehr_id=#{ehr_id}"
    # res = connection.post 'http://localhost:888/rest/v1/session?username=root&password=secret' #, {'username' => 'root', 'password' => 'secret'}
    # session_id = res.header['ehr-session']
    # header ={ 'Ehr-Session' => session_id} #, 'aql' => aql }
    # #connection.get "http://localhost:8888/rest/v1/query?sql=#{sql}", header
    res = get "http://localhost:8888/rest/v1/query?aql=#{aql}"
    res.resultSet
  end

  def self.create(params)
    self.set_ehr_session
    res = self.connection.post "composition?ehrId=#{params[:ehr_id]}&templateId=#{params[:template_id]}&format=ECISFLAT" do |req, response|
      req.body = params[:data]
    end
    self.close_ehr_session
    body = JSON.parse(res.body)
    Composition.new(id: body['compositionUid'][0..35], template_id: params[:template_id], format: 'ECISFLAT', data: params[:data], status: res.status)
  end
end
