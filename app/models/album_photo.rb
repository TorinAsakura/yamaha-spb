class AlbumPhoto < ActiveRecord::Base
  belongs_to :album
  
  has_attached_file :image, :styles => {:big => "800x600", :thumb => "100x100"}
  def swfupload_file=(data)
    data.content_type = MIME::Types.type_for(data.original_filename).to_s
    self.image = data
  end  
end
