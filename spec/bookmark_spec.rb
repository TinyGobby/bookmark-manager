require 'bookmark'

describe Bookmark do
  subject(:bookmark) { described_class.new }

  describe '.all' do
    it 'returns all bookmarks' do
      add_testing_bookmarks_to_test_database
      bookmarks = Bookmark.all
      expect(bookmarks).to include('Makers Academy')
      expect(bookmarks).to include('DESTROY ALL SOFTWARE!!!!11!!!!!')
      expect(bookmarks).to include('Google')
    end
  end

  describe '.create' do
    it 'adds a bookmark' do
      Bookmark.create('BBC', 'http://www.bbc.co.uk')
      bookmarks = Bookmark.all
      expect(bookmarks).to include('BBC')
    end

    it 'raises error when the url is incorrect' do
      Bookmark.create('fake title', 'fake url')
      expect(Bookmark.all).not_to include 'fake url'
    end
  end
end
