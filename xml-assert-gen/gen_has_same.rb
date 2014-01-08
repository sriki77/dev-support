require('nokogiri')


def validate_args()
  abort "Usage: ruby gen_has_same.rb <input file>" unless ARGV.length==1
end

validate_args();

f = File.open(ARGV[0])
doc = Nokogiri::XML(f)

doc.traverse do |x| 
#hasSame("/consumer/consumer_id", kmsXmlPath),
  puts "hasSame(#{x.previous.path},kmsXmlPath)," if x.text? && x.previous!=nil && x.previous.elem?
end
