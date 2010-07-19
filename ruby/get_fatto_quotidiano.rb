#!/usr/bin/ruby
#
# Author: Mattia Gheda
# Title: get_fatto_quotidiano

# Description:
# Simple scripts that I've putted in my crontab, each day downloads 
# the pdf of my favourite newspaper

# Dependencies:
# Mechanize gem to scrape the pages

# Configuration:
# You need to have a valid user on fatto's website 
# FATTOUSER,FATTOPSW, DPATH have to be set

# License: see LICENSE 
# Simple script to download today's copy of FattoQuotidiano

require 'rubygems'

begin
    require 'mechanize'
    rescue LoadError
        $stderr.print "#{File.basename(__FILE__)} requires mechanize gem to work\nPlease install it with gem install mechanize\n"
    exit
end

# Il fatto website account data
FATTOUSER="thamayor@gmail.com"
FATTOPSW="condiviso"

# Download folder
DPATH = "./"

# visiting fatto's website
agent = Mechanize.new
page = agent.get 'http://www.ilfattoquotidiano.it/abbonati/'
login_page = agent.click(page.link_with(:href => /login/))

my_page = login_page.form_with(:name => "loginform") do |f|
    f.log = FATTOUSER
    f.pwd = FATTOPSW
end.click_button

now = DateTime.now
if now.wday == 1 #Monday
    puts "oggi niente fatto"
    exit 0
else
    today = sprintf("%d%02d%02d",now.year,now.month,now.day)
    pdf = agent.get "http://www.ilfattoquotidiano.it/openpdf/?n=#{today}"
    File.open("#{File.join(DPATH,today)}.pdf", "w") do |file|
        file << pdf.body
    end
end


