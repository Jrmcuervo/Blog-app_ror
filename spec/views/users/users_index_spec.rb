require 'rails_helper'

RSpec.feature 'User index page', type: :feature do
  scenario 'displays a list of users with their information' do
    user1 = User.create(name: 'Vilis', posts_counter: 23)
    user2 = User.create(name: 'John', posts_counter: 10)

    visit users_path

    within '.wrapper' do
      expect(page).to have_selector('ul li', count: 2)

      within page.find('ul li.userNameWrapper', match: :first) do
        expect(page).to have_css('img[alt="Profile P."]')
        expect(page).to have_link(user1.name, href: user_path(user1), class: 'userNameAnchor')
        expect(page).to have_content("Number of posts: #{user1.posts.count}")
      end

      within page.all('ul li.userNameWrapper').last do
        expect(page).to have_css('img[alt="Profile P."]')
        expect(page).to have_link(user2.name, href: user_path(user2), class: 'userNameAnchor')
        expect(page).to have_content("Number of posts: #{user2.posts.count}")
      end
    end
  end

  scenario 'redirects to user show page when clicking on a user link' do
    user1 = User.create(name: 'Vilis', posts_counter: 23)

    visit users_path

    within '.wrapper' do
      click_link(user1.name, href: user_path(user1), class: 'userNameAnchor')
    end

    expect(current_path).to eq(user_path(user1))
  end
end
