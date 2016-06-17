require 'nokogiri'

resource_path = ARGV[0]
def strip_vector_compat(resource_path)
  Dir.glob("#{resource_path}*.xml") do |rb_file|
    file = File.read(rb_file)
    doc = Nokogiri::XML(file)
    vectors = doc.search('vector') # find all tags with the node_name "vector"
    vectors.each do |vector|
      vector.delete('vc_viewportWidth')
      vector.delete('app')
      vector.delete('vc_viewportHeight')
    end
    groups = doc.search('group')
    groups.each do |group|
      group.delete('vc_translateX')
      group.delete('vc_translateY')
    end
    paths = doc.search('path')
    paths.each do |path|
      path.delete('vc_fillColor')
      path.delete('vc_pathData')
    end
    File.write(rb_file, doc.to_xml)
    puts "Processed #{rb_file}"
  end
end

if resource_path.nil?
  puts "Please provide the absolute path to your drawable directory as an argument"
else
  strip_vector_compat(resource_path)
end
