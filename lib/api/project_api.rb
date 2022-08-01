require_relative 'company_api'
module Api

  class ProjectApi < CompanyAPI

    def initialize
      @sub_url ='/projects'
    end

    def getProjects
      self.class.get(@sub_url).parsed_response
    end

    def getProjectsDetails(id)
      options = { query: { id: id } }
      self.class.get(@sub_url, options).parsed_response
    end

    def getEmployeeProjects(id)
      options = { query: { employeeId: id } }
      self.class.get(@sub_url, options).parsed_response
    end
  end
end
