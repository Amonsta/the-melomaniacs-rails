class Music < ApplicationRecord

    def self.new_from_spotify_song(spotify_song)
        Music.new(
          spotify_id: spotify_song.id,
          name: spotify_song.name,
          artist: spotify_song.artists[0].name,
          image: spotify_song.album.images[0]["url"],
          preview: spotify_song.preview_url
        )
    end

    def self.create_from_spotify_song(spotify_song)
        song = self.new_from_spotify_song(spotify_song)
        song.save
        song
    end
    
end
