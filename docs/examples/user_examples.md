# User Model Examples

This file contains practical examples for all user-related models in Playo.

## User Entity Examples

### Creating Different Types of Users

```dart
// Regular Player
final player = User(
  id: 'usr_player_123',
  email: 'player@example.com',
  fullName: 'Alex Johnson',
  firstName: 'Alex',
  lastName: 'Johnson',
  role: UserRole.player,
  authProvider: AuthProvider.email,
  subscriptionStatus: SubscriptionStatus.free,
  city: 'Mumbai',
  state: 'Maharashtra',
  country: 'India',
  preferredSports: ['tennis', 'badminton'],
  isEmailVerified: true,
  isActive: true,
  profileImageUrl: 'https://avatars.com/alex_johnson.jpg',
  bio: 'Love playing tennis on weekends!',
  dateOfBirth: DateTime(1990, 5, 15),
  gender: 'Male',
  phone: '+91-9876543210',
  emergencyContactName: 'Sarah Johnson',
  emergencyContactPhone: '+91-9876543211',
  preferredLanguage: 'en',
  timezone: 'Asia/Kolkata',
  createdAt: DateTime.now(),
);

// Trainer User
final trainer = User(
  id: 'usr_trainer_456',
  email: 'coach@tennisacademy.com',
  fullName: 'Maria Rodriguez',
  firstName: 'Maria',
  lastName: 'Rodriguez',
  role: UserRole.trainer,
  authProvider: AuthProvider.google,
  subscriptionStatus: SubscriptionStatus.pro,
  city: 'Bangalore',
  state: 'Karnataka',
  country: 'India',
  preferredSports: ['tennis'],
  isEmailVerified: true,
  isActive: true,
  profileImageUrl: 'https://avatars.com/maria_rodriguez.jpg',
  bio: 'Professional tennis coach with 10+ years experience',
  dateOfBirth: DateTime(1985, 8, 22),
  gender: 'Female',
  phone: '+91-9876543220',
  website: 'https://mariatenniscoaching.com',
  socialLinks: {
    'instagram': '@mariatenniscoach',
    'youtube': 'MariaCoachingChannel'
  },
  createdAt: DateTime.now(),
);

// Venue Owner
final venueOwner = User(
  id: 'usr_venue_789',
  email: 'owner@tennisclub.com',
  fullName: 'Rajesh Patel',
  firstName: 'Rajesh',
  lastName: 'Patel',
  role: UserRole.venueOwner,
  authProvider: AuthProvider.email,
  subscriptionStatus: SubscriptionStatus.premium,
  city: 'Chennai',
  state: 'Tamil Nadu',
  country: 'India',
  isEmailVerified: true,
  isActive: true,
  businessName: 'Chennai Tennis Academy',
  businessRegistrationNumber: 'TN123456789',
  businessAddress: '123 Tennis Street, Chennai',
  createdAt: DateTime.now(),
);
```

### User Preferences Examples

```dart
// Player Preferences
final playerPrefs = UserPreferences(
  id: 'prefs_player_123',
  userId: 'usr_player_123',
  notificationsEnabled: true,
  gameInvitesEnabled: true,
  trainingRemindersEnabled: true,
  marketingEmailsEnabled: false,
  themeMode: 'auto',
  language: 'en',
  distanceUnit: 'km',
  timeFormat: '24h',
  currency: 'INR',
  searchRadius: 10.0,
  defaultSkillLevel: 'intermediate',
  autoJoinPublicGames: false,
  showLocationOnProfile: true,
  allowDirectMessages: true,
  privacyLevel: 'friends',
  createdAt: DateTime.now(),
);

// Trainer Preferences
final trainerPrefs = UserPreferences(
  id: 'prefs_trainer_456',
  userId: 'usr_trainer_456',
  notificationsEnabled: true,
  gameInvitesEnabled: false,
  trainingRemindersEnabled: true,
  marketingEmailsEnabled: true,
  businessNotificationsEnabled: true,
  themeMode: 'light',
  language: 'en',
  distanceUnit: 'km',
  timeFormat: '12h',
  currency: 'INR',
  searchRadius: 25.0,
  showLocationOnProfile: true,
  allowDirectMessages: true,
  businessHoursStart: '06:00',
  businessHoursEnd: '22:00',
  privacyLevel: 'public',
  createdAt: DateTime.now(),
);
```

