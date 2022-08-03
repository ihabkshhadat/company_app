require_relative 'company_api'
module Api
  class EmployeeApi < CompanyAPI
    def initialize
      @sub_url = '/employees'
    end

    def getEmployees
      self.class.get(@sub_url).parsed_response
    end
  end
end
