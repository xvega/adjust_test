require 'rails_helper'

describe 'GithubApi' do
  context '#fetch_username_repositories' do
    context 'when the request is successful' do

      context 'and there are repositories to display' do
        let(:username) { 'xvega' }

        it 'returns a successful response',
           vcr: { cassette_name: 'github/user_repos', record: :new_episodes } do
          response = GithubApi::GithubApiService.new.fetch_user_repositories(username)
          expect(response.response.code).to eq('200')
          expect(response.parsed_response).not_to be_empty
          expect(response.parsed_response.first.is_a?(Hash)).to eq(true)
          expect(response.parsed_response.first.dig('owner', 'login')).to eq(username)
        end
      end

      context 'and there are no repositories to display' do
        let(:username) { 'xvegar' }

        it 'does not return repositories',
          vcr: { cassette_name: 'github/user_repos', record: :new_episodes } do
          response = GithubApi::GithubApiService.new.fetch_user_repositories(username)
          expect(response.parsed_response).to be_empty
        end
      end
    end

    context 'when the request is a failure' do
      context 'and there are repositories to display' do

        context 'and the username does not exist' do
          let(:username) { 'dummyrandomuserwithnorepostodisplay' }

          it 'returns a bad response',
             vcr: { cassette_name: 'github/no_user_repos', record: :new_episodes } do
            response = GithubApi::GithubApiService.new.fetch_user_repositories(username)
            expect(response.response.code).to eq('404')
            expect(response.parsed_response['message']).to eq('Not Found')
          end
        end

        context 'and the username is nil' do
          it 'returns a bad response',
             vcr: { cassette_name: 'github/no_user_repos', record: :new_episodes } do
            response = GithubApi::GithubApiService.new.fetch_user_repositories(nil)
            expect(response.response.code).to eq('404')
            expect(response.parsed_response['message']).to eq('Not Found')
          end
        end
      end
    end
  end
end
