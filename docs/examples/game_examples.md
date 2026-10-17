# Game Model Examples

This file contains practical examples for all game-related models in Playo.

## Game Entity Examples

### Tennis Game Examples

```dart
// Singles Tennis Match
final tennisSingles = Game(
  id: 'game_tennis_singles_001',
  organizerId: 'usr_player_123',
  sportId: 'sport_tennis',
  title: 'Evening Tennis Singles',
  description: 'Looking for an intermediate player for a singles match. Let\'s have a good game!',
  gameType: 'singles',
  skillLevel: 'intermediate',
  status: GameStatus.published,
  startTime: DateTime.now().add(Duration(days: 2, hours: 18)),
  endTime: DateTime.now().add(Duration(days: 2, hours: 20)),
  venueId: 'venue_mumbai_tennis_001',
  venueName: 'Mumbai Tennis Club',
  venueAddress: 'Marine Drive, Mumbai, Maharashtra 400001',
  latitude: 18.9220,
  longitude: 72.8347,
  capacity: 2,
  currentPlayers: 1,
  playerIds: ['usr_player_123'],
  entryFee: 1000.0,
  currency: 'INR',
  rules: [
    'Best of 3 sets',
    'Proper tennis attire required',
    'Punctuality is important'
  ],
  equipmentProvided: ['Tennis balls', 'Court lighting'],
  equipmentRequired: ['Tennis racket', 'Tennis shoes'],
  isPublic: true,
  allowWaitlist: true,
  tags: ['evening', 'singles', 'intermediate', 'competitive'],
  additionalNotes: 'Court booking included in entry fee',
  createdAt: DateTime.now(),
);

// Doubles Tennis Tournament
final tennisDoubles = Game(
  id: 'game_tennis_doubles_002',
  organizerId: 'usr_player_456',
  sportId: 'sport_tennis',
  title: 'Weekend Doubles Tournament',
  description: 'Mini tournament with 4 teams. Prizes for winners!',
  gameType: 'doubles',
  skillLevel: 'intermediate',
  status: GameStatus.published,
  startTime: DateTime.now().add(Duration(days: 5, hours: 9)),
  endTime: DateTime.now().add(Duration(days: 5, hours: 17)),
  venueId: 'venue_mumbai_tennis_001',
  venueName: 'Mumbai Tennis Club',
  venueAddress: 'Marine Drive, Mumbai, Maharashtra 400001',
  latitude: 18.9220,
  longitude: 72.8347,
  capacity: 8,
  currentPlayers: 3,
  playerIds: ['usr_player_456', 'usr_player_789', 'usr_player_101'],
  entryFee: 2500.0,
  currency: 'INR',
  rules: [
    'Round robin format',
    'Best of 3 sets for finals',
    'Tournament rules apply'
  ],
  equipmentProvided: ['Tennis balls', 'Umpire', 'Refreshments'],
  prizes: ['Winner: ₹10,000', 'Runner-up: ₹5,000'],
  isPublic: true,
  allowWaitlist: true,
  registrationDeadline: DateTime.now().add(Duration(days: 3)),
  tags: ['tournament', 'doubles', 'weekend', 'prizes'],
  createdAt: DateTime.now(),
);
```

### Badminton Game Examples

