class Ehr < Base
  belongs_to :person
  has_many :comositions

  attr_reader :id

  def self.find(id, session_id)
    con = Faraday.new(url { 'Ehr-Session' => session_id }
    res = con.get "http://localhost:8888/rest/v1/ehr/#{id}"
  end

  def self.create(params)
    con = Faraday.new
    res = post "http://localhost:8888/rest/v1/ehr?subjectId=#{params[:subject_id]}&subjectNamespace=#{RailsEthercis::Application.config.subject_namespace}"
    @id = res['ehrId']
    res
  end

  # this method does not work well
  # def self.destroy(params)
  #   delete "http://localhost:8888/rest/v1/ehr?ehrId=#{params[:ehr_id]}"
  # end

  def 
  protected
  def set_ehr_session_id
    
  end
end
