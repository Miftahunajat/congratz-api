class Banner < ApplicationRecord
    mount_base64_uploader :photo, ImagesUploader
end
