class Ehr < Base
  # belongs_to :person
  # has_many :comositions

  attr_reader :id, :subject_id

  def initialize(params)
    @id = params[:id]
    @subject_id = params[:subject_id]
  end
  
  def self.find(id)
    self.set_ehr_session
    res = self.connection.get "ehr/#{id}"
    self.close_ehr_session
  rescue
    self.set_ehr_session
    self.find(id)
  end

  def self.create(params)
    self.set_ehr_session
    response = self.connection.post "ehr?subjectId=#{params[:subject_id]}&subjectNamespace=#{self.subject_namespace}" #, {'subjectId' => params[:subject_id], 'subjectNamespace' => self.subject_namespace}
    result = JSON.parse(response.body)
    self.close_ehr_session
    self.new(id: result['ehrId'], subject_id: params[:subject_id])
  rescue
    self.set_ehr_session
    self.create(params)
  end
end
