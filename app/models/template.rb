class Template < Base
  attr_reader :id, :status

  def initialize(params)
    @id = params[:id]
    @status = params[:status]
  end

  def self.create(params)
    self.set_ehr_session
    response = self.connection.post 'template' do |req|
      req.body=File.binread(params[:file])
    end
    result = JSON.parse(response.body)
    self.close_ehr_session
    self.new(id: result['templateId'], status: response.status)
  end

  def self.all
    self.set_ehr_session
    response = self.connection.get 'template'
    self.close_ehr_session
    result = JSON.parse(response.body)
    result['templates'].map do |template|
      Template.new(id: template['templateId'],status: template['status']) 
    end
  end

  def delete
    self.set_ehr_session
    res = delete "http://localhost:8888/rest/v1/template/#{self.templateId}"
    self.close_ehr_session
    res
  end
end
