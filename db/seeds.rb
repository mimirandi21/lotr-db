# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require 'tsv'

    TSV_ROOT = Rails.root.join('db', 'seeds', 'tsv')
    file_name = "lotr-films.tsv"
    file_path = File.join(TSV_ROOT, file_name)

    TSV.parse_file(file_path).each do |line|
        begin
            
                Movie.create(line.to_h)
    
            
        rescue CSV::MalformedCSVError => er 
        puts er.message

        next
        end
    end

    TSV2_ROOT = Rails.root.join('db', 'seeds', 'tsv')
    file2_name = "lotr-peeps.tsv"
    file2_path = File.join(TSV2_ROOT, file2_name)
    
    TSV.parse_file(file2_path).each do |line|
        begin
            
                Person.create(line.to_h)
            
        rescue CSV::MalformedCSVError => er 
        puts er.message

        next
        end
    end

    TSV3_ROOT = Rails.root.join('db', 'seeds', 'tsv')
    file3_name = "lotr-hookup.tsv"
    file3_path = File.join(TSV3_ROOT, file3_name)
    
    TSV.parse_file(file3_path).each do |line|
        begin
            
                MoviePerson.create(line.to_h)
            
        rescue CSV::MalformedCSVError => er 
        puts er.message

        next
        end
    end