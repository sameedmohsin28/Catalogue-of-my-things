require_relative '../classes/music_album'

RSpec.describe MusicAlbum do
  describe '#can_be_archived?' do
    context 'when the music album is older than 10 years and not on Spotify' do
      it 'returns true' do
        album = MusicAlbum.new('2010-01-01', false)

        expect(album.can_be_archived?).to be true
      end
    end

    context 'when the music album is newer than 10 years' do
      it 'returns false' do
        album = MusicAlbum.new('2022-01-01', false)

        expect(album.can_be_archived?).to be false
      end
    end

    context 'when the music album is on Spotify' do
      it 'returns false' do
        album = MusicAlbum.new('2010-01-01', true)

        expect(album.can_be_archived?).to be false
      end
    end
  end
end
