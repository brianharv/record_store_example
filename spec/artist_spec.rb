require 'spec_helper'

describe '#Artist' do

  

  describe('.all') do
    it("returns an empty array when there are no artists") do
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves an Artist") do
      artist = Artist.new({:name => "Radiohead", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Blur", :id => nil})
      artist2.save()
      expect(Artist.all).to(eq([artist, artist2]))
    end
  end

  describe('.clear') do
    it("clears all Artists") do
      artist = Artist.new({:name => "Radiohead", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Blur", :id => nil})
      artist2.save()
      Artist.clear
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same Artist if it has the same attributes as another Artist") do
      artist = Artist.new({:name => "Blur", :id => nil})
      artist2 = Artist.new({:name => "Blur", :id => nil})
      expect(artist).to(eq(artist2))
    end
  end

  describe('.find') do
    it("finds an Artist by id") do
      artist = Artist.new({:name => "Radiohead", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Blur", :id => nil})
      artist2.save()
      expect(Artist.find(artist.id)).to(eq(artist))
    end
  end

  describe('#delete') do
    it("deletes an Artist by id") do
      artist = Artist.new({:name => "Radiohead", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Blur", :id => nil})
      artist2.save()
      artist.delete()
      expect(Artist.all).to(eq([artist2]))
    end
  end

  describe('#update') do
    it("adds an album to an artist") do
      artist = Artist.new({:name => "John Coltrane", :id => nil})
      artist.save()
      album = Album.new({:name => "A Love Supreme", :id => nil})
      album.save()
      artist.update({:album_name => "A Love Supreme"})
      expect(artist.albums).to(eq([album]))
    end
  end

end