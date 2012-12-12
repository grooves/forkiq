class CompanyUsersController < ApplicationController
  permits :position

  def create(company_user)
    CompanyUser.create! company_user
  end
end
