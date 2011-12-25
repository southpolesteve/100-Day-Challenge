# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Activity.destroy_all

Activity.create([ { name: 'alcohol', value: -20, unit: 'beverage' },
                  { name: 'biking', value: 10, unit: 'mile' },
                  { name: 'bad food', value: -20, unit: 'serving' },
                  { name: 'lunges', value: 2 },
                  { name: 'climbing', value: 1 },
                  { name: 'pullups', value: 5 },
                  { name: 'pushups', value: 2 },
                  { name: 'jump rope', value: 20, unit: 'minute' },
                  { name: 'running', value: 15, unit: 'mile' },
                  { name: 'situps', value: 1 },
                  { name: 'sports', value: 2, unit: 'minute' },
                  { name: 'stairs', value: 2, unit: 'flight' },
                  { name: 'swim', value: 4, unit: 'minute' },
                  { name: 'walking', value: 1, unit: 'minute' },
                  { name: 'weights', value: 1, unit: 'rep' },
                  { name: 'yoga', value: 4, unit: 'minute' }, ])