```dart
// Casual Badminton Doubles
final badmintonDoubles = Game(
  id: 'game_badminton_doubles_001',
  organizerId: 'usr_player_202',
  sportId: 'sport_badminton',
  title: 'Evening Badminton Doubles',
  description: 'Casual doubles game. All skill levels welcome!',
  gameType: 'doubles',
  skillLevel: 'mixed',
  status: GameStatus.published,
  startTime: DateTime.now().add(Duration(days: 1, hours: 19)),
  endTime: DateTime.now().add(Duration(days: 1, hours: 21)),
  venueId: 'venue_bangalore_badminton_001',
  venueName: 'Bangalore Badminton Academy',
  venueAddress: 'Koramangala, Bangalore, Karnataka 560034',
  latitude: 12.9279,
  longitude: 77.6271,
  capacity: 4,
  currentPlayers: 2,
  playerIds: ['usr_player_202', 'usr_player_303'],
  entryFee: 300.0,
  currency: 'INR',
  rules: [
    'First to 21 points',
    'Best of 3 games',
    'Fun and friendly atmosphere'
  ],
  equipmentProvided: ['Shuttlecocks', 'Court lighting'],
  equipmentRequired: ['Badminton racket', 'Non-marking shoes'],
  isPublic: true,
  allowWaitlist: false,
  tags: ['casual', 'doubles', 'evening', 'friendly'],
  createdAt: DateTime.now(),
);

// Badminton Coaching Session
final badmintonCoaching = Game(
  id: 'game_badminton_coaching_002',
  organizerId: 'usr_trainer_404',
  sportId: 'sport_badminton',
  title: 'Badminton Skills Training',
  description: 'Group coaching session focusing on footwork and smash technique',
  gameType: 'training',
  skillLevel: 'beginner',
  status: GameStatus.published,
  startTime: DateTime.now().add(Duration(days: 3, hours: 17)),
  endTime: DateTime.now().add(Duration(days: 3, hours: 18, minutes: 30)),
  venueId: 'venue_bangalore_badminton_001',
  venueName: 'Bangalore Badminton Academy',
  venueAddress: 'Koramangala, Bangalore, Karnataka 560034',
  latitude: 12.9279,
  longitude: 77.6271,
  capacity: 6,
  currentPlayers: 1,
  playerIds: ['usr_trainer_404'],
  entryFee: 800.0,
  currency: 'INR',
  sessionType: 'group_training',
  coachId: 'usr_trainer_404',
  coachName: 'Priya Sharma',
  trainingFocus: ['Footwork', 'Smash technique', 'Court positioning'],
  equipmentProvided: ['Shuttlecocks', 'Training aids', 'Video analysis'],
  isPublic: true,
  tags: ['training', 'coaching', 'beginner', 'skills'],
  createdAt: DateTime.now(),
);
```

### Football Game Examples

```dart
// 5-a-side Football
final football5v5 = Game(
  id: 'game_football_5v5_001',
  organizerId: 'usr_player_505',
  sportId: 'sport_football',
  title: '5v5 Football Match',
  description: 'Quick 5-a-side game. High intensity, lots of fun!',
  gameType: '5v5',
  skillLevel: 'intermediate',
  status: GameStatus.published,
  startTime: DateTime.now().add(Duration(days: 1, hours: 20)),
  endTime: DateTime.now().add(Duration(days: 1, hours: 21)),
  venueId: 'venue_delhi_football_001',
  venueName: 'Delhi Football Arena',
  venueAddress: 'Connaught Place, New Delhi, Delhi 110001',
  latitude: 28.6315,
  longitude: 77.2167,
  capacity: 10,
  currentPlayers: 6,
  playerIds: ['usr_player_505', 'usr_player_606', 'usr_player_707', 
             'usr_player_808', 'usr_player_909', 'usr_player_010'],
  entryFee: 400.0,
  currency: 'INR',
  rules: [
    '45 minutes total',
    'Rolling substitutions',
    'No slide tackles'
  ],
  equipmentProvided: ['Football', 'Bibs', 'Goals'],
  equipmentRequired: ['Football boots', 'Shin guards'],
  isPublic: true,
  allowWaitlist: true,
  tags: ['5v5', 'quick', 'evening', 'high-intensity'],
  createdAt: DateTime.now(),
);
```

### Swimming Examples

```dart
// Swimming Practice Session
final swimmingPractice = Game(
  id: 'game_swimming_practice_001',
  organizerId: 'usr_swimmer_111',
  sportId: 'sport_swimming',
  title: 'Morning Swimming Practice',
  description: 'Lane swimming practice session. Focus on technique and endurance.',
  gameType: 'practice',
  skillLevel: 'intermediate',
  status: GameStatus.published,
  startTime: DateTime.now().add(Duration(days: 1, hours: 6)),
  endTime: DateTime.now().add(Duration(days: 1, hours: 7, minutes: 30)),
  venueId: 'venue_mumbai_pool_001',
  venueName: 'Mumbai Swimming Pool',
  venueAddress: 'Bandra West, Mumbai, Maharashtra 400050',
  latitude: 19.0596,
  longitude: 72.8295,
  capacity: 8,
  currentPlayers: 3,
  playerIds: ['usr_swimmer_111', 'usr_swimmer_222', 'usr_swimmer_333'],
  entryFee: 200.0,
  currency: 'INR',
  sessionStructure: [
    'Warm-up: 400m easy',
    'Main set: 8x100m technique',
    'Cool down: 200m easy'
  ],
  equipmentProvided: ['Lane ropes', 'Pace clock', 'Kickboards'],
  equipmentRequired: ['Swimsuit', 'Goggles', 'Swimming cap'],
  isPublic: true,
  tags: ['morning', 'practice', 'technique', 'lanes'],
  createdAt: DateTime.now(),
);
```

