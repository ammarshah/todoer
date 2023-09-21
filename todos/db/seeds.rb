# START -> Create Taglines
taglines = [
  "1- Whaddaya want TODO?",
  "2- What do you want TODO?",
  "3- Whaddayou want TODO?",
  "4- Whatya want TODO?"
]

Tagline.delete_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE taglines_id_seq RESTART WITH 1")

taglines.each do |tagline|
  Tagline.create(text: tagline)
end
# END -> Create Taglines