### Sport Profile Examples

```dart
// Tennis Profile - Beginner
final beginnerTennis = UserSportProfile(
  id: 'profile_tennis_beginner',
  userId: 'usr_player_123',
  sportId: 'sport_tennis',
  sportName: 'Tennis',
  skillLevel: 'beginner',
  yearsOfExperience: 1,
  position: 'Learning all positions',
  playingHand: 'right',
  achievements: ['Completed beginner course'],
  bio: 'Just started playing tennis, looking to improve!',
  rating: 3.0,
  totalGamesPlayed: 5,
  totalWins: 2,
  totalLosses: 3,
  winRate: 40.0,
  preferredGameType: 'singles',
  preferredSchedule: ['weekends', 'evenings'],
  equipmentOwned: ['racket', 'shoes'],
  isPublic: true,
  lookingForPartners: true,
  lookingForTraining: true,
  createdAt: DateTime.now(),
);

// Tennis Profile - Advanced
final advancedTennis = UserSportProfile(
  id: 'profile_tennis_advanced',
  userId: 'usr_player_456',
  sportId: 'sport_tennis',
  sportName: 'Tennis',
  skillLevel: 'advanced',
  yearsOfExperience: 8,
  position: 'All Court Player',
  playingHand: 'left',
  achievements: [
    'State Championship Semifinalist 2023',
    'District Champion 2022',
    'Club Tournament Winner 2021-2023'
  ],
  bio: 'Competitive player seeking challenging matches',
  rating: 4.7,
  totalGamesPlayed: 156,
  totalWins: 98,
  totalLosses: 58,
  winRate: 62.8,
  favoriteShots: ['serve', 'backhand down the line'],
  weaknessAreas: ['net play'],
  preferredGameType: 'singles',
  preferredSchedule: ['mornings', 'evenings'],
  availableDays: ['Monday', 'Wednesday', 'Friday', 'Saturday'],
  equipmentOwned: ['racket', 'shoes', 'strings', 'grips'],
  preferredCourtSurface: 'hard',
  isPublic: true,
  lookingForPartners: true,
  lookingForTraining: false,
  createdAt: DateTime.now(),
);

// Badminton Profile
final badmintonProfile = UserSportProfile(
  id: 'profile_badminton_intermediate',
  userId: 'usr_player_123',
  sportId: 'sport_badminton',
  sportName: 'Badminton',
  skillLevel: 'intermediate',
  yearsOfExperience: 3,
  position: 'All positions',
  playingHand: 'right',
  achievements: ['Office tournament winner'],
  bio: 'Enjoy doubles matches, good at net play',
  rating: 4.1,
  totalGamesPlayed: 42,
  totalWins: 26,
  totalLosses: 16,
  winRate: 61.9,
  preferredGameType: 'doubles',
  preferredSchedule: ['evenings'],
  equipmentOwned: ['racket', 'shoes', 'shuttles'],
  isPublic: true,
  lookingForPartners: true,
  lookingForTraining: true,
  createdAt: DateTime.now(),
);
```

### User Connections Examples

