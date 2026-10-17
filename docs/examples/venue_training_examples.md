# Venue & Training Model Examples

This file contains practical examples for venue, court, trainer, and training-related models in Playo.

## Venue Model Examples

### Tennis Club Example

```dart
// Premium Tennis Club
final premiumTennisClub = Venue(
  id: 'venue_mumbai_tennis_premium_001',
  ownerId: 'usr_venue_owner_123',
  name: 'Mumbai Elite Tennis Academy',
  description: 'State-of-the-art tennis facility with 12 courts, professional coaching, and modern amenities.',
  address: '123 Worli Sea Face, Mumbai, Maharashtra 400018',
  city: 'Mumbai',
  state: 'Maharashtra',
  country: 'India',
  zipCode: '400018',
  latitude: 19.0176,
  longitude: 72.8118,
  phone: '+91-22-6789-1234',
  email: 'info@mumbaitennis.com',
  website: 'https://mumbaitennis.com',
  images: [
    'https://venue-images.com/court-view.jpg',
    'https://venue-images.com/clubhouse.jpg',
    'https://venue-images.com/pro-shop.jpg',
    'https://venue-images.com/parking.jpg'
  ],
  primaryImage: 'https://venue-images.com/main-entrance.jpg',
  sportIds: ['sport_tennis'],
  type: VenueType.indoor,
  
  // Amenities
  amenities: [
    'Parking (200 cars)',
    'Restrooms & Showers',
    'Cafeteria & Restaurant',
    'Pro Shop',
    'Locker Rooms',
    'Air Conditioning',
    'WiFi',
    'Equipment Rental'
  ],
  
  // Facilities
  facilities: [
    '12 Tennis Courts',
    'Professional Lighting',
    'Sound System',
    'Electronic Scoreboards',
    'Ball Machines',
    'Practice Wall',
    'Fitness Center',
    'Physiotherapy Room'
  ],
  
  // Equipment
  equipment: [
    'Tennis Balls (Wilson, Babolat)',
    'Racket Rental (All Brands)',
    'String Services',
    'Ball Machines',
    'Training Aids'
  ],
  
  // Rules
  rules: [
    'Proper tennis attire required (whites preferred)',
    'Non-marking tennis shoes mandatory',
    'Court bookings must be honored',
    'No outside food in courts',
    'Mobile phones on silent mode',
    'Coaching only by certified professionals'
  ],
  
  // Business Details
  operatingHours: {
    'monday': '06:00-22:00',
    'tuesday': '06:00-22:00',
    'wednesday': '06:00-22:00',
    'thursday': '06:00-22:00',
    'friday': '06:00-22:00',
    'saturday': '06:00-23:00',
    'sunday': '06:00-23:00'
  },
  
  rating: 4.8,
  totalReviews: 245,
  isActive: true,
  isVerified: true,
  allowsOnlineBooking: true,
  cancellationHours: 24.0,
  
  // Pricing
  baseHourlyRate: 2500.0,
  peakHourMultiplier: 1.5,
  currency: 'INR',
  
  // Policies
  paymentMethods: ['Card', 'UPI', 'Cash', 'Net Banking'],
  cancellationPolicy: 'Full refund if cancelled 24 hours in advance',
  
  tags: ['premium', 'coaching-available', 'tournaments', 'air-conditioned'],
  
  createdAt: DateTime.now(),
);

// Community Badminton Hall
final communityBadmintonHall = Venue(
  id: 'venue_bangalore_badminton_community_001',
  ownerId: 'usr_venue_owner_456',
  name: 'Koramangala Community Badminton Hall',
  description: 'Affordable badminton facility for the community. 6 courts with good lighting.',
  address: '78 Community Center, Koramangala 5th Block, Bangalore, Karnataka 560095',
  city: 'Bangalore',
  state: 'Karnataka',
  country: 'India',
  zipCode: '560095',
  latitude: 12.9352,
  longitude: 77.6245,
  phone: '+91-80-4567-8901',
  email: 'bookings@koramangalabadminton.com',
  sportIds: ['sport_badminton'],
  type: VenueType.indoor,
  
  amenities: [
    'Parking (50 bikes, 20 cars)',
    'Drinking Water',
    'Restrooms',
    'Seating Area',
    'Equipment Storage'
  ],
  
  facilities: [
    '6 Badminton Courts',
    'LED Lighting',
    'Wooden Flooring',
    'Net Systems',
    'Scoreboard'
  ],
  
  equipment: [
    'Shuttlecocks (Yonex)',
    'Racket Rental',
    'First Aid Kit'
  ],
  
  rules: [
    'Non-marking shoes mandatory',
    'Court time strictly enforced',
    'Clean up after play',
    'No smoking or alcohol',
    'Advance booking recommended'
  ],
  
  operatingHours: {
    'monday': '06:00-22:00',
    'tuesday': '06:00-22:00',
    'wednesday': '06:00-22:00',
    'thursday': '06:00-22:00',
    'friday': '06:00-22:00',
    'saturday': '06:00-23:00',
    'sunday': '07:00-22:00'
  },
  
  rating: 4.2,
  totalReviews: 89,
  isActive: true,
  isVerified: true,
  allowsOnlineBooking: true,
  cancellationHours: 4.0,
  
  baseHourlyRate: 800.0,
  currency: 'INR',
  
  tags: ['community', 'affordable', 'family-friendly'],
  
  createdAt: DateTime.now(),
);

// Outdoor Football Ground
final footballGround = Venue(
  id: 'venue_delhi_football_ground_001',
  ownerId: 'usr_venue_owner_789',
  name: 'Delhi Sports Complex Football Ground',
  description: 'Full-size football ground with natural grass. Perfect for tournaments and practice.',
  address: 'Jawaharlal Nehru Stadium Complex, New Delhi, Delhi 110003',
  city: 'New Delhi',
  state: 'Delhi',
  country: 'India',
  zipCode: '110003',
  latitude: 28.5706,
  longitude: 77.2335,
  phone: '+91-11-2345-6789',
  email: 'bookings@delhisportscomplex.com',
  website: 'https://delhisportscomplex.gov.in',
  sportIds: ['sport_football', 'sport_soccer'],
  type: VenueType.outdoor,
  
  facilities: [
    'Full-size football field (105m x 68m)',
    'Natural grass surface',
    'Professional goalposts',
    'Floodlights',
    'Electronic scoreboard',
    'Changing rooms',
    'Spectator stands (500 capacity)'
  ],
  
  amenities: [
    'Parking (100 cars)',
    'Restrooms & Showers',
    'Canteen',
    'First Aid Station',
    'Security',
    'Equipment Storage'
  ],
  
  equipment: [
    'Match footballs',
    'Training cones',
    'Goal nets',
    'Corner flags',
    'Linesman flags'
  ],
  
  rules: [
    'Football boots with appropriate studs',
    'Shin guards mandatory',
    'No unauthorized personnel on field',
    'Respect referee decisions',
    'Clean facilities after use'
  ],
  
  operatingHours: {
    'monday': '06:00-21:00',
    'tuesday': '06:00-21:00',
    'wednesday': '06:00-21:00',
    'thursday': '06:00-21:00',
    'friday': '06:00-21:00',
    'saturday': '06:00-22:00',
    'sunday': '06:00-22:00'
  },
  
  rating: 4.5,
  totalReviews: 156,
  isActive: true,
  isVerified: true,
  allowsOnlineBooking: true,
  cancellationHours: 48.0,
  
  baseHourlyRate: 5000.0,
  currency: 'INR',
  
  tags: ['tournament-grade', 'natural-grass', 'professional'],
  
  createdAt: DateTime.now(),
);
```

