class Composition < Base
  attr_reader :id, :template_id, :attributes, :format, :status

  def initialize(params)
    @id = params[:id]
    @template_id = params[:id]
    @format = params[:format]
    @attributes = params[:attributes]
    @status = params[:status]
  end

  def self.find(id)
    self.set_ehr_session
    response = self.connection.get "composition/#{id}?format=FLAT"
    result = JSON.parse(response.body)
    self.close_ehr_session
    Composition.new(id: id, template_id: result['template_id'], format: 'FLAT', attributes: result['composition'])
  rescue
    self.set_ehr_session
    self.find(id)
  end

  def self.find_by_ehr_id(ehr_id)
    self.set_ehr_session
    aql = "select e/ehr_id/value as ehrId, c/context/start_time/value as start_time, c/name/value as name, c/uid/value as uid from EHR e [ehr_id/value='#{ehr_id}']contains COMPOSITION c"
    res = self.connection.get "query", {'aql' => aql }
    self.close_ehr_session
    JSON.parse(res.body)['resultSet']
  rescue
    self.set_ehr_session
    self.find_by_ehr_id(ehr_id)
  end

  def self.create(params)
    self.set_ehr_session
    res = self.connection.post "composition?ehrId=#{params[:ehr_id]}&templateId=#{params[:template_id]}&format=ECISFLAT" do |req, response|
      req.body = params[:attributes]
    end
    self.close_ehr_session
    body = JSON.parse(res.body)
    Composition.new(id: body['compositionUid'][0..35], template_id: params[:template_id], format: 'ECISFLAT', attributes: params[:attributes], status: res.status)
  rescue
    self.set_ehr_session
    self.create(params)
  end
end
