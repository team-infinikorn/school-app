# frozen_string_literal: true

User.first_or_create(email: 'john@doe.com', password: 'password')

if Course.count.zero?
  courses = [{ name: 'oop' }, { name: 'database' }, { name: 'data_structure' }, { name: 'operating_system' },
             { name: 'ruby_on_rails' }]
  Course.create!(courses)
end
