class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
     self.artist ? self.artist.name : nil
  end

  def notes_content=(notes)
    song_notes = []
    notes.each do |note|
      song_notes << Note.new(content: note) unless note.blank?
    end
    self.notes = song_notes
  end
end