## Court Model Examples

```dart
// Tennis Courts
final centerCourt = Court(
  id: 'court_tennis_center_001',
  venueId: 'venue_mumbai_tennis_premium_001',
  name: 'Center Court',
  description: 'Main tournament court with stadium seating and professional equipment',
  sportId: 'sport_tennis',
  type: CourtType.tournament,
  surface: 'Hard Court (Acrylic)',
  dimensions: '23.77m x 10.97m',
  
  features: [
    'Stadium seating (200 people)',
    'Professional LED lighting',
    'Electronic scoreboard',
    'Sound system',
    'TV broadcast setup',
    'Chair umpire seat',
    'Ball boy stations'
  ],
  
  equipment: [
    'Professional net system',
    'Rolex clocks',
    'Hawkeye line calling',
    'Wilson match balls'
  ],
  
  isActive: true,
  isBookable: true,
  
  // Pricing
  hourlyRate: 4000.0,
  peakHourRate: 6000.0,
  currency: 'INR',
  
  // Peak hours definition
  peakHours: [
    '17:00-22:00', // Evening
    '06:00-09:00'  // Morning
  ],
  
  bookingRules: [
    'Minimum 1 hour booking',
    'Maximum 3 hours per booking',
    'Proper tennis attire required',
    'Professional matches only'
  ],
  
  createdAt: DateTime.now(),
);

final practiceCourtA = Court(
  id: 'court_tennis_practice_a_002',
  venueId: 'venue_mumbai_tennis_premium_001',
  name: 'Practice Court A',
  description: 'Standard practice court with good lighting',
  sportId: 'sport_tennis',
  type: CourtType.practice,
  surface: 'Hard Court (Acrylic)',
  dimensions: '23.77m x 10.97m',
  
  features: [
    'LED lighting',
    'Basic scoreboard',
    'Bench seating (20 people)',
    'Practice wall nearby'
  ],
  
  equipment: [
    'Standard net system',
    'Court brush',
    'Practice balls'
  ],
  
  isActive: true,
  isBookable: true,
  
  hourlyRate: 2500.0,
  peakHourRate: 3500.0,
  currency: 'INR',
  
  bookingRules: [
    'Minimum 1 hour booking',
    'Coaching sessions allowed',
    'Practice matches welcome'
  ],
  
  createdAt: DateTime.now(),
);

// Badminton Courts
final badmintonCourt1 = Court(
  id: 'court_badminton_001',
  venueId: 'venue_bangalore_badminton_community_001',
  name: 'Court 1',
  description: 'Main badminton court with excellent lighting',
  sportId: 'sport_badminton',
  type: CourtType.standard,
  surface: 'Wooden Flooring',
  dimensions: '13.4m x 6.1m',
  
  features: [
    'LED lighting (minimum 500 lux)',
    'Wooden flooring',
    'Clear court markings',
    'Good ventilation'
  ],
  
  equipment: [
    'Badminton net (standard height)',
    'Post system',
    'Court mats'
  ],
  
  isActive: true,
  isBookable: true,
  
  hourlyRate: 800.0,
  currency: 'INR',
  
  bookingRules: [
    'Non-marking shoes mandatory',
    'Maximum 4 players',
    'Shuttlecocks provided'
  ],
  
  createdAt: DateTime.now(),
);

// Swimming Pool Lanes
final lane1 = Court(
  id: 'lane_swimming_001',
  venueId: 'venue_mumbai_pool_001',
  name: 'Lane 1 - Fast Lane',
  description: '50m Olympic standard lane for advanced swimmers',
  sportId: 'sport_swimming',
  type: CourtType.professional,
  surface: 'Olympic Pool (50m)',
  dimensions: '50m x 2.5m',
  
  features: [
    'Lane ropes',
    'Starting blocks',
    'Pace clock',
    'Underwater lighting'
  ],
  
  equipment: [
    'Kickboards',
    'Pull buoys',
    'Pace clock',
    'Lane dividers'
  ],
  
  isActive: true,
  isBookable: true,
  
  hourlyRate: 500.0,
  currency: 'INR',
  
  bookingRules: [
    'Swimming attire required',
    'Shower before entering',
    'Follow lane etiquette',
    'Maximum speed swimming'
  ],
  
  createdAt: DateTime.now(),
);
```

