class Building < ApplicationRecord
    attr_accessor :rooms, :floors
    enum subtype: {house: "house", complex: "complex", commercial: "commercial"}, _suffix: true
    has_one_attached :building_image
    validate :acceptable_image

    def acceptable_image
        return unless building_image.attached?

        unless building_image.byte_size <= 1.megabyte
            errors.add(:building_image, "is too big")
          end
        
          acceptable_types = ["image/jpg", "image/jpeg", "image/png"]
          unless acceptable_types.include?(building_image.content_type)
            errors.add(:building_image, "must be a JPEG or PNG")
          end
    end
end
