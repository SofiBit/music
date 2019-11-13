class PlaylistImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
