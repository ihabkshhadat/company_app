require 'set'

namespace :project do
  desc "TODO"
  task update_project_list: :environment do
    begin
      @projects = Api::ProjectApi.new.getProjects

      if @projects['error'] == 0
        projects_ids =  @projects['data'].map {|project| project['id']}
        existing_project_ids = Project.where(id:projects_ids).map {|project| project.id}
        new_ids = projects_ids-existing_project_ids
        records =  @projects['data'].select {|row| new_ids.include? row['id']}
        user_ids =  records.map {|row|  row['employeeId']}
        user_ids =user_ids.to_set
        existing_user_ids = User.where(id:user_ids).map {|user| user.id}
        new_user = user_ids-existing_user_ids
        if !new_user.empty?
          @employee = Api::EmployeeApi.new.getEmployees
          user_records =  @employee['data'].select {|row| new_user.include? row['id']}
          user_records.map do |hash|
            name = hash['name'].split(' ')
            hash[:first_name] =name[0]
            hash[:last_name] =name[1]
            hash[:company_id] = 4

            hash[:id] = hash.delete 'id'
            hash.delete 'username'
            hash.delete 'name'
            hash.delete 'email'
            hash.delete 'gender'
            hash.delete 'designation'
            hash.delete "phone_number"
            hash.delete "complete_address"
          end
          User.insert_all(user_records)

        end
        records.map do |hash|
            hash[:user_id] = hash.delete 'employeeId'
        end
        Project.insert_all(records)
      end
    rescue => error
      puts error
    end
  end

end
