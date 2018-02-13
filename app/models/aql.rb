class AQL < Base
  def self.query(aql)
    self.set_ehr_session
    res = self.connection.get "query", {'aql' => aql }
    self.close_ehr_session
    res.body
  rescue
    self.set_ehr_session
    self.query(aql)
  end
end