```dart
// Friend Request
final friendRequest = UserConnection(
  id: 'conn_friend_request_001',
  userId: 'usr_player_123',
  connectedUserId: 'usr_player_456',
  status: ConnectionStatus.pending,
  requestedAt: DateTime.now(),
  message: 'Hi! I saw your tennis profile. Would love to play together!',
  notes: 'Met through tennis app',
  mutualFriends: 2,
  mutualSports: ['tennis'],
  createdAt: DateTime.now(),
);

// Confirmed Friendship
final confirmedFriend = UserConnection(
  id: 'conn_friend_confirmed_002',
  userId: 'usr_player_123',
  connectedUserId: 'usr_player_789',
  status: ConnectionStatus.connected,
  requestedAt: DateTime.now().subtract(Duration(days: 5)),
  acceptedAt: DateTime.now().subtract(Duration(days: 3)),
  message: 'Great playing with you at the club!',
  notes: 'Regular tennis partner',
  mutualFriends: 5,
  mutualSports: ['tennis', 'badminton'],
  lastInteraction: DateTime.now().subtract(Duration(days: 1)),
  gamesPlayedTogether: 12,
  createdAt: DateTime.now().subtract(Duration(days: 5)),
);

// Blocked Connection
final blockedUser = UserConnection(
  id: 'conn_blocked_003',
  userId: 'usr_player_123',
  connectedUserId: 'usr_problem_user',
  status: ConnectionStatus.blocked,
  requestedAt: DateTime.now().subtract(Duration(days: 10)),
  blockedAt: DateTime.now().subtract(Duration(days: 2)),
  reason: 'Inappropriate behavior',
  createdAt: DateTime.now().subtract(Duration(days: 10)),
);
```

## Common User Queries

### Finding Users

```dart
// Find users by city and sport interest
Future<List<User>> findTennisPlayersInMumbai() async {
  return userBox.query(
    User_.city.equals('Mumbai')
      .and(User_.preferredSports.contains('tennis'))
      .and(User_.isActive.equals(true))
  ).build().find();
}

// Find users by skill level and availability
Future<List<User>> findIntermediatePlayers() async {
  final userIds = await userSportProfileBox.query(
    UserSportProfile_.skillLevel.equals('intermediate')
      .and(UserSportProfile_.lookingForPartners.equals(true))
  ).build().find().map((profile) => profile.userId).toList();
  
  return userBox.query(
    User_.id.oneOf(userIds)
      .and(User_.isActive.equals(true))
  ).build().find();
}

// Find nearby trainers
Future<List<User>> findNearbyTrainers(String city) async {
  return userBox.query(
    User_.dbRole.equals(UserRole.trainer.stableId)
      .and(User_.city.equals(city))
      .and(User_.isActive.equals(true))
  ).build().find();
}
```

### User Statistics

```dart
// Get user's sports statistics
Future<Map<String, dynamic>> getUserSportStats(String userId) async {
  final profiles = userSportProfileBox.query(
    UserSportProfile_.userId.equals(userId)
  ).build().find();
  
  return {
    'totalSports': profiles.length,
    'totalGames': profiles.fold(0, (sum, p) => sum + p.totalGamesPlayed),
    'totalWins': profiles.fold(0, (sum, p) => sum + p.totalWins),
    'averageRating': profiles.isEmpty ? 0 : 
      profiles.fold(0.0, (sum, p) => sum + p.rating) / profiles.length,
    'sports': profiles.map((p) => {
      'sport': p.sportName,
      'skillLevel': p.skillLevel,
      'games': p.totalGamesPlayed,
      'winRate': p.winRate,
    }).toList(),
  };
}

// Get user's connections count
Future<Map<String, int>> getUserConnectionStats(String userId) async {
  final connections = userConnectionBox.query(
    UserConnection_.userId.equals(userId)
  ).build().find();
  
  return {
    'total': connections.length,
    'confirmed': connections.where((c) => 
      c.status == ConnectionStatus.connected).length,
    'pending': connections.where((c) => 
      c.status == ConnectionStatus.pending).length,
    'blocked': connections.where((c) => 
      c.status == ConnectionStatus.blocked).length,
  };
}
```

### Profile Management

