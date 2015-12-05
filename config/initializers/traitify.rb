Traitify.configure do |traitify|
  traitify.public_key = ENV["TRAITIFY_PUBLIC"]
  traitify.secret_key = ENV["TRAITIFY_SECRET"]
  traitify.host = ENV["TRAITIFY_HOST"]
  traitify.version = "v1"
  traitify.deck_id = "fitness"
  traitify.image_pack = :linear
end