## Game Participation Examples

### Joining a Game

```dart
// Player joins tennis singles
final participation = GameParticipation(
  id: 'participation_tennis_001',
  gameId: 'game_tennis_singles_001',
  userId: 'usr_player_789',
  status: ParticipationStatus.confirmed,
  joinedAt: DateTime.now(),
  position: 'Player 2',
  skillLevelAtJoin: 'intermediate',
  notes: 'Looking forward to a good match!',
  isPaid: true,
  paidAt: DateTime.now(),
  paymentId: 'pay_tennis_001',
  emergencyContactName: 'Spouse Name',
  emergencyContactPhone: '+91-9876543210',
  hasReadRules: true,
  agreedToTerms: true,
  createdAt: DateTime.now(),
);

// Doubles partner joining
final doublesParticipation = GameParticipation(
  id: 'participation_tennis_doubles_001',
  gameId: 'game_tennis_doubles_002',
  userId: 'usr_player_888',
  status: ParticipationStatus.confirmed,
  joinedAt: DateTime.now(),
  position: 'Player 4',
  partnerUserId: 'usr_player_999', // Their doubles partner
  team: 'Team B',
  skillLevelAtJoin: 'intermediate',
  isPaid: true,
  paidAt: DateTime.now(),
  createdAt: DateTime.now(),
);

// Waitlisted participation
final waitlistedParticipation = GameParticipation(
  id: 'participation_waitlist_001',
  gameId: 'game_tennis_singles_001',
  userId: 'usr_player_999',
  status: ParticipationStatus.waitlisted,
  joinedAt: DateTime.now(),
  waitlistPosition: 1,
  notifyOnOpening: true,
  isPaid: false,
  createdAt: DateTime.now(),
);
```

### Game Invitation Examples

```dart
// Direct game invitation
final directInvite = GameInvite(
  id: 'invite_direct_001',
  gameId: 'game_tennis_singles_001',
  inviterId: 'usr_player_123',
  inviteeId: 'usr_player_456',
  status: InviteStatus.pending,
  message: 'Hey! Want to play tennis tomorrow evening? You mentioned you\'re looking for games!',
  sentAt: DateTime.now(),
  expiresAt: DateTime.now().add(Duration(days: 1)),
  inviteType: 'direct',
  reminderSent: false,
  createdAt: DateTime.now(),
);

// Group invitation for tournament
final tournamentInvite = GameInvite(
  id: 'invite_tournament_001',
  gameId: 'game_tennis_doubles_002',
  inviterId: 'usr_player_456',
  inviteeId: 'usr_player_777',
  status: InviteStatus.pending,
  message: 'Join our weekend doubles tournament! It\'s going to be competitive and fun.',
  sentAt: DateTime.now(),
  expiresAt: DateTime.now().add(Duration(days: 3)),
  inviteType: 'tournament',
  additionalInfo: 'Prize money: ₹15,000 total',
  reminderSent: false,
  createdAt: DateTime.now(),
);

// Accepted invitation
final acceptedInvite = GameInvite(
  id: 'invite_accepted_001',
  gameId: 'game_badminton_doubles_001',
  inviterId: 'usr_player_202',
  inviteeId: 'usr_player_888',
  status: InviteStatus.accepted,
  message: 'Want to play badminton tomorrow?',
  sentAt: DateTime.now().subtract(Duration(hours: 2)),
  acceptedAt: DateTime.now(),
  expiresAt: DateTime.now().add(Duration(hours: 22)),
  response: 'Yes! See you at 7 PM.',
  createdAt: DateTime.now().subtract(Duration(hours: 2)),
);

// Declined invitation
final declinedInvite = GameInvite(
  id: 'invite_declined_001',
  gameId: 'game_football_5v5_001',
  inviterId: 'usr_player_505',
  inviteeId: 'usr_player_999',
  status: InviteStatus.declined,
  message: 'Join our 5v5 football match!',
  sentAt: DateTime.now().subtract(Duration(hours: 6)),
  declinedAt: DateTime.now().subtract(Duration(hours: 1)),
  expiresAt: DateTime.now().add(Duration(hours: 18)),
  response: 'Thanks for the invite! I have a prior commitment.',
  createdAt: DateTime.now().subtract(Duration(hours: 6)),
);
```

