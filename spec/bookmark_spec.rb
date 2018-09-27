require 'bookmark'

describe Bookmark do
  subject(:bookmark) { described_class.new }

  describe '.all' do
    it 'returns all bookmarks' do
      add_testing_bookmarks_to_test_database
      bookmarks = Bookmark.all
      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
      expect(bookmarks).to include('http://www.google.com')
    end
  end
  
  describe '.create' do
    it 'adds a bookmark' do
      Bookmark.create('http://www.bbc.co.uk')
      bookmarks = Bookmark.all
      expect(bookmarks).to include('http://www.bbc.co.uk')
    end
  end
end
