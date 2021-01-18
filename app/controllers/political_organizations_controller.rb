class PoliticalOrganizationsController < ApplicationController
  def index
    political_organizations = PoliticalOrganization.all

    render json: political_organizations
  end

  def show
    political_organization = PoliticalOrganization.find_by(slug: params[:id])

    render json: political_organization
  end
end
