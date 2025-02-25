if @listing.persisted?
  json.form render(partial: "listings/form", formats: :html, locals: {listing: Listing.new})
  json.inserted_item render(partial: "listings/listing", formats: :html, locals: {listing: @listing})
else
  json.form render(partial: "listings/form", formats: :html, locals: {listing: @listing})
end