## Venue Booking Examples

```dart
// Tennis Court Booking - Tournament
final tournamentBooking = VenueBooking(
  id: 'booking_tennis_tournament_001',
  venueId: 'venue_mumbai_tennis_premium_001',
  courtId: 'court_tennis_center_001',
  userId: 'usr_tournament_organizer_123',
  sportId: 'sport_tennis',
  bookingStatus: BookingStatus.confirmed,
  bookingType: BookingType.tournament,
  
  // Timing
  startTime: DateTime.now().add(Duration(days: 30, hours: 9)),
  endTime: DateTime.now().add(Duration(days: 30, hours: 18)),
  
  // Participants
  organizerName: 'Mumbai Tennis Association',
  organizerPhone: '+91-22-1234-5678',
  participantIds: [], // Will be filled as tournament entries come in
  expectedParticipants: 32,
  
  // Purpose and Details
  purpose: 'Mumbai Open Tennis Championship 2024',
  eventType: 'tournament',
  description: 'Annual tennis championship featuring top players from Mumbai',
  
  // Pricing
  totalAmount: 50000.0,
  currency: 'INR',
  
  // Payment
  isPaid: true,
  paidAt: DateTime.now(),
  paymentId: 'pay_tournament_001',
  
  // Special Requirements
  specialRequirements: [
    'Professional umpires needed',
    'Live streaming setup',
    'Trophy ceremony area',
    'VIP seating arrangement',
    'Catering for 100 guests'
  ],
  
  // Equipment
  equipmentRequested: [
    'Professional sound system',
    'Electronic scoreboard',
    'Hawkeye system',
    'Championship nets',
    'Tournament balls (100 cans)'
  ],
  
  isRecurring: false,
  
  createdAt: DateTime.now(),
);

// Regular Practice Session Booking
final practiceBooking = VenueBooking(
  id: 'booking_tennis_practice_002',
  venueId: 'venue_mumbai_tennis_premium_001',
  courtId: 'court_tennis_practice_a_002',
  userId: 'usr_player_123',
  sportId: 'sport_tennis',
  bookingStatus: BookingStatus.confirmed,
  bookingType: BookingType.hourly,
  
  startTime: DateTime.now().add(Duration(days: 2, hours: 18)),
  endTime: DateTime.now().add(Duration(days: 2, hours: 20)),
  
  participantIds: ['usr_player_123', 'usr_player_456'],
  expectedParticipants: 2,
  
  purpose: 'Practice session',
  description: 'Singles practice match between friends',
  
  totalAmount: 5000.0, // 2 hours at peak time
  currency: 'INR',
  
  isPaid: true,
  paidAt: DateTime.now(),
  paymentId: 'pay_practice_001',
  
  equipmentRequested: [
    'Tennis balls (2 cans)',
    'Court brush',
    'Towels'
  ],
  
  isRecurring: false,
  
  notes: 'Regular weekly booking for the next 3 months',
  
  createdAt: DateTime.now(),
);

// Recurring Badminton Club Booking
final recurringBadmintonBooking = VenueBooking(
  id: 'booking_badminton_club_003',
  venueId: 'venue_bangalore_badminton_community_001',
  courtId: 'court_badminton_001',
  userId: 'usr_club_organizer_789',
  sportId: 'sport_badminton',
  bookingStatus: BookingStatus.confirmed,
  bookingType: BookingType.recurring,
  
  startTime: DateTime.now().add(Duration(days: 1, hours: 19)),
  endTime: DateTime.now().add(Duration(days: 1, hours: 21)),
  
  organizerName: 'Koramangala Badminton Club',
  participantIds: [
    'usr_player_101', 'usr_player_102', 'usr_player_103', 'usr_player_104'
  ],
  expectedParticipants: 8,
  
  purpose: 'Weekly club practice',
  description: 'Regular club practice session for members',
  
  totalAmount: 1600.0, // 2 hours
  currency: 'INR',
  
  isPaid: true,
  paidAt: DateTime.now(),
  
  // Recurring details
  isRecurring: true,
  recurringPattern: 'weekly',
  recurringEndDate: DateTime.now().add(Duration(days: 90)),
  recurringDays: ['Tuesday'],
  
  equipmentRequested: [
    'Shuttlecocks (6 pieces)',
    'Scoresheets',
    'First aid kit'
  ],
  
  createdAt: DateTime.now(),
);
```

