missing_thumbnail = File.open(Rails.root.join('test', 'fixtures', 'missing_thumbnail.png'))

Classified.create(title: 'Whitecaps Tickets', description: 'Section 46, row C, seats 1 and 2', image: missing_thumbnail)
Classified.create(title: 'Bike Trailer', description: 'Chariot Cougar 2, in good condition', image: missing_thumbnail)
Classified.create(title: 'iPhone 4', description: 'iPhone 4, 32G, white, no scratches', image: missing_thumbnail)
Classified.create(title: 'Mountain Bike', description: 'Brodie Bruzza 2012', image: missing_thumbnail)
Classified.create(title: 'Star Wars Blu-ray', description: 'The complete sage, 6 movies', image: missing_thumbnail)
