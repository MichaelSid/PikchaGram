require 'spec_helper'
describe 'deleting posts' do

	context 'logged out' do

		before { create(:post)} 

		describe 'attempting to delete posts' do
			it 'tells you to log in' do
				visit '/posts'
				click_link("Delete", :match => :first)

				expect(page).to have_content 'Sign in'
			end
		end

	end

	context 'logged in as Michael' do

		let(:michael) {create(:michael)}
		before do 
			login_as michael
		end

		describe 'attempting to delete kevin posts' do


			it 'displays an error' do
				kevin = create(:kevin)
				create(:post, user: kevin)
				visit '/posts'
				click_link("Delete", :match => :first)

				expect(page).to have_content 'Error'
			end
		end

		describe 'delete my own posts' do
			it 'removes the post' do
				create(:post, user: michael)

				visit '/posts'
				click_link("Delete", :match => :first)

				expect(page).to have_content 'Post successfully deleted'
				expect(page).not_to have_content 'Some awesome snap'
			end
		end

	end


end