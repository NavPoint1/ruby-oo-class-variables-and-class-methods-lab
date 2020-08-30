require 'pry'

class Song

    attr_reader :name, :artist, :genre

    @@all = []
    @@count = 0
    @@artists = []
    @@genres = []

    def initialize(name, artist, genre)
        @name = name
        @artist = artist
        @genre = genre
        @@count += 1
        @@artists << artist
        @@genres << genre
        self.save
    end

    def save
        if !@@all.any? { |song| song.name == self.name }
            @@all << self
        end
    end

    def self.all
        @@all
    end

    def self.count
        self.all.size
    end

    def self.artists
        @@artists.uniq
    end

    def self.genres
        @@genres.uniq
    end

    def self.genre_count
        genre_hash = {}

        self.genres.each { |genre|
            genre_hash[genre] = 0
        }

        self.all.each { |song|
            genre_hash[song.genre] += 1
        }

        return genre_hash
    end

    def self.artist_count
        artist_hash = {}

        self.artists.each { |artist|
            artist_hash[artist] = 0
        }

        self.all.each { |song|
            artist_hash[song.artist] += 1
        }

        return artist_hash
    end
end