## Trainer Model Examples

```dart
// Professional Tennis Coach
final tennisCoach = Trainer(
  id: 'trainer_tennis_pro_001',
  userId: 'usr_trainer_tennis_123',
  businessName: 'Elite Tennis Academy',
  tagline: 'Professional Tennis Coach - Former National Player',
  
  bio: '''Former national tennis player with 15+ years of coaching experience. 
Specialized in developing technique, strategy, and mental toughness. 
Has coached players to state and national championships.
Available for individual and group coaching sessions.''',
  
  // Sport specialization
  sportIds: ['sport_tennis'],
  specializations: [
    'Technique Development',
    'Match Strategy',
    'Mental Coaching',
    'Junior Development',
    'Tournament Preparation',
    'Serve and Return',
    'Footwork and Movement'
  ],
  
  // Credentials
  certifications: [
    'PTR Professional (Professional Tennis Registry)',
    'ITF Level 3 Coach',
    'Sports Psychology Certificate',
    'First Aid & CPR Certified'
  ],
  
  qualifications: [
    'Bachelor in Sports Science',
    'National Tennis Academy Graduate',
    'Former State Champion (2008-2012)',
    'Davis Cup Squad Member (2010)'
  ],
  
  // Experience
  yearsOfExperience: 15,
  type: TrainerType.individual,
  
  // Service Areas
  serviceAreas: ['Mumbai', 'Navi Mumbai', 'Thane'],
  venueIds: [
    'venue_mumbai_tennis_premium_001',
    'venue_mumbai_tennis_club_002'
  ],
  
  // Target Audience
  audienceTypes: ['Adults', 'Juniors (12+)', 'Professionals', 'Beginners'],
  skillLevelsOffered: ['Beginner', 'Intermediate', 'Advanced', 'Professional'],
  
  // Pricing
  hourlyRate: 4000.0,
  currency: 'INR',
  packageRates: {
    '5_sessions': 18000.0,
    '10_sessions': 35000.0,
    '20_sessions': 65000.0
  },
  
  // Availability
  availabilitySchedule: {
    'monday': ['06:00-09:00', '17:00-21:00'],
    'tuesday': ['06:00-09:00', '17:00-21:00'],
    'wednesday': ['06:00-09:00', '17:00-21:00'],
    'thursday': ['06:00-09:00', '17:00-21:00'],
    'friday': ['06:00-09:00', '17:00-21:00'],
    'saturday': ['06:00-12:00', '14:00-20:00'],
    'sunday': ['07:00-12:00', '15:00-19:00']
  },
  
  // Performance
  rating: 4.9,
  totalReviews: 127,
  totalStudents: 89,
  completedSessions: 1250,
  
  // Communication
  languagesSpoken: ['English', 'Hindi', 'Marathi'],
  communicationPreference: 'WhatsApp',
  
  // Professional Details
  experienceHighlights: [
    'Coached 15 state-level champions',
    'Developed 3 national-level juniors',
    'Team coach for Mumbai Tennis Association',
    'Featured in Tennis World Magazine'
  ],
  
  teachingPhilosophy: '''Believe in building strong fundamentals while keeping the learning process enjoyable. 
Focus on each student\'s individual strengths and work systematically on improvement areas.
Mental toughness and strategic thinking are as important as physical technique.''',
  
  isAvailable: true,
  isVerified: true,
  
  profileImageUrl: 'https://trainer-images.com/tennis_coach_123.jpg',
  portfolioImages: [
    'https://trainer-images.com/coaching_action.jpg',
    'https://trainer-images.com/student_success.jpg',
    'https://trainer-images.com/certification.jpg'
  ],
  
  // Contact
  socialLinks: {
    'instagram': '@elitetennisacademy',
    'youtube': 'EliteTennisCoaching',
    'linkedin': 'in/tennis-coach-mumbai'
  },
  
  createdAt: DateTime.now(),
);

// Badminton Academy Trainer
final badmintonTrainer = Trainer(
  id: 'trainer_badminton_academy_002',
  userId: 'usr_trainer_badminton_456',
  businessName: 'Bangalore Badminton Academy',
  tagline: 'Professional Badminton Coach & Former International Player',
  
  bio: '''International badminton player turned coach with expertise in 
doubles strategy and junior development. Known for systematic training 
methods and excellent results in competitive coaching.''',
  
  sportIds: ['sport_badminton'],
  specializations: [
    'Doubles Strategy',
    'Junior Development',
    'Tournament Preparation',
    'Technical Skills',
    'Fitness Training',
    'Smash Technique'
  ],
  
  certifications: [
    'BWF Level 2 Coach',
    'SAI Certified Coach',
    'Shuttle Time Tutor',
    'Sports Medicine Certificate'
  ],
  
  qualifications: [
    'International Player (2015-2018)',
    'National Champion Doubles (2016)',
    'Asian Games Participant (2018)',
    'Masters in Sports Management'
  ],
  
  yearsOfExperience: 8,
  type: TrainerType.academy,
  
  serviceAreas: ['Bangalore', 'Electronic City', 'Whitefield'],
  venueIds: [
    'venue_bangalore_badminton_community_001',
    'venue_bangalore_badminton_academy_002'
  ],
  
  audienceTypes: ['Juniors (8-18)', 'Adults', 'Competitive Players'],
  skillLevelsOffered: ['Beginner', 'Intermediate', 'Advanced'],
  
  hourlyRate: 2500.0,
  currency: 'INR',
  packageRates: {
    '8_sessions': 18000.0,
    '16_sessions': 34000.0,
    '32_sessions': 64000.0
  },
  
  rating: 4.7,
  totalReviews: 84,
  totalStudents: 156,
  completedSessions: 890,
  
  languagesSpoken: ['English', 'Hindi', 'Kannada', 'Tamil'],
  
  isAvailable: true,
  isVerified: true,
  
  createdAt: DateTime.now(),
);

// Swimming Coach
final swimmingCoach = Trainer(
  id: 'trainer_swimming_003',
  userId: 'usr_trainer_swimming_789',
  businessName: 'AquaFit Swimming Academy',
  tagline: 'Professional Swimming Instructor - All Strokes & Ages',
  
  bio: '''Certified swimming instructor with specialization in stroke correction 
and competitive swimming. Experience with beginners to advanced swimmers.
Focus on water safety and proper technique development.''',
  
  sportIds: ['sport_swimming'],
  specializations: [
    'Stroke Technique',
    'Water Safety',
    'Competitive Swimming',
    'Adult Learn-to-Swim',
    'Kids Swimming',
    'Triathlon Training'
  ],
  
  certifications: [
    'Swimming Australia Certified',
    'Water Safety Instructor',
    'CPR & First Aid Certified',
    'Competitive Coaching License'
  ],
  
  qualifications: [
    'Bachelor in Aquatic Sciences',
    'Former State Swimmer',
    '10+ years teaching experience'
  ],
  
  yearsOfExperience: 12,
  type: TrainerType.individual,
  
  serviceAreas: ['Mumbai', 'Bandra', 'Juhu'],
  venueIds: ['venue_mumbai_pool_001'],
  
  audienceTypes: ['Kids (5+)', 'Adults', 'Seniors', 'Competitive Swimmers'],
  skillLevelsOffered: ['Beginner', 'Intermediate', 'Advanced', 'Competitive'],
  
  hourlyRate: 2000.0,
  currency: 'INR',
  
  rating: 4.8,
  totalReviews: 156,
  totalStudents: 234,
  completedSessions: 1580,
  
  languagesSpoken: ['English', 'Hindi', 'Marathi'],
  
  isAvailable: true,
  isVerified: true,
  
  createdAt: DateTime.now(),
);
```