## Game Management Examples

### Creating Games

```dart
// Create a recurring tennis practice
Future<List<Game>> createRecurringTennisPractice({
  required String organizerId,
  required String venueId,
  required DateTime startDate,
  required int weeks,
}) async {
  final games = <Game>[];
  
  for (int i = 0; i < weeks; i++) {
    final gameDate = startDate.add(Duration(days: i * 7));
    
    final game = Game(
      id: 'game_tennis_practice_week_${i + 1}',
      organizerId: organizerId,
      sportId: 'sport_tennis',
      title: 'Weekly Tennis Practice - Week ${i + 1}',
      description: 'Regular practice session to improve skills',
      gameType: 'practice',
      skillLevel: 'mixed',
      status: GameStatus.published,
      startTime: gameDate,
      endTime: gameDate.add(Duration(hours: 2)),
      venueId: venueId,
      capacity: 8,
      currentPlayers: 1,
      playerIds: [organizerId],
      entryFee: 500.0,
      currency: 'INR',
      isPublic: true,
      allowWaitlist: true,
      tags: ['practice', 'weekly', 'recurring'],
      isRecurring: true,
      seriesId: 'series_tennis_practice_001',
      createdAt: DateTime.now(),
    );
    
    games.add(game);
    gameBox.put(game);
  }
  
  return games;
}

// Cancel a game
Future<void> cancelGame(String gameId, String reason) async {
  final game = gameBox.query(Game_.id.equals(gameId)).build().findFirst();
  if (game != null) {
    game.status = GameStatus.cancelled;
    game.cancellationReason = reason;
    game.cancelledAt = DateTime.now();
    game.updatedAt = DateTime.now();
    gameBox.put(game);
    
    // Notify all participants
    final participations = gameParticipationBox.query(
      GameParticipation_.gameId.equals(gameId)
    ).build().find();
    
    for (final participation in participations) {
      // Create notification
      final notification = NotificationModel(
        id: 'notif_game_cancelled_${participation.userId}',
        userId: participation.userId,
        title: 'Game Cancelled',
        body: 'The game "${game.title}" has been cancelled. Reason: $reason',
        type: NotificationType.gameCancellation,
        relatedEntityId: gameId,
        relatedEntityType: 'game',
        createdAt: DateTime.now(),
      );
      notificationBox.put(notification);
    }
  }
}
```

### Game Queries

