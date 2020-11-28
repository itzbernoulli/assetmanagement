class Building < ApplicationRecord
    attr_accessor :rooms, :floors
    enum subtype: {house: "house", complex: "complex", commercial: "commercial"}, _suffix: true
end
