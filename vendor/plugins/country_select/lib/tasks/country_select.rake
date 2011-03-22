namespace :countries do
  desc "Import all countries"
  task :import => :prepare do
    puts "Importing countries"
    Country.delete_all
    Geography::COUNTRIES.each do |name, code|
      puts name
      Country.create(:name => name, :code => code)
    end
    puts "\n", "*"*5, "Imported #{Country.count} countries", "\n"
  end
  
  desc "Create countries table"
  task :create => :prepare do
    CreateCountries.up
  end
  
  desc "Drop countries table"
  task :drop => :prepare do
    CreateCountries.down
  end
  
  desc "Create table and import all countries"
  task :setup => [:create, :import]
  
  task :prepare do
    require "#{Rails.root}/config/environment"
    require "active_record/migration"
    require "active_record/fixtures"
    
    class CreateCountries < ActiveRecord::Migration
      def self.up
        create_table :countries do |t|
          t.string :code, :name
        end

        add_index :countries, :code
        add_index :countries, :name
      end

      def self.down
        drop_table :countries
      end
    end
  end
end
