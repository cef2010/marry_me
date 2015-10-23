module MapHashBuilder
  extend ActiveSupport::Concern

  def hash_on_index(vendor_array)
    hash = Gmaps4rails.build_markers(vendor_array) do |vendor, marker|
      if vendor.latitude != nil
        marker.lat vendor.latitude
        marker.lng vendor.longitude
        marker.infowindow "<a href='/vendors/#{vendor.id}'>#{vendor.name}</a>, #{vendor.category}"
      end
    end
    hash.each do |h|
      if h == {}
        hash.delete(h)
      end
    end
    hash
  end

  def build_hash(single_vendor)
    hash = Gmaps4rails.build_markers(single_vendor) do |vendor, marker|
      if vendor.latitude != nil
        marker.lat vendor.latitude
        marker.lng vendor.longitude
        marker.infowindow "<a href='/vendors/#{vendor.id}'>#{vendor.name}</a>, #{vendor.category}"
      end
    end
    hash.each do |h|
      if h == {}
        hash.delete(h)
      end
    end
    hash
  end
end
