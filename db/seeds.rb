# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
services = [{:name => 'So Jealous Hair Design', :category => 'Hair Salon',:location=> '365 Harry L Dr, Johnson City, NY 13790', :rating => '4.8', :price=>'$$$'},
            {:name => 'Evolution Hair Design Salon and Barber Shop', :category => 'Hair Salon',:location=> '185 Vestal Ave, Binghamton, NY 13903', :rating => '4.5', :price=>'$$$'},
            {:name => 'Miracles Beauty Salon', :category => 'Beauty Salon',:location=> '157 Main St, Binghamton, NY 13905', :rating => '4.0', :price=>'$$'},
            {:name => 'Shuna\'s Hair Studio', :category => 'Hair Salon',:location=> '175 Clinton St, Binghamton, NY 13905', :rating => '4.9', :price=>'$$$$'},
            {:name => 'J K Salon & Spa', :category => 'Spa',:location=> '420-426 Court St, Binghamton, NY 13904', :rating => '4.8', :price=>'$$$$'},
            {:name => 'Tommy Nails', :category => 'Nail Salon',:location=> '2 W State St, Binghamton, NY 13901', :rating => '4.3', :price=>'$$$'},
            {:name => '4EVER Nails & Spa', :category => 'Nail Salon',:location=> '1185 Vestal Ave, Binghamton, NY 13903', :rating => '4.3', :price=>'$$$'},
            {:name => 'Pro Nails & Hair', :category => 'Nail Salon',:location=> '10 Glenwood Ave, #11, Binghamton, NY 13905', :rating => '3.6', :price=>'$$'},
      ]

services.each do |service|
    Service.create!(service)
end