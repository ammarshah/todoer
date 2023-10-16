# START -> Create Taglines
Tagline.delete_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE taglines_id_seq RESTART WITH 1")

require 'csv'
CSV.foreach(("#{Rails.root}/db/data/taglines.csv"), headers: true) do |row|
  Tagline.create(row)
end
# END -> Create Taglines
