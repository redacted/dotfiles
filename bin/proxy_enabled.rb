#!/usr/bin/ruby

proxy = `networksetup -getwebproxy "Ethernet"`

settings = Hash[proxy.split("\n").map {|x| x.split(": ") }]

print "PROXIED" if settings['Enabled'] == 'Yes'
