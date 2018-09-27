feature 'Adding bookmarks' do
  scenario 'A user can add bookmarks' do
    visit('/bookmarks')
    expect(page.status_code).to eq(200)
    fill_in('url', with: 'http://www.bbc.co.uk')
    click_button('Add Bookmark')
    expect(page.status_code).to eq(200)
    expect(page).to have_content 'http://www.bbc.co.uk'
  end

  scenario 'A user enters an incorrect url' do
    visit('/bookmarks')
    expect(page.status_code).to eq(200)
    fill_in('url', with: 'fake url')
    click_button('Add Bookmark')
    expect(page.status_code).to eq(200)
    expect(page).to have_content 'Incorrect URL'
  end
end
