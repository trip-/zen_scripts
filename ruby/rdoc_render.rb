#!/usr/bin/env ruby

#require 'github/markup'
require 'rdoc/markup/to_html'

if ARGV.length < 1
    warn 'usage rdoc_render.rb filename'
    exit 1
end
file = ARGV[0]
File.open(File.basename(file,".rdoc")+".html", 'w',File::CREAT) { |f|  
    f << RDoc::Markup::ToHtml.new.convert(File.read(file))
    #f << GitHub::Markup.render(file,File.read(file))
}


