require_relative 'company_api'
module Api

  class EmployeeApi < CompanyAPI
    @@sub_url ='/employees'
    def getEmployees
      self.class.get(@@sub_url).parsed_response
    end
  end
end
