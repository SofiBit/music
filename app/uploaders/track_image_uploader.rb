class TrackImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