## Training Service Examples

```dart
// One-on-One Tennis Coaching
final oneOnOneTennis = TrainingService(
  id: 'service_tennis_1on1_001',
  trainerId: 'trainer_tennis_pro_001',
  sportId: 'sport_tennis',
  
  name: 'Private Tennis Coaching',
  description: 'Personalized one-on-one tennis coaching focused on technique improvement and strategic development',
  
  serviceType: ServiceType.oneOnOne,
  duration: 60, // minutes
  price: 4000.0,
  currency: 'INR',
  
  maxParticipants: 1,
  skillLevels: ['Beginner', 'Intermediate', 'Advanced'],
  ageGroups: ['Juniors (12+)', 'Adults', 'Seniors'],
  
  equipmentProvided: [
    'Tennis balls',
    'Cones and markers',
    'Training aids',
    'Video analysis'
  ],
  
  equipmentRequired: [
    'Tennis racket',
    'Tennis shoes',
    'Comfortable sportswear',
    'Water bottle'
  ],
  
  sessionStructure: [
    'Warm-up and stretching (10 mins)',
    'Technique drills (20 mins)',
    'Live ball practice (20 mins)',
    'Match play simulation (10 mins)'
  ],
  
  learningOutcomes: [
    'Improved stroke technique',
    'Better court positioning',
    'Enhanced match strategy',
    'Increased consistency'
  ],
  
  location: 'Client preferred court or Mumbai Tennis Academy',
  
  cancellationPolicy: 'Free cancellation 24 hours in advance',
  reschedulePolicy: 'Can reschedule up to 2 times per month',
  
  isActive: true,
  
  createdAt: DateTime.now(),
);

// Group Badminton Training
final groupBadminton = TrainingService(
  id: 'service_badminton_group_002',
  trainerId: 'trainer_badminton_academy_002',
  sportId: 'sport_badminton',
  
  name: 'Group Badminton Training',
  description: 'Small group badminton coaching focusing on doubles strategy and competitive play',
  
  serviceType: ServiceType.groupClass,
  duration: 90,
  price: 1500.0,
  currency: 'INR',
  
  maxParticipants: 6,
  skillLevels: ['Intermediate', 'Advanced'],
  ageGroups: ['Juniors (12+)', 'Adults'],
  
  equipmentProvided: [
    'Shuttlecocks',
    'Training aids',
    'Court booking',
    'Performance tracking'
  ],
  
  equipmentRequired: [
    'Badminton racket',
    'Non-marking shoes',
    'Comfortable clothes'
  ],
  
  sessionStructure: [
    'Warm-up and mobility (15 mins)',
    'Skill drills (30 mins)',
    'Doubles practice (30 mins)',
    'Match play (15 mins)'
  ],
  
  learningOutcomes: [
    'Advanced shot techniques',
    'Doubles coordination',
    'Court coverage',
    'Tactical awareness'
  ],
  
  location: 'Bangalore Badminton Academy',
  
  packageOptions: [
    {
      'sessions': 8,
      'price': 10000.0,
      'validity': '2 months'
    },
    {
      'sessions': 16,
      'price': 18000.0,
      'validity': '4 months'
    }
  ],
  
  isActive: true,
  
  createdAt: DateTime.now(),
);

// Swimming Stroke Clinic
final strokeClinic = TrainingService(
  id: 'service_swimming_clinic_003',
  trainerId: 'trainer_swimming_003',
  sportId: 'sport_swimming',
  
  name: 'Swimming Stroke Clinic',
  description: 'Intensive stroke technique workshop for swimmers looking to perfect their form',
  
  serviceType: ServiceType.workshop,
  duration: 120,
  price: 2500.0,
  currency: 'INR',
  
  maxParticipants: 8,
  skillLevels: ['Intermediate', 'Advanced'],
  ageGroups: ['Adults'],
  
  equipmentProvided: [
    'Kickboards',
    'Pull buoys',
    'Fins',
    'Video analysis',
    'Stroke analysis report'
  ],
  
  equipmentRequired: [
    'Swimsuit',
    'Goggles',
    'Swimming cap'
  ],
  
  sessionStructure: [
    'Stroke assessment (20 mins)',
    'Technique breakdown (30 mins)',
    'Drill practice (40 mins)',
    'Video review (30 mins)'
  ],
  
  learningOutcomes: [
    'Perfect stroke technique',
    'Improved efficiency',
    'Faster times',
    'Injury prevention'
  ],
  
  location: 'Mumbai Aquatic Center',
  
  specialFeatures: [
    'Underwater video analysis',
    'Personalized improvement plan',
    'Follow-up session included'
  ],
  
  isActive: true,
  
  createdAt: DateTime.now(),
);
```