```dart
// Find games by location and time
Future<List<Game>> findGamesNearby({
  required double latitude,
  required double longitude,
  required double radiusKm,
  DateTime? afterTime,
}) async {
  // Calculate bounding box
  final latRange = radiusKm / 111.0; // Rough conversion
  final lonRange = radiusKm / (111.0 * cos(latitude * pi / 180));
  
  var query = gameBox.query(
    Game_.latitude.between(latitude - latRange, latitude + latRange)
      .and(Game_.longitude.between(longitude - lonRange, longitude + lonRange))
      .and(Game_.dbStatus.equals(GameStatus.published.stableId))
  );
  
  if (afterTime != null) {
    query = query.and(Game_.startTime.greaterThan(afterTime.millisecondsSinceEpoch));
  }
  
  return query.build().find();
}

// Find games user can join
Future<List<Game>> findJoinableGames(String userId) async {
  final user = userBox.query(User_.id.equals(userId)).build().findFirst();
  if (user == null) return [];
  
  // Get user's sport profiles to find preferred sports
  final sportProfiles = userSportProfileBox.query(
    UserSportProfile_.userId.equals(userId)
  ).build().find();
  
  final preferredSports = sportProfiles.map((p) => p.sportId).toList();
  
  return gameBox.query(
    Game_.dbStatus.equals(GameStatus.published.stableId)
      .and(Game_.startTime.greaterThan(DateTime.now().millisecondsSinceEpoch))
      .and(Game_.currentPlayers.lessThan(Game_.capacity))
      .and(Game_.sportId.oneOf(preferredSports))
  ).order(Game_.startTime).build().find();
}

// Get user's upcoming games
Future<List<Game>> getUserUpcomingGames(String userId) async {
  final participations = gameParticipationBox.query(
    GameParticipation_.userId.equals(userId)
      .and(GameParticipation_.dbStatus.oneOf([
        ParticipationStatus.confirmed.stableId,
        ParticipationStatus.pending.stableId
      ]))
  ).build().find();
  
  final gameIds = participations.map((p) => p.gameId).toList();
  
  return gameBox.query(
    Game_.id.oneOf(gameIds)
      .and(Game_.startTime.greaterThan(DateTime.now().millisecondsSinceEpoch))
      .and(Game_.dbStatus.oneOf([
        GameStatus.published.stableId,
        GameStatus.inProgress.stableId
      ]))
  ).order(Game_.startTime).build().find();
}

// Get games organized by user
Future<List<Game>> getUserOrganizedGames(String userId) async {
  return gameBox.query(
    Game_.organizerId.equals(userId)
  ).order(Game_.createdAt, flags: Order.descending)
  .build().find();
}
```

### Game Statistics

```dart
// Get game participation statistics
Future<Map<String, dynamic>> getGameStats(String gameId) async {
  final game = gameBox.query(Game_.id.equals(gameId)).build().findFirst();
  if (game == null) return {};
  
  final participations = gameParticipationBox.query(
    GameParticipation_.gameId.equals(gameId)
  ).build().find();
  
  final invites = gameInviteBox.query(
    GameInvite_.gameId.equals(gameId)
  ).build().find();
  
  return {
    'totalCapacity': game.capacity,
    'currentPlayers': game.currentPlayers,
    'spotsRemaining': game.capacity - game.currentPlayers,
    'totalParticipations': participations.length,
    'confirmedParticipants': participations.where((p) => 
      p.status == ParticipationStatus.confirmed).length,
    'waitlistedParticipants': participations.where((p) => 
      p.status == ParticipationStatus.waitlisted).length,
    'totalInvites': invites.length,
    'pendingInvites': invites.where((i) => 
      i.status == InviteStatus.pending).length,
    'acceptedInvites': invites.where((i) => 
      i.status == InviteStatus.accepted).length,
    'revenue': participations.where((p) => p.isPaid).length * game.entryFee,
  };
}

// Get user's game history
Future<Map<String, dynamic>> getUserGameHistory(String userId) async {
  final participations = gameParticipationBox.query(
    GameParticipation_.userId.equals(userId)
      .and(GameParticipation_.dbStatus.equals(ParticipationStatus.confirmed.stableId))
  ).build().find();
  
  final gameIds = participations.map((p) => p.gameId).toList();
  final games = gameBox.query(Game_.id.oneOf(gameIds)).build().find();
  
  // Group by sport
  final sportStats = <String, Map<String, dynamic>>{};
  for (final game in games) {
    if (!sportStats.containsKey(game.sportId)) {
      sportStats[game.sportId] = {
        'totalGames': 0,
        'totalHours': 0.0,
        'totalSpent': 0.0,
        'skillLevels': <String>{},
      };
    }
    
    final stats = sportStats[game.sportId]!;
    stats['totalGames'] += 1;
    stats['totalHours'] += game.endTime.difference(game.startTime).inMinutes / 60.0;
    stats['totalSpent'] += game.entryFee;
    (stats['skillLevels'] as Set<String>).add(game.skillLevel);
  }
  
  return {
    'totalGames': games.length,
    'totalSports': sportStats.length,
    'sportBreakdown': sportStats,
    'averageGamesPerMonth': games.length / 12, // Rough calculation
    'totalSpent': games.fold(0.0, (sum, game) => sum + game.entryFee),
  };
}
```

This comprehensive example file demonstrates how to work with all game-related models in the Playo platform, including creation, participation management, invitations, and analytics.
