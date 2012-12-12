require 'spec_helper'

describe CompanyUsersController do
  subject { CompanyUser.last }

  context 'without is_admin' do
    describe "POST 'create'" do
      before do
        controller.create position: 'programmer'
      end
      it { should_not be_is_admin }
    end
  end

  context 'with is_admin' do
    describe "POST 'create'" do
      before do
        controller.create position: 'programmer'
      end
      it { should_not be_is_admin }
    end
  end
end