## Training Session Examples

```dart
// Scheduled Tennis Lesson
final tennisLesson = TrainingSession(
  id: 'session_tennis_001',
  serviceId: 'service_tennis_1on1_001',
  trainerId: 'trainer_tennis_pro_001',
  studentId: 'usr_student_123',
  
  sessionStatus: SessionStatus.scheduled,
  
  scheduledAt: DateTime.now().add(Duration(days: 2, hours: 18)),
  endsAt: DateTime.now().add(Duration(days: 2, hours: 19)),
  
  location: 'Mumbai Tennis Academy - Court 3',
  venueId: 'venue_mumbai_tennis_premium_001',
  courtId: 'court_tennis_practice_a_002',
  
  sessionType: 'technique_focus',
  skillLevel: 'intermediate',
  
  objectives: [
    'Improve backhand consistency',
    'Work on net approach',
    'Practice serving under pressure'
  ],
  
  notes: '''Student has been struggling with backhand down the line. 
Focus on grip position and follow-through. 
Also work on approach shots and volleying.''',
  
  amount: 4000.0,
  currency: 'INR',
  
  isPaid: true,
  paidAt: DateTime.now(),
  paymentId: 'pay_lesson_001',
  
  equipment: [
    'Tennis balls (new can)',
    'Cones for drills',
    'Video camera for analysis'
  ],
  
  weatherConditions: 'Clear, 26°C',
  
  createdAt: DateTime.now(),
);

// Completed Badminton Session with Feedback
final completedBadmintonSession = TrainingSession(
  id: 'session_badminton_002',
  serviceId: 'service_badminton_group_002',
  trainerId: 'trainer_badminton_academy_002',
  studentId: 'usr_student_456',
  
  sessionStatus: SessionStatus.completed,
  
  scheduledAt: DateTime.now().subtract(Duration(days: 1, hours: 2)),
  endsAt: DateTime.now().subtract(Duration(days: 1, hours: 0, minutes: 30)),
  completedAt: DateTime.now().subtract(Duration(days: 1)),
  
  location: 'Bangalore Badminton Academy - Court 1',
  venueId: 'venue_bangalore_badminton_community_001',
  
  sessionType: 'doubles_strategy',
  skillLevel: 'intermediate',
  
  objectives: [
    'Doubles positioning',
    'Net play improvement',
    'Communication on court'
  ],
  
  actualDuration: 85, // slightly shorter than planned
  
  // Post-session data
  performanceRating: 4.2,
  effortLevel: 8, // out of 10
  improvementAreas: [
    'Overhead shots',
    'Court coverage',
    'Quick reactions at net'
  ],
  
  strengthsObserved: [
    'Good footwork',
    'Excellent drop shots',
    'Strong defensive play'
  ],
  
  trainerFeedback: '''Great session! Student showed significant improvement in net play. 
Doubles coordination is getting better. Need to work on overhead power and placement.
Recommend practicing quick exchanges at the net.''',
  
  studentFeedback: '''Really enjoyed the session. Coach explained doubles strategy very clearly. 
Feel more confident at the net now. Looking forward to next session.''',
  
  homeworkAssigned: [
    'Practice 50 overhead shots daily',
    'Watch doubles strategy videos',
    'Work on quick feet ladder drills'
  ],
  
  nextSessionGoals: [
    'Power smashes',
    'Advanced doubles tactics',
    'Tournament preparation'
  ],
  
  amount: 1500.0,
  currency: 'INR',
  isPaid: true,
  
  createdAt: DateTime.now().subtract(Duration(days: 2)),
);

// Swimming Assessment Session
final swimmingAssessment = TrainingSession(
  id: 'session_swimming_assessment_003',
  serviceId: 'service_swimming_clinic_003',
  trainerId: 'trainer_swimming_003',
  studentId: 'usr_student_789',
  
  sessionStatus: SessionStatus.inProgress,
  
  scheduledAt: DateTime.now().subtract(Duration(minutes: 30)),
  endsAt: DateTime.now().add(Duration(minutes: 90)),
  
  location: 'Mumbai Aquatic Center - Pool 1',
  venueId: 'venue_mumbai_pool_001',
  
  sessionType: 'assessment',
  skillLevel: 'intermediate',
  
  objectives: [
    'Stroke assessment - all four strokes',
    'Endurance evaluation',
    'Technique analysis',
    'Goal setting for improvement'
  ],
  
  assessmentCriteria: [
    'Freestyle technique',
    'Backstroke form',
    'Breaststroke timing',
    'Butterfly coordination',
    'Turns and starts',
    'Breathing pattern'
  ],
  
  equipment: [
    'Underwater camera',
    'Stopwatch',
    'Assessment forms',
    'Kickboard',
    'Pull buoy'
  ],
  
  amount: 2500.0,
  currency: 'INR',
  isPaid: true,
  
  createdAt: DateTime.now().subtract(Duration(hours: 1)),
);
```