```dart
// Update sport profile (user update: use updateUser(User user))
Future<void> updateSportProfile(String profileId, {
  String? skillLevel,
  List<String>? achievements,
  String? bio,
  bool? lookingForPartners,
}) async {
  final profile = userSportProfileBox.query(
    UserSportProfile_.id.equals(profileId)
  ).build().findFirst();
  
  if (profile != null) {
    if (skillLevel != null) profile.skillLevel = skillLevel;
    if (achievements != null) profile.achievements = achievements;
    if (bio != null) profile.bio = bio;
    if (lookingForPartners != null) {
      profile.lookingForPartners = lookingForPartners;
    }
    profile.updatedAt = DateTime.now();
    userSportProfileBox.put(profile);
  }
// Step 1: Create basic user account
Future<User> createUserAccount({
  required String email,
  required String fullName,
  required AuthProvider authProvider,
  String? profileImageUrl,
}) async {
  final user = User(
    id: generateUUID(),
    email: email,
    fullName: fullName,
    firstName: fullName.split(' ').first,
    lastName: fullName.split(' ').length > 1 ? 
      fullName.split(' ').last : '',
    role: UserRole.player,
    authProvider: authProvider,
    subscriptionStatus: SubscriptionStatus.free,
    isEmailVerified: authProvider != AuthProvider.email,
    isActive: true,
    profileImageUrl: profileImageUrl,
    createdAt: DateTime.now(),
  );
  
  userBox.put(user);
  return user;
}

// Step 2: Create default preferences
Future<UserPreferences> createDefaultPreferences(String userId) async {
  final preferences = UserPreferences(
    id: 'prefs_$userId',
    userId: userId,
    notificationsEnabled: true,
    gameInvitesEnabled: true,
    themeMode: 'auto',
    language: 'en',
    distanceUnit: 'km',
    timeFormat: '24h',
    currency: 'INR',
    searchRadius: 15.0,
    allowDirectMessages: true,
    privacyLevel: 'friends',
    createdAt: DateTime.now(),
  );
  
  userPreferencesBox.put(preferences);
  return preferences;
}

// Step 3: Add first sport profile
Future<UserSportProfile> createFirstSportProfile({
  required String userId,
  required String sportId,
  required String sportName,
  required String skillLevel,
}) async {
  final profile = UserSportProfile(
    id: 'profile_${sportId}_$userId',
    userId: userId,
    sportId: sportId,
    sportName: sportName,
    skillLevel: skillLevel,
    yearsOfExperience: 0,
    rating: 3.0,
    totalGamesPlayed: 0,
    totalWins: 0,
    totalLosses: 0,
    winRate: 0.0,
    isPublic: true,
    lookingForPartners: true,
    lookingForTraining: true,
    createdAt: DateTime.now(),
  );
  
  userSportProfileBox.put(profile);
  return profile;
}
```

### User Activity Tracking

```dart
// Update user activity after game
Future<void> updateUserActivityAfterGame({
  required String userId,
  required String sportId,
  required bool won,
  required double performanceRating,
}) async {
  // Update sport profile
  final profile = userSportProfileBox.query(
    UserSportProfile_.userId.equals(userId)
      .and(UserSportProfile_.sportId.equals(sportId))
  ).build().findFirst();
  
  if (profile != null) {
    profile.totalGamesPlayed += 1;
    if (won) {
      profile.totalWins += 1;
    } else {
      profile.totalLosses += 1;
    }
    profile.winRate = (profile.totalWins / profile.totalGamesPlayed) * 100;
    
    // Update rating (weighted average)
    final totalRatings = profile.totalGamesPlayed;
    profile.rating = ((profile.rating * (totalRatings - 1)) + performanceRating) / totalRatings;
    
    profile.lastGameDate = DateTime.now();
    profile.updatedAt = DateTime.now();
    userSportProfileBox.put(profile);
  }
  
  // Update user last activity
  final user = userBox.query(User_.id.equals(userId)).build().findFirst();
  if (user != null) {
    user.lastActiveAt = DateTime.now();
    userBox.put(user);
  }
}
```

This comprehensive example file shows how to work with all user-related models in the Playo platform, including creation, querying, updating, and lifecycle management.
