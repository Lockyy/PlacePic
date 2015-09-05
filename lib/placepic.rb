mydir = File.expand_path(File.dirname(__FILE__))

Dir[mydir + '/placepic/*.rb'].each {|file| require file }

module PlacePic
  ActionView::Base.send :include, PlacePic::Placeholders
end