## Common Queries and Operations

### Venue Searches

```dart
// Find venues by sport and location
Future<List<Venue>> findVenuesBySportAndLocation({
  required String sportId,
  required String city,
  double? maxDistance,
  double? userLat,
  double? userLon,
}) async {
  var query = venueBox.query(
    Venue_.sportIds.contains(sportId)
      .and(Venue_.city.equals(city))
      .and(Venue_.isActive.equals(true))
  );
  
  return query.build().find();
}

// Find available courts at venue
Future<List<Court>> findAvailableCourts({
  required String venueId,
  required DateTime startTime,
  required DateTime endTime,
}) async {
  // Get all courts at venue
  final allCourts = courtBox.query(
    Court_.venueId.equals(venueId)
      .and(Court_.isActive.equals(true))
      .and(Court_.isBookable.equals(true))
  ).build().find();
  
  // Check for conflicting bookings
  final conflictingBookings = venueBookingBox.query(
    VenueBooking_.venueId.equals(venueId)
      .and(VenueBooking_.dbBookingStatus.equals(BookingStatus.confirmed.stableId))
      .and(VenueBooking_.startTime.lessThan(endTime.millisecondsSinceEpoch))
      .and(VenueBooking_.endTime.greaterThan(startTime.millisecondsSinceEpoch))
  ).build().find();
  
  final bookedCourtIds = conflictingBookings.map((b) => b.courtId).toSet();
  
  return allCourts.where((court) => !bookedCourtIds.contains(court.id)).toList();
}
```

