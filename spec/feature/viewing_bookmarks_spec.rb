feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page.status_code).to eq(200)
    expect(page).to have_content 'Bookmark Manager'
  end
end

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    add_testing_bookmarks_to_test_database
    visit('/bookmarks')
    expect(page.status_code).to eq(200)
    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://www.destroyallsoftware.com'
    expect(page).to have_content 'http://www.google.com'
  end
end
