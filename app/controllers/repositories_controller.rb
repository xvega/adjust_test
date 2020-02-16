class RepositoriesController < ApplicationController
  def index
    @repositories = GithubApi::GithubApiService.new.fetch_user_repositories(params[:search])

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def repo_params
    params.permit :search
  end
end