### Trainer Searches

```dart
// Find trainers by sport and rating
Future<List<Trainer>> findTopTrainers({
  required String sportId,
  required String city,
  double minRating = 4.0,
}) async {
  return trainerBox.query(
    Trainer_.sportIds.contains(sportId)
      .and(Trainer_.serviceAreas.contains(city))
      .and(Trainer_.rating.greaterOrEqual(minRating))
      .and(Trainer_.isAvailable.equals(true))
      .and(Trainer_.isVerified.equals(true))
  ).order(Trainer_.rating, flags: Order.descending)
  .build().find();
}

// Get trainer availability
Future<List<Map<String, dynamic>>> getTrainerAvailability({
  required String trainerId,
  required DateTime date,
}) async {
  final trainer = trainerBox.query(
    Trainer_.id.equals(trainerId)
  ).build().findFirst();
  
  if (trainer == null) return [];
  
  // Get existing sessions for the date
  final existingSessions = trainingSessionBox.query(
    TrainingSession_.trainerId.equals(trainerId)
      .and(TrainingSession_.scheduledAt.between(
        date.millisecondsSinceEpoch,
        date.add(Duration(days: 1)).millisecondsSinceEpoch
      ))
      .and(TrainingSession_.dbSessionStatus.oneOf([
        SessionStatus.scheduled.stableId,
        SessionStatus.inProgress.stableId
      ]))
  ).build().find();
  
  // Calculate available slots
  // Implementation would check trainer's schedule against existing sessions
  
  return []; // Placeholder
}
```

This comprehensive example file demonstrates how to work with all venue, court, trainer, and training-related models in the Playo platform.
