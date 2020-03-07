class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :content, presence: true, unless: :image?
  mount_uploader :image, ImageUploader

  # def self.create_photos_by(photo_params)

  #   # /* そもそも一枚も上がってきてない時のためのvalidate */
  #     return false if photo_params[:content].nil?
    
  #   # /* 途中でエラった時にRollbackするようにTransaction */
  #     Photo.transaction do 
    
  #   # /* アップロードされた画像を一枚ずつ処理 */
  #       message_params[:content].each do |photo|
  #         new_photo = Message.new(title: message_params[:image], content: photo)
  #         return false unless new_photo.save!
  #       end
  #     end
    
  #     true
  #   end
    

  
end
