class Artist

    attr_accessor :name, :artist
    @@all = []

    def initialize (name)
        @name = name
    end

    def save
        @@all.push(self)
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.all
        @@all
    end

    def artist_name=(name)
        if (self.artist.nil?)
          self.artist = Artist.new(name)
        else
          self.artist.name = name
        end
      end

    def self.find_or_create_by_name(name)
            self.find(name) || self.create(name)
        end
      
        def self.find(name)
          self.all.detect { |artist| artist.name == name }
        end

        def self.create(name)
            artist = Artist.new(name)
            artist.save
            artist
          end
        
          def print_songs
            self.songs.each {|song| song.name}
          end
    
end