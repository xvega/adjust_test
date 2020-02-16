module GithubApi
  class GithubApiService
    include HTTParty

    base_uri 'https://api.github.com'
    REPO_URL = ("#{base_uri}/users/").freeze

    def fetch_user_repositories(username)
      begin
        HTTParty.get("#{REPO_URL}#{username}/repos")
      rescue => e
        "Request failed: #{e}"
      end
    end
  end
end
