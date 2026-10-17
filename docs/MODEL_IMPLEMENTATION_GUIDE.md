# Playo Model Implementation Guide

This comprehensive guide covers all data models in the Playo sports platform, their structure, relationships, and usage patterns.

## 📋 Table of Contents

1. [Overview](#overview)
2. [Core Concepts](#core-concepts)
3. [User Models](#user-models)
4. [Game Models](#game-models)
5. [Venue Models](#venue-models)
6. [Trainer Models](#trainer-models)
7. [Notification Models](#notification-models)
8. [Analytics Models](#analytics-models)
9. [Sport Models](#sport-models)
10. [Authentication Models](#authentication-models)
11. [Location Models](#location-models)
12. [Common Patterns](#common-patterns)
13. [Database Relationships](#database-relationships)

## Overview

Playo uses ObjectBox as the local database with JSON serialization for API communication. All models follow consistent patterns for:
- Stable enum handling
- Property typing
- Constructor patterns
- JSON serialization

### Key Libraries
- **ObjectBox**: Local database ORM
- **json_annotation**: JSON serialization
- **Riverpod**: State management (used with models)

## Core Concepts

### Entity Structure
Every ObjectBox entity follows this pattern:
```dart
@Entity()
@JsonSerializable()
class ModelName {
  @Id()
  int localId;          // ObjectBox auto-generated ID
  
  @Unique()
  String id;            // Business/API ID (UUID)
  
  // Other properties...
  
  // Constructor with named parameters
  ModelName({
    this.localId = 0,
    required this.id,
    // other required/optional parameters
  });
  
  // JSON serialization
  factory ModelName.fromJson(Map<String, dynamic> json) => _$ModelNameFromJson(json);
  Map<String, dynamic> toJson() => _$ModelNameToJson(this);
}
```

### Enum Handling
All enums use stable IDs for ObjectBox persistence:
```dart
enum ExampleEnum {
  @JsonValue('unknown')
  unknown,
  @JsonValue('value1')
  value1;
  
  int get stableId {
    switch (this) {
      case ExampleEnum.unknown: return 0;
      case ExampleEnum.value1: return 1;
    }
  }
  
  static ExampleEnum fromStableId(int id) {
    switch (id) {
      case 0: return ExampleEnum.unknown;
      case 1: return ExampleEnum.value1;
      default: return ExampleEnum.unknown;
    }
  }
}
```

### DateTime Properties
Use `@Property(type: PropertyType.date)` for DateTime fields:
```dart
@Property(type: PropertyType.date)
DateTime? createdAt;
```

## User Models

### User (Primary User Entity)
**File**: `lib/core/models/user.dart`

**Purpose**: Represents a user in the Playo platform with authentication, profile, and preference data.

**Key Properties**:
- `id`: Unique UUID from Supabase
- `email`: User's email address
- `role`: UserRole enum (player, trainer, admin, venue_owner)
- `authProvider`: How user signed up (email, google, apple)
- `subscriptionStatus`: User's subscription level

**Example Usage**:
```dart
// Creating a new user
final user = User(
  id: 'usr_123456789',
  email: 'john.doe@example.com',
  fullName: 'John Doe',
  firstName: 'John',
  lastName: 'Doe',
  role: UserRole.player,
  authProvider: AuthProvider.google,
  subscriptionStatus: SubscriptionStatus.free,
  city: 'Mumbai',
  state: 'Maharashtra',
  country: 'India',
  preferredSports: ['tennis', 'badminton'],
  isEmailVerified: true,
  createdAt: DateTime.now(),
);

// Querying users
final activeUsers = userBox.query(
  User_.isActive.equals(true)
).build().find();

// Finding users by city
final mumbaiUsers = userBox.query(
  User_.city.equals('Mumbai')
).build().find();
```

### UserPreferences
**Purpose**: Stores user app preferences and settings.

**Example Data**:
```dart
final preferences = UserPreferences(
  userId: 'usr_123456789',
  notificationsEnabled: true,
  gameInvitesEnabled: true,
  themeMode: 'dark',
  language: 'en',
  distanceUnit: 'km',
  timeFormat: '24h',
  searchRadius: 15.0,
  defaultSkillLevel: 'intermediate',
);
```

### UserSportProfile
**Purpose**: Sport-specific profiles for users showing skills and achievements.

**Example Data**:
```dart
final tennisProfile = UserSportProfile(
  id: 'profile_tennis_123',
  userId: 'usr_123456789',
  sportName: 'Tennis',
  skillLevel: 'intermediate',
  yearsOfExperience: 3,
  position: 'All Court Player',
  achievements: ['City Championship 2024', 'Club Tournament Winner'],
  bio: 'Passionate tennis player, love doubles matches',
  rating: 4.2,
  totalGamesPlayed: 45,
  totalWins: 28,
  totalLosses: 17,
  preferredGameType: 'doubles',
  isPublic: true,
);
```

### UserConnection
**Purpose**: Manages friendships and connections between users.

**Example Data**:
```dart
final friendRequest = UserConnection(
  id: 'conn_123456',
  userId: 'usr_123456789',
  connectedUserId: 'usr_987654321',
  status: ConnectionStatus.pending,
  requestedAt: DateTime.now(),
  notes: 'Met at tennis club',
);
```

## Game Models

### Game (Primary Game Entity)
**File**: `lib/core/models/game.dart`

**Purpose**: Represents a sports game/match that users can join.

**Key Properties**:
- `organizerId`: User who created the game
- `sportId`: Which sport is being played
- `status`: Current game status (draft, published, etc.)
- `startTime`/`endTime`: Game schedule
- `capacity`: Maximum players allowed

**Example Usage**:
```dart
// Creating a tennis doubles game
final game = Game(
  id: 'game_tennis_001',
  organizerId: 'usr_123456789',
  sportId: 'sport_tennis',
  title: 'Evening Tennis Doubles',
  description: 'Friendly doubles match at the local club',
  gameType: 'doubles',
  skillLevel: 'intermediate',
  status: GameStatus.published,
  startTime: DateTime.now().add(Duration(days: 2, hours: 18)),
  endTime: DateTime.now().add(Duration(days: 2, hours: 20)),
  venueId: 'venue_tennis_club_01',
  venueName: 'Mumbai Tennis Club',
  venueAddress: 'Marine Drive, Mumbai',
  latitude: 18.9220,
  longitude: 72.8347,
  capacity: 4,
  currentPlayers: 1,
  playerIds: ['usr_123456789'],
  entryFee: 500.0,
  currency: 'INR',
  rules: ['Bring your own racket', 'Punctuality required'],
  equipmentProvided: ['Tennis balls', 'Court lighting'],
  isPublic: true,
  allowWaitlist: true,
  tags: ['evening', 'doubles', 'intermediate'],
);

// Querying games
final todaysGames = gameBox.query(
  Game_.startTime.between(
    DateTime.now().millisecondsSinceEpoch,
    DateTime.now().add(Duration(days: 1)).millisecondsSinceEpoch,
  ).and(Game_.dbStatus.equals(GameStatus.published.stableId))
).build().find();

// Finding games by sport and skill level
final intermediateGames = gameBox.query(
  Game_.sportId.equals('sport_tennis')
    .and(Game_.skillLevel.equals('intermediate'))
).build().find();
```

### GameParticipation
**Purpose**: Tracks user participation in games.

**Example Data**:
```dart
final participation = GameParticipation(
  id: 'participation_001',
  gameId: 'game_tennis_001',
  userId: 'usr_987654321',
  status: ParticipationStatus.confirmed,
  joinedAt: DateTime.now(),
  position: 'Player 2',
  partnerUserId: 'usr_123456789', // for doubles
  isPaid: true,
  paidAt: DateTime.now(),
);
```

### GameInvite
**Purpose**: Manages game invitations between users.

**Example Data**:
```dart
final invite = GameInvite(
  id: 'invite_001',
  gameId: 'game_tennis_001',
  inviterId: 'usr_123456789',
  inviteeId: 'usr_555666777',
  status: InviteStatus.pending,
  message: 'Want to join our tennis doubles match?',
  sentAt: DateTime.now(),
  expiresAt: DateTime.now().add(Duration(days: 3)),
);
```

## Venue Models

### Venue (Primary Venue Entity)
**File**: `lib/core/models/venue.dart`

**Purpose**: Represents sports facilities where games and training can take place.

**Example Usage**:
```dart
final venue = Venue(
  id: 'venue_mumbai_tennis_001',
  ownerId: 'usr_venue_owner_123',
  name: 'Mumbai Tennis Academy',
  description: 'Premier tennis facility with 8 courts',
  address: '123 Marine Drive, Mumbai, Maharashtra 400001',
  city: 'Mumbai',
  state: 'Maharashtra',
  country: 'India',
  zipCode: '400001',
  latitude: 18.9220,
  longitude: 72.8347,
  phone: '+91-22-12345678',
  email: 'info@mumbaitennisacademy.com',
  website: 'https://mumbaitennisacademy.com',
  images: [
    'https://venue-images.com/court1.jpg',
    'https://venue-images.com/court2.jpg'
  ],
  primaryImage: 'https://venue-images.com/main.jpg',
  sportIds: ['sport_tennis'],
  amenities: ['Parking', 'Restrooms', 'Cafeteria', 'Pro Shop'],
  facilities: ['Floodlights', 'Sound System', 'Scoreboard'],
  equipment: ['Tennis balls', 'Racket rental', 'Ball machine'],
  rules: ['Proper tennis attire required', 'No outside food'],
  type: VenueType.outdoor,
  rating: 4.5,
  totalReviews: 128,
  isActive: true,
  isVerified: true,
  allowsOnlineBooking: true,
  cancellationHours: 24.0,
  tags: ['premium', 'coaching-available'],
);

// Querying venues
final nearbyVenues = venueBox.query(
  Venue_.latitude.between(18.9000, 18.9500)
    .and(Venue_.longitude.between(72.8000, 72.8500))
    .and(Venue_.isActive.equals(true))
).build().find();
```

### Court
**Purpose**: Individual courts/fields within a venue.

**Example Data**:
```dart
final court = Court(
  id: 'court_001',
  venueId: 'venue_mumbai_tennis_001',
  name: 'Court 1 - Center Court',
  description: 'Main tournament court with stadium seating',
  sportId: 'sport_tennis',
  type: CourtType.tournament,
  surface: 'Hard Court',
  features: ['Stadium seating', 'Professional lighting', 'Line calling system'],
  equipment: ['Net system', 'Scoreboard', 'Chair umpire seat'],
  isActive: true,
  isBookable: true,
  hourlyRate: 2000.0,
  currency: 'INR',
);
```

### VenueBooking
**Purpose**: Tracks venue/court bookings by users.

**Example Data**:
```dart
final booking = VenueBooking(
  id: 'booking_001',
  venueId: 'venue_mumbai_tennis_001',
  courtId: 'court_001',
  userId: 'usr_123456789',
  sportId: 'sport_tennis',
  bookingStatus: BookingStatus.confirmed,
  startTime: DateTime.now().add(Duration(days: 1, hours: 18)),
  endTime: DateTime.now().add(Duration(days: 1, hours: 20)),
  totalAmount: 4000.0,
  currency: 'INR',
  purpose: 'Training session',
  participantIds: ['usr_123456789', 'usr_987654321'],
  expectedParticipants: 2,
  bookingType: BookingType.hourly,
  isPaid: true,
  paidAt: DateTime.now(),
);
```

### VenueReview
**Purpose**: User reviews and ratings for venues.

**Example Data**:
```dart
final review = VenueReview(
  id: 'review_001',
  venueId: 'venue_mumbai_tennis_001',
  reviewerId: 'usr_123456789',
  bookingId: 'booking_001',
  rating: 4.5,
  comment: 'Excellent courts and facilities. Staff very helpful.',
  tags: ['clean', 'well-maintained', 'good-lighting'],
  isPublic: true,
);
```

## Trainer Models

### Trainer (Primary Trainer Entity)
**File**: `lib/core/models/trainer.dart`

**Purpose**: Represents professional trainers/coaches on the platform.

**Example Usage**:
```dart
final trainer = Trainer(
  id: 'trainer_001',
  userId: 'usr_trainer_123',
  businessName: 'Elite Tennis Coaching',
  tagline: 'Professional Tennis Coach - 15+ Years Experience',
  bio: 'Former national player with expertise in technique and strategy',
  sportIds: ['sport_tennis'],
  specializations: ['Technique Improvement', 'Match Strategy', 'Junior Development'],
  certifications: ['PTR Certified', 'ITF Level 3', 'Sports Psychology'],
  qualifications: ['Bachelor in Sports Science', 'Tennis Academy Graduate'],
  yearsOfExperience: 15,
  type: TrainerType.individual,
  serviceAreas: ['Mumbai', 'Navi Mumbai', 'Thane'],
  audienceTypes: ['Adults', 'Juniors', 'Professionals'],
  hourlyRate: 3000.0,
  currency: 'INR',
  rating: 4.8,
  totalReviews: 89,
  totalStudents: 156,
  completedSessions: 1200,
  languagesSpoken: ['English', 'Hindi', 'Marathi'],
  isAvailable: true,
  isVerified: true,
);

// Finding trainers by sport and location
final tennisTrainers = trainerBox.query(
  Trainer_.sportIds.contains('sport_tennis')
    .and(Trainer_.serviceAreas.contains('Mumbai'))
    .and(Trainer_.isAvailable.equals(true))
).build().find();
```

### TrainingService
**Purpose**: Services offered by trainers.

**Example Data**:
```dart
final service = TrainingService(
  id: 'service_001',
  trainerId: 'trainer_001',
  sportId: 'sport_tennis',
  name: 'One-on-One Tennis Coaching',
  description: 'Personalized tennis lessons focusing on technique and strategy',
  serviceType: ServiceType.oneOnOne,
  duration: 60, // minutes
  price: 3000.0,
  currency: 'INR',
  maxParticipants: 1,
  skillLevels: ['beginner', 'intermediate', 'advanced'],
  ageGroups: ['Adults (18+)'],
  equipmentProvided: ['Tennis balls', 'Training aids'],
  equipmentRequired: ['Tennis racket', 'Proper shoes'],
  location: 'Client preferred court',
  isActive: true,
);
```

### TrainingSession
**Purpose**: Individual training session bookings.

**Example Data**:
```dart
final session = TrainingSession(
  id: 'session_001',
  serviceId: 'service_001',
  trainerId: 'trainer_001',
  studentId: 'usr_123456789',
  sessionStatus: SessionStatus.scheduled,
  scheduledAt: DateTime.now().add(Duration(days: 2, hours: 16)),
  endsAt: DateTime.now().add(Duration(days: 2, hours: 17)),
  location: 'Mumbai Tennis Club, Court 2',
  notes: 'Focus on backhand technique',
  amount: 3000.0,
  currency: 'INR',
  isPaid: true,
);
```

### TrainerReview
**Purpose**: Reviews for trainers from students.

**Example Data**:
```dart
final trainerReview = TrainerReview(
  id: 'trainer_review_001',
  trainerId: 'trainer_001',
  reviewerId: 'usr_123456789',
  sessionId: 'session_001',
  rating: 5.0,
  comment: 'Excellent coach! Really helped improve my backhand.',
  tags: ['knowledgeable', 'patient', 'professional'],
  isPublic: true,
);
```

## Notification Models

### NotificationModel
**File**: `lib/core/models/notification.dart`

**Purpose**: App notifications for users.

**Example Usage**:
```dart
final notification = NotificationModel(
  id: 'notif_001',
  userId: 'usr_123456789',
  title: 'Game Invitation',
  body: 'John invited you to a tennis match tomorrow at 6 PM',
  type: NotificationType.gameInvite,
  priority: NotificationPriority.high,
  deepLink: '/game/game_tennis_001',
  relatedEntityId: 'game_tennis_001',
  relatedEntityType: 'game',
  actionText: 'View Game',
  tags: ['game', 'invitation'],
  isRead: false,
  createdAt: DateTime.now(),
);

// Query unread notifications
final unreadNotifs = notificationBox.query(
  NotificationModel_.userId.equals('usr_123456789')
    .and(NotificationModel_.isRead.equals(false))
).order(NotificationModel_.createdAt, flags: Order.descending)
.build().find();
```

### Message
**Purpose**: In-app messaging between users.

**Example Data**:
```dart
final message = Message(
  id: 'msg_001',
  conversationId: 'conv_001',
  senderId: 'usr_123456789',
  receiverId: 'usr_987654321',
  content: 'Hey! Are you still available for the tennis match tomorrow?',
  type: MessageType.text,
  isRead: false,
  isDelivered: true,
  createdAt: DateTime.now(),
);
```

### Payment
**Purpose**: Payment transactions in the app.

**Example Data**:
```dart
final payment = Payment(
  id: 'pay_001',
  userId: 'usr_123456789',
  sourceId: 'booking_001',
  sourceType: 'venue_booking',
  amount: 4000.0,
  currency: 'INR',
  status: PaymentStatus.succeeded,
  method: PaymentMethod.upi,
  gatewayTransactionId: 'razorpay_123456',
  description: 'Court booking payment',
  fees: 80.0,
  taxes: 720.0,
  netAmount: 3200.0,
  succeededAt: DateTime.now(),
);
```

## Analytics Models

### UserAnalytics
**File**: `lib/core/models/analytics.dart`

**Purpose**: Tracks user activity and performance metrics.

**Example Data**:
```dart
final analytics = UserAnalytics(
  id: 'analytics_usr_123',
  userId: 'usr_123456789',
  totalGamesPlayed: 45,
  totalGamesWon: 28,
  totalGamesLost: 17,
  averageRating: 4.3,
  totalTrainingSessions: 12,
  totalTrainingHours: 24,
  totalVenueBookings: 8,
  totalFriends: 23,
  currentActiveStreak: 5,
  longestActiveStreak: 12,
  monthlyGames: 8,
  monthlySpending: 15000.0,
  lastUpdated: DateTime.now(),
);
```

### UserSportStats
**Purpose**: Sport-specific statistics for users.

**Example Data**:
```dart
final tennisStats = UserSportStats(
  id: 'stats_tennis_usr_123',
  userId: 'usr_123456789',
  sportId: 'sport_tennis',
  skillLevel: UserSkillLevel.intermediate,
  skillRating: 6.5,
  totalMatches: 32,
  wins: 20,
  losses: 12,
  winRate: 62.5,
  averagePerformanceRating: 4.2,
  mvpCount: 3,
  totalHoursPlayed: 64,
  firstGameDate: DateTime.now().subtract(Duration(days: 180)),
  lastGameDate: DateTime.now().subtract(Duration(days: 2)),
);
```

### Achievement
**Purpose**: Available achievements in the system.

**Example Data**:
```dart
final achievement = Achievement(
  id: 'ach_first_win',
  name: 'First Victory',
  description: 'Win your first game on Playo',
  icon: '🏆',
  category: AchievementCategory.games,
  rarity: AchievementRarity.common,
  points: 100,
  criteria: '{"type": "game_win", "count": 1}',
  isActive: true,
);
```

## Sport Models

### Sport
**File**: `lib/core/models/sport.dart`

**Purpose**: Defines available sports on the platform.

**Example Data**:
```dart
final tennis = Sport(
  id: 'sport_tennis',
  name: 'Tennis',
  description: 'Racket sport played on a rectangular court',
  iconUrl: 'https://icons.com/tennis.svg',
  category: SportCategory.racket,
  aliases: ['Lawn Tennis'],
  skillLevels: ['Beginner', 'Intermediate', 'Advanced', 'Professional'],
  gameTypes: ['Singles', 'Doubles'],
  positions: ['Server', 'Receiver'],
  minPlayers: 2,
  maxPlayers: 4,
  typicalDurationMinutes: 90,
  equipmentRequired: ['Tennis Racket', 'Tennis Balls', 'Proper Shoes'],
  rules: ['Standard ITF rules apply', 'Best of 3 sets'],
  popularityScore: 85,
  isActive: true,
);
```

### SportSkillLevel
**Purpose**: Defines skill levels for specific sports.

**Example Data**:
```dart
final beginnerTennis = SportSkillLevel(
  id: 'skill_tennis_beginner',
  sportId: 'sport_tennis',
  level: 'beginner',
  displayName: 'Beginner',
  description: 'New to tennis, learning basic strokes',
  order: 1,
  characteristics: [
    'Learning basic forehand and backhand',
    'Understanding court layout',
    'Developing consistent ball contact'
  ],
);
```

## Authentication Models

### AuthSession
**File**: `lib/core/models/auth.dart`

**Purpose**: Manages user authentication sessions.

**Example Data**:
```dart
final session = AuthSession(
  id: 'session_001',
  userId: 'usr_123456789',
  accessToken: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...',
  refreshToken: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...',
  expiresAt: DateTime.now().add(Duration(hours: 1)),
  deviceId: 'device_android_001',
  deviceName: 'Samsung Galaxy S23',
  ipAddress: '192.168.1.100',
  userAgent: 'Playo/1.0.0 (Android 13)',
  isActive: true,
  createdAt: DateTime.now(),
);
```

## Location Models

### Location
**File**: `lib/core/models/location.dart`

**Purpose**: Stores location data for venues and users.

**Example Data**:
```dart
final location = Location(
  id: 'loc_mumbai_001',
  name: 'Marine Drive Tennis Courts',
  address: 'Marine Drive, Mumbai, Maharashtra',
  city: 'Mumbai',
  state: 'Maharashtra',
  country: 'India',
  latitude: 18.9220,
  longitude: 72.8347,
  type: LocationType.venue,
  isVerified: true,
);
```

## Common Patterns

### 1. Creating Entities
```dart
// Always use named constructors
final entity = EntityName(
  id: 'generated_uuid',
  requiredField: 'value',
  optionalField: 'value',
  createdAt: DateTime.now(),
);
```

### 2. Querying Data
```dart
// Simple query
final results = box.query(Entity_.field.equals('value')).build().find();

// Complex query with conditions
final results = box.query(
  Entity_.field1.equals('value1')
    .and(Entity_.field2.greaterThan(100))
    .and(Entity_.isActive.equals(true))
).order(Entity_.createdAt, flags: Order.descending)
.build().find();

// Enum queries use stable IDs
final publishedGames = gameBox.query(
  Game_.dbStatus.equals(GameStatus.published.stableId)
).build().find();
```

### 3. Updating Entities
```dart
// Fetch, modify, put back
final entity = box.get(id);
entity?.someProperty = newValue;
entity?.updatedAt = DateTime.now();
if (entity != null) {
  box.put(entity);
}
```

### 4. JSON Serialization
```dart
// From JSON (API response)
final entity = EntityName.fromJson(jsonData);

// To JSON (API request)
final jsonData = entity.toJson();
```

## Database Relationships

### User-Centric Relationships
```
User (1) → (N) UserSportProfile
User (1) → (1) UserPreferences  
User (1) → (1) UserAnalytics
User (1) → (N) Game (as organizer)
User (1) → (N) GameParticipation
User (1) → (N) VenueBooking
User (1) → (N) TrainingSession (as student)
```

### Game-Centric Relationships
```
Game (1) → (N) GameParticipation
Game (1) → (N) GameInvite
Game (1) → (1) Sport
Game (1) → (1) Venue (optional)
```

### Venue-Centric Relationships
```
Venue (1) → (N) Court
Venue (1) → (N) VenueBooking
Venue (1) → (N) VenueReview
```

### Trainer-Centric Relationships
```
Trainer (1) → (N) TrainingService
TrainingService (1) → (N) TrainingSession
Trainer (1) → (N) TrainerReview
```

## Best Practices

### 1. ID Management
- Use UUIDs for business IDs (`id` field)
- Let ObjectBox manage `localId` (always 0 in constructors)
- Use `@Unique()` annotation for business IDs

### 2. Enum Usage
- Always include `unknown` as first enum value
- Use stable IDs for database persistence
- Handle unknown values gracefully in queries

### 3. DateTime Handling
- Always use UTC for storage
- Convert to local time in UI layer
- Use `@Property(type: PropertyType.date)` annotation

### 4. Constructor Patterns
- Use named parameters for all constructors
- Provide sensible defaults
- Set `localId = 0` for new entities
- Initialize enums in constructor body

### 5. Validation
- Validate required fields in constructors
- Use assertions for critical business rules
- Handle null values appropriately

### 6. Performance
- Use indexes on frequently queried fields
- Limit query results with `.limit()`
- Use lazy loading for relationships when possible

This guide provides a comprehensive overview of all models in the Playo platform. For specific implementation details, refer to the individual model files and the Enum Implementation Guide.
