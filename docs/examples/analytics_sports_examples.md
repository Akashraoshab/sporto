# Analytics & Sports Model Examples

This file contains practical examples for analytics, sports, and related models in Playo.

## User Analytics Examples

### Comprehensive User Analytics

```dart
// Active Player Analytics
final activePlayerAnalytics = UserAnalytics(
  id: 'analytics_player_active_001',
  userId: 'usr_player_123',
  
  // Game Statistics
  totalGamesPlayed: 156,
  totalGamesWon: 98,
  totalGamesLost: 58,
  winRate: 62.8, // Calculated percentage
  averageRating: 4.3,
  
  // Training Statistics
  totalTrainingSessions: 24,
  totalTrainingHours: 36.0,
  averageSessionRating: 4.5,
  
  // Venue Usage
  totalVenueBookings: 45,
  favoriteVenueId: 'venue_mumbai_tennis_001',
  totalVenueHours: 120.0,
  
  // Social Statistics
  totalFriends: 34,
  totalGameInvitesSent: 67,
  totalGameInvitesReceived: 89,
  totalGameInvitesAccepted: 45,
  
  // Activity Tracking
  currentActiveStreak: 8, // Days with activity
  longestActiveStreak: 23,
  lastActiveDate: DateTime.now().subtract(Duration(hours: 6)),
  
  // Monthly Performance
  monthlyGames: 12,
  monthlyTrainingSessions: 3,
  monthlySpending: 18500.0,
  monthlyHoursPlayed: 24.0,
  
  // Achievement Progress
  totalAchievements: 12,
  achievementPoints: 2450,
  currentLevel: 15,
  experiencePoints: 8750,
  
  // Performance Trends
  performanceTrend: 'improving', // improving, declining, stable
  skillProgressRate: 0.15, // Monthly improvement rate
  
  // Financial
  totalSpent: 145000.0,
  averageGameCost: 930.0,
  currency: 'INR',
  
  lastUpdated: DateTime.now(),
  createdAt: DateTime.now().subtract(Duration(days: 365)),
);

// Beginner Player Analytics
final beginnerAnalytics = UserAnalytics(
  id: 'analytics_beginner_002',
  userId: 'usr_beginner_456',
  
  totalGamesPlayed: 8,
  totalGamesWon: 3,
  totalGamesLost: 5,
  winRate: 37.5,
  averageRating: 3.2,
  
  totalTrainingSessions: 12,
  totalTrainingHours: 18.0,
  averageSessionRating: 4.1,
  
  totalVenueBookings: 5,
  totalVenueHours: 12.0,
  
  totalFriends: 7,
  totalGameInvitesSent: 3,
  totalGameInvitesReceived: 12,
  totalGameInvitesAccepted: 8,
  
  currentActiveStreak: 3,
  longestActiveStreak: 5,
  lastActiveDate: DateTime.now().subtract(Duration(hours: 18)),
  
  monthlyGames: 4,
  monthlyTrainingSessions: 4,
  monthlySpending: 8500.0,
  monthlyHoursPlayed: 6.0,
  
  totalAchievements: 3,
  achievementPoints: 450,
  currentLevel: 3,
  experiencePoints: 780,
  
  performanceTrend: 'improving',
  skillProgressRate: 0.25,
  
  totalSpent: 24500.0,
  averageGameCost: 800.0,
  currency: 'INR',
  
  lastUpdated: DateTime.now(),
  createdAt: DateTime.now().subtract(Duration(days: 90)),
);

// Trainer Analytics
final trainerAnalytics = UserAnalytics(
  id: 'analytics_trainer_003',
  userId: 'usr_trainer_789',
  
  // Training-focused metrics
  totalTrainingSessions: 245, // Sessions conducted
  totalTrainingHours: 367.5,
  averageSessionRating: 4.7,
  
  // Business metrics
  totalStudents: 89,
  activeStudents: 34,
  studentRetentionRate: 78.5,
  averageStudentSessions: 8.2,
  
  // Revenue
  monthlyEarnings: 125000.0,
  totalEarnings: 1450000.0,
  averageSessionPrice: 3200.0,
  
  // Performance
  currentActiveStreak: 45, // Days active
  longestActiveStreak: 89,
  lastActiveDate: DateTime.now().subtract(Duration(hours: 2)),
  
  // Reviews and ratings
  totalReviews: 127,
  averageRating: 4.7,
  
  totalAchievements: 18,
  achievementPoints: 4200,
  currentLevel: 25,
  experiencePoints: 12500,
  
  currency: 'INR',
  
  lastUpdated: DateTime.now(),
  createdAt: DateTime.now().subtract(Duration(days: 1200)),
);
```

### Sport-Specific User Statistics

```dart
// Tennis Statistics - Advanced Player
final advancedTennisStats = UserSportStats(
  id: 'stats_tennis_advanced_001',
  userId: 'usr_player_123',
  sportId: 'sport_tennis',
  
  skillLevel: UserSkillLevel.advanced,
  skillRating: 7.2, // Out of 10
  
  // Match Statistics
  totalMatches: 89,
  wins: 56,
  losses: 33,
  winRate: 62.9,
  
  // Performance Ratings
  averagePerformanceRating: 4.4,
  bestPerformanceRating: 4.9,
  consistencyScore: 0.82, // How consistent ratings are
  
  // Achievements
  mvpCount: 12, // Most Valuable Player awards
  tournamentWins: 3,
  tournamentAppearances: 8,
  
  // Play Time
  totalHoursPlayed: 134.0,
  averageMatchDuration: 90.0, // minutes
  
  // Progression
  firstGameDate: DateTime.now().subtract(Duration(days: 450)),
  lastGameDate: DateTime.now().subtract(Duration(days: 3)),
  
  skillProgression: [
    {'date': '2023-01-01', 'rating': 6.2},
    {'date': '2023-06-01', 'rating': 6.8},
    {'date': '2023-12-01', 'rating': 7.2}
  ],
  
  // Opponents and Partners
  favoriteOpponentId: 'usr_player_456',
  preferredPartnerIds: ['usr_player_789', 'usr_player_101'],
  
  // Performance by Game Type
  singlesRecord: {'wins': 32, 'losses': 18},
  doublesRecord: {'wins': 24, 'losses': 15},
  
  // Performance by Venue
  bestVenueId: 'venue_mumbai_tennis_001',
  bestVenueWinRate: 75.0,
  
  // Recent Form
  last10GamesRecord: {'wins': 7, 'losses': 3},
  currentForm: 'excellent', // poor, average, good, excellent
  
  lastUpdated: DateTime.now(),
  createdAt: DateTime.now().subtract(Duration(days: 450)),
);

// Badminton Statistics - Intermediate Player
final intermediateBadmintonStats = UserSportStats(
  id: 'stats_badminton_intermediate_002',
  userId: 'usr_player_456',
  sportId: 'sport_badminton',
  
  skillLevel: UserSkillLevel.intermediate,
  skillRating: 5.8,
  
  totalMatches: 45,
  wins: 28,
  losses: 17,
  winRate: 62.2,
  
  averagePerformanceRating: 4.1,
  bestPerformanceRating: 4.7,
  consistencyScore: 0.76,
  
  mvpCount: 4,
  tournamentWins: 1,
  tournamentAppearances: 3,
  
  totalHoursPlayed: 67.5,
  averageMatchDuration: 45.0,
  
  firstGameDate: DateTime.now().subtract(Duration(days: 240)),
  lastGameDate: DateTime.now().subtract(Duration(days: 1)),
  
  skillProgression: [
    {'date': '2023-05-01', 'rating': 5.2},
    {'date': '2023-08-01', 'rating': 5.5},
    {'date': '2024-01-01', 'rating': 5.8}
  ],
  
  favoriteOpponentId: 'usr_player_789',
  preferredPartnerIds: ['usr_player_123'],
  
  singlesRecord: {'wins': 12, 'losses': 8},
  doublesRecord: {'wins': 16, 'losses': 9},
  
  last10GamesRecord: {'wins': 6, 'losses': 4},
  currentForm: 'good',
  
  lastUpdated: DateTime.now(),
  createdAt: DateTime.now().subtract(Duration(days: 240)),
);

// Swimming Statistics - Fitness Swimmer
final swimmingStats = UserSportStats(
  id: 'stats_swimming_fitness_003',
  userId: 'usr_swimmer_789',
  sportId: 'sport_swimming',
  
  skillLevel: UserSkillLevel.intermediate,
  skillRating: 6.1,
  
  // Swimming-specific metrics
  totalSessions: 78,
  totalDistance: 156000.0, // meters
  averageSessionDistance: 2000.0,
  
  // Time improvements
  freestyle100mBest: 72.5, // seconds
  backstroke100mBest: 78.2,
  breaststroke100mBest: 85.1,
  butterfly100mBest: 82.7,
  
  // Endurance
  longestSwim: 5000.0, // meters
  averageSessionDuration: 45.0, // minutes
  
  totalHoursPlayed: 58.5,
  
  firstGameDate: DateTime.now().subtract(Duration(days: 180)),
  lastGameDate: DateTime.now().subtract(Duration(days: 2)),
  
  // Stroke preferences
  preferredStroke: 'freestyle',
  strokeDistribution: {
    'freestyle': 60,
    'backstroke': 20,
    'breaststroke': 15,
    'butterfly': 5
  },
  
  averagePerformanceRating: 4.3,
  bestPerformanceRating: 4.8,
  
  last10SessionsImprovement: 8.5, // percentage improvement
  currentForm: 'excellent',
  
  lastUpdated: DateTime.now(),
  createdAt: DateTime.now().subtract(Duration(days: 180)),
);
```

### Achievement System Examples

```dart
// Game-Related Achievements
final firstWinAchievement = Achievement(
  id: 'ach_first_win',
  name: 'First Victory',
  description: 'Win your first game on Playo',
  icon: '🏆',
  category: AchievementCategory.games,
  rarity: AchievementRarity.common,
  points: 100,
  
  criteria: jsonEncode({
    'type': 'game_win',
    'count': 1,
    'any_sport': true
  }),
  
  reward: 'Welcome bonus: ₹100 credit',
  
  isActive: true,
  displayOrder: 1,
  
  createdAt: DateTime.now().subtract(Duration(days: 365)),
);

final winningStreakAchievement = Achievement(
  id: 'ach_winning_streak_5',
  name: 'Unstoppable',
  description: 'Win 5 games in a row',
  icon: '🔥',
  category: AchievementCategory.games,
  rarity: AchievementRarity.rare,
  points: 500,
  
  criteria: jsonEncode({
    'type': 'consecutive_wins',
    'count': 5,
    'any_sport': true
  }),
  
  reward: 'Free venue booking (up to ₹2000)',
  
  isActive: true,
  displayOrder: 5,
  
  createdAt: DateTime.now().subtract(Duration(days: 300)),
);

// Social Achievements
final socialButterflyAchievement = Achievement(
  id: 'ach_social_butterfly',
  name: 'Social Butterfly',
  description: 'Connect with 25 players',
  icon: '🦋',
  category: AchievementCategory.social,
  rarity: AchievementRarity.uncommon,
  points: 250,
  
  criteria: jsonEncode({
    'type': 'connections',
    'count': 25,
    'status': 'connected'
  }),
  
  reward: 'Special social badge',
  
  isActive: true,
  displayOrder: 3,
  
  createdAt: DateTime.now().subtract(Duration(days: 200)),
);

// Training Achievements
final dedicatedLearnerAchievement = Achievement(
  id: 'ach_dedicated_learner',
  name: 'Dedicated Learner',
  description: 'Complete 10 training sessions',
  icon: '📚',
  category: AchievementCategory.training,
  rarity: AchievementRarity.common,
  points: 200,
  
  criteria: jsonEncode({
    'type': 'training_sessions',
    'count': 10,
    'status': 'completed'
  }),
  
  reward: '20% discount on next training session',
  
  isActive: true,
  displayOrder: 2,
  
  createdAt: DateTime.now().subtract(Duration(days: 250)),
);

// Skill-Based Achievements
final skillMasterAchievement = Achievement(
  id: 'ach_skill_master_tennis',
  name: 'Tennis Master',
  description: 'Reach advanced skill level in tennis',
  icon: '🎾',
  category: AchievementCategory.skill,
  rarity: AchievementRarity.epic,
  points: 1000,
  
  criteria: jsonEncode({
    'type': 'skill_level',
    'sport': 'tennis',
    'level': 'advanced',
    'minimum_games': 50
  }),
  
  reward: 'Exclusive tennis master badge and gear discount',
  
  isActive: true,
  displayOrder: 10,
  
  createdAt: DateTime.now().subtract(Duration(days: 100)),
);

// Special Event Achievements
final tournamentChampionAchievement = Achievement(
  id: 'ach_tournament_champion',
  name: 'Tournament Champion',
  description: 'Win an official tournament',
  icon: '👑',
  category: AchievementCategory.tournaments,
  rarity: AchievementRarity.legendary,
  points: 2000,
  
  criteria: jsonEncode({
    'type': 'tournament_win',
    'count': 1,
    'official': true
  }),
  
  reward: 'Championship trophy and ₹5000 credit',
  
  isActive: true,
  displayOrder: 15,
  
  createdAt: DateTime.now().subtract(Duration(days: 50)),
);
```

### User Achievement Tracking

```dart
// User's Unlocked Achievement
final userFirstWin = UserAchievement(
  id: 'user_ach_first_win_001',
  userId: 'usr_player_123',
  achievementId: 'ach_first_win',
  
  progress: 1, // Current progress
  requiredProgress: 1, // Required for completion
  isCompleted: true,
  completedAt: DateTime.now().subtract(Duration(days: 120)),
  
  triggerGameId: 'game_tennis_first_win', // What triggered the achievement
  triggerData: jsonEncode({
    'sport': 'tennis',
    'opponent': 'usr_player_456',
    'score': '6-4, 6-3'
  }),
  
  pointsEarned: 100,
  rewardClaimed: true,
  rewardClaimedAt: DateTime.now().subtract(Duration(days: 120)),
  
  createdAt: DateTime.now().subtract(Duration(days: 120)),
);

// Achievement in Progress
final userWinningStreak = UserAchievement(
  id: 'user_ach_streak_002',
  userId: 'usr_player_123',
  achievementId: 'ach_winning_streak_5',
  
  progress: 3, // 3 out of 5 wins
  requiredProgress: 5,
  isCompleted: false,
  
  progressHistory: [
    {'date': '2024-01-15', 'progress': 1},
    {'date': '2024-01-18', 'progress': 2},
    {'date': '2024-01-22', 'progress': 3}
  ],
  
  lastProgressUpdate: DateTime.now().subtract(Duration(days: 2)),
  
  createdAt: DateTime.now().subtract(Duration(days: 10)),
);
```

## Sport Model Examples

### Sport Definitions

```dart
// Tennis Sport
final tennis = Sport(
  id: 'sport_tennis',
  name: 'Tennis',
  description: 'Racket sport played on a rectangular court with a net across the middle',
  shortDescription: 'Racket sport with net',
  
  iconUrl: 'https://sport-icons.com/tennis.svg',
  imageUrl: 'https://sport-images.com/tennis-court.jpg',
  
  category: SportCategory.racket,
  aliases: ['Lawn Tennis', 'Court Tennis'],
  
  // Gameplay Details
  skillLevels: ['Beginner', 'Intermediate', 'Advanced', 'Professional'],
  gameTypes: ['Singles', 'Doubles', 'Mixed Doubles'],
  positions: ['Server', 'Receiver', 'Net Player', 'Baseline Player'],
  
  // Player Requirements
  minPlayers: 2,
  maxPlayers: 4,
  idealPlayers: 2,
  
  // Time and Duration
  typicalDurationMinutes: 90,
  minDurationMinutes: 45,
  maxDurationMinutes: 240,
  
  // Equipment
  equipmentRequired: [
    'Tennis Racket',
    'Tennis Balls',
    'Tennis Shoes (non-marking)',
    'Appropriate Sportswear'
  ],
  equipmentOptional: [
    'Wristbands',
    'Headband',
    'Overgrip',
    'Vibration Dampener'
  ],
  
  // Rules and Scoring
  scoringSystem: 'Traditional tennis scoring (15-30-40-game)',
  basicRules: [
    'Best of 3 or 5 sets',
    'First to 6 games wins a set',
    'Must win by 2 games or play tiebreak at 6-6',
    'Ball must land within court boundaries',
    'Players alternate serves every game'
  ],
  
  // Court Requirements
  courtType: 'Tennis Court',
  courtDimensions: '23.77m x 10.97m',
  surfaceTypes: ['Hard Court', 'Clay Court', 'Grass Court', 'Carpet'],
  
  // Physical Requirements
  fitnessLevel: 'Moderate to High',
  primarySkills: [
    'Hand-eye coordination',
    'Agility',
    'Endurance',
    'Strategic thinking'
  ],
  
  // Popularity and Activity
  popularityScore: 95,
  difficultyLevel: 7, // Out of 10
  learningCurve: 'Moderate',
  
  // Seasonal Information
  seasonality: 'Year-round',
  weatherDependency: 'Outdoor courts weather dependent',
  indoorPlayable: true,
  
  // Age Groups
  suitableAgeGroups: ['Kids (8+)', 'Juniors', 'Adults', 'Seniors'],
  peakAgeRange: '16-35',
  
  // Business Information
  averageCostPerSession: 1500.0,
  currency: 'INR',
  
  // Administrative
  isActive: true,
  isCompetitive: true,
  hasOfficialRules: true,
  governingBody: 'International Tennis Federation (ITF)',
  
  tags: ['racket', 'court', 'individual', 'doubles', 'olympic'],
  
  createdAt: DateTime.now().subtract(Duration(days: 1000)),
);

// Badminton Sport
final badminton = Sport(
  id: 'sport_badminton',
  name: 'Badminton',
  description: 'Racket sport played with shuttlecock over a high net',
  shortDescription: 'Fast-paced racket sport',
  
  iconUrl: 'https://sport-icons.com/badminton.svg',
  imageUrl: 'https://sport-images.com/badminton-court.jpg',
  
  category: SportCategory.racket,
  aliases: ['Shuttlecock', 'Birdie Game'],
  
  skillLevels: ['Beginner', 'Intermediate', 'Advanced', 'Professional'],
  gameTypes: ['Singles', 'Doubles', 'Mixed Doubles'],
  positions: ['Front Court', 'Back Court', 'All Court'],
  
  minPlayers: 2,
  maxPlayers: 4,
  idealPlayers: 4,
  
  typicalDurationMinutes: 45,
  minDurationMinutes: 20,
  maxDurationMinutes: 90,
  
  equipmentRequired: [
    'Badminton Racket',
    'Shuttlecocks',
    'Non-marking Shoes',
    'Comfortable Clothing'
  ],
  equipmentOptional: [
    'Wristbands',
    'Knee Support',
    'Ankle Support'
  ],
  
  scoringSystem: 'Rally point system (21 points)',
  basicRules: [
    'First to 21 points wins a game',
    'Best of 3 games',
    'Must win by 2 points',
    'Shuttlecock must not touch the ground',
    'Players alternate serves'
  ],
  
  courtType: 'Badminton Court',
  courtDimensions: '13.4m x 6.1m',
  surfaceTypes: ['Wooden', 'Synthetic', 'PVC'],
  
  fitnessLevel: 'Moderate to High',
  primarySkills: [
    'Quick reflexes',
    'Agility',
    'Wrist action',
    'Court positioning'
  ],
  
  popularityScore: 85,
  difficultyLevel: 6,
  learningCurve: 'Easy to Moderate',
  
  seasonality: 'Year-round',
  weatherDependency: 'Indoor sport',
  indoorPlayable: true,
  
  suitableAgeGroups: ['Kids (6+)', 'Juniors', 'Adults', 'Seniors'],
  peakAgeRange: '12-40',
  
  averageCostPerSession: 800.0,
  currency: 'INR',
  
  isActive: true,
  isCompetitive: true,
  hasOfficialRules: true,
  governingBody: 'Badminton World Federation (BWF)',
  
  tags: ['racket', 'indoor', 'fast-paced', 'shuttlecock', 'olympic'],
  
  createdAt: DateTime.now().subtract(Duration(days: 950)),
);

// Football (Soccer) Sport
final football = Sport(
  id: 'sport_football',
  name: 'Football',
  description: 'Team sport played with a spherical ball between two teams of eleven players',
  shortDescription: 'World\'s most popular team sport',
  
  iconUrl: 'https://sport-icons.com/football.svg',
  imageUrl: 'https://sport-images.com/football-field.jpg',
  
  category: SportCategory.team,
  aliases: ['Soccer', 'Association Football'],
  
  skillLevels: ['Beginner', 'Intermediate', 'Advanced', 'Professional'],
  gameTypes: ['11v11', '7v7', '5v5', 'Futsal'],
  positions: [
    'Goalkeeper', 'Defender', 'Midfielder', 'Forward',
    'Center Back', 'Full Back', 'Winger', 'Striker'
  ],
  
  minPlayers: 10, // 5v5 minimum
  maxPlayers: 22, // 11v11
  idealPlayers: 22,
  
  typicalDurationMinutes: 90,
  minDurationMinutes: 30, // For smaller formats
  maxDurationMinutes: 120, // With extra time
  
  equipmentRequired: [
    'Football',
    'Football Boots',
    'Shin Guards',
    'Jersey and Shorts',
    'Socks'
  ],
  equipmentOptional: [
    'Gloves (for goalkeepers)',
    'Captain\'s Armband',
    'Headband'
  ],
  
  scoringSystem: 'Goals scored',
  basicRules: [
    'Score by getting ball into opponent\'s goal',
    'No hands allowed (except goalkeeper)',
    'Offside rule applies',
    '11 players per team (full game)',
    'Referee controls the match'
  ],
  
  courtType: 'Football Field',
  courtDimensions: '100-110m x 64-75m',
  surfaceTypes: ['Natural Grass', 'Artificial Turf', 'Indoor Court'],
  
  fitnessLevel: 'High',
  primarySkills: [
    'Ball control',
    'Passing',
    'Shooting',
    'Stamina',
    'Teamwork'
  ],
  
  popularityScore: 100,
  difficultyLevel: 5,
  learningCurve: 'Easy to start, hard to master',
  
  seasonality: 'Year-round',
  weatherDependency: 'Can be weather dependent',
  indoorPlayable: true,
  
  suitableAgeGroups: ['Kids (5+)', 'Juniors', 'Adults', 'Seniors'],
  peakAgeRange: '16-30',
  
  averageCostPerSession: 500.0,
  currency: 'INR',
  
  isActive: true,
  isCompetitive: true,
  hasOfficialRules: true,
  governingBody: 'FIFA (Fédération Internationale de Football Association)',
  
  tags: ['team', 'outdoor', 'popular', 'olympic', 'world-cup'],
  
  createdAt: DateTime.now().subtract(Duration(days: 800)),
);

// Swimming Sport
final swimming = Sport(
  id: 'sport_swimming',
  name: 'Swimming',
  description: 'Individual or team racing sport that requires the use of arms and legs to move the body through water',
  shortDescription: 'Aquatic sport and exercise',
  
  iconUrl: 'https://sport-icons.com/swimming.svg',
  imageUrl: 'https://sport-images.com/swimming-pool.jpg',
  
  category: SportCategory.individual,
  aliases: ['Aquatics', 'Swimming Sports'],
  
  skillLevels: ['Beginner', 'Intermediate', 'Advanced', 'Competitive'],
  gameTypes: ['Freestyle', 'Backstroke', 'Breaststroke', 'Butterfly', 'Medley'],
  positions: ['Lane Swimmer', 'Distance Swimmer', 'Sprinter'],
  
  minPlayers: 1,
  maxPlayers: 8, // Per lane/heat
  idealPlayers: 1,
  
  typicalDurationMinutes: 60,
  minDurationMinutes: 30,
  maxDurationMinutes: 120,
  
  equipmentRequired: [
    'Swimsuit',
    'Swimming Goggles',
    'Swimming Cap'
  ],
  equipmentOptional: [
    'Kickboard',
    'Pull Buoy',
    'Fins',
    'Hand Paddles',
    'Snorkel'
  ],
  
  scoringSystem: 'Time-based (fastest time wins)',
  basicRules: [
    'Stay in designated lane',
    'Follow stroke techniques',
    'Touch wall at turns',
    'No interference with other swimmers',
    'Follow pool safety rules'
  ],
  
  courtType: 'Swimming Pool',
  courtDimensions: '25m or 50m length, 2m+ lanes',
  surfaceTypes: ['Chlorinated Pool', 'Salt Water Pool', 'Open Water'],
  
  fitnessLevel: 'Low to High (adjustable)',
  primarySkills: [
    'Stroke technique',
    'Breathing control',
    'Endurance',
    'Core strength',
    'Coordination'
  ],
  
  popularityScore: 80,
  difficultyLevel: 4,
  learningCurve: 'Moderate',
  
  seasonality: 'Year-round',
  weatherDependency: 'Indoor pools unaffected',
  indoorPlayable: true,
  
  suitableAgeGroups: ['Kids (3+)', 'Juniors', 'Adults', 'Seniors'],
  peakAgeRange: '8-25',
  
  averageCostPerSession: 300.0,
  currency: 'INR',
  
  isActive: true,
  isCompetitive: true,
  hasOfficialRules: true,
  governingBody: 'World Aquatics (formerly FINA)',
  
  tags: ['individual', 'pool', 'fitness', 'olympic', 'low-impact'],
  
  createdAt: DateTime.now().subtract(Duration(days: 900)),
);
```

### Sport Skill Levels

```dart
// Tennis Skill Levels
final beginnerTennis = SportSkillLevel(
  id: 'skill_tennis_beginner',
  sportId: 'sport_tennis',
  level: 'beginner',
  displayName: 'Beginner',
  description: 'New to tennis, learning basic strokes and rules',
  order: 1,
  
  characteristics: [
    'Learning basic forehand and backhand',
    'Understanding court layout and rules',
    'Developing consistent ball contact',
    'Working on serve motion',
    'Basic scoring knowledge'
  ],
  
  skillRequirements: [
    'Can hit 5 forehands in a row',
    'Can serve into service box',
    'Knows basic scoring',
    'Understands court boundaries'
  ],
  
  typicalGameDuration: 60, // minutes
  recommendedOpponents: ['other beginners'],
  recommendedEquipment: ['oversized racket', 'pressureless balls'],
  
  trainingFocus: [
    'Basic stroke development',
    'Footwork fundamentals',
    'Court positioning',
    'Simple strategy'
  ],
  
  assessmentCriteria: [
    'Stroke consistency',
    'Ball placement',
    'Movement on court',
    'Game understanding'
  ],
  
  isActive: true,
  createdAt: DateTime.now().subtract(Duration(days: 365)),
);

final intermediateTennis = SportSkillLevel(
  id: 'skill_tennis_intermediate',
  sportId: 'sport_tennis',
  level: 'intermediate',
  displayName: 'Intermediate',
  description: 'Comfortable with basic strokes, developing strategy',
  order: 2,
  
  characteristics: [
    'Consistent groundstrokes',
    'Basic volley skills',
    'Developing serve varieties',
    'Understanding tactical play',
    'Can sustain rallies'
  ],
  
  skillRequirements: [
    'Can rally 10+ shots consistently',
    'Has developed second serve',
    'Can approach the net',
    'Understands basic strategy'
  ],
  
  typicalGameDuration: 90,
  recommendedOpponents: ['intermediate players', 'advanced beginners'],
  recommendedEquipment: ['adult-sized racket', 'regular tennis balls'],
  
  trainingFocus: [
    'Shot consistency',
    'Net play development',
    'Serve improvement',
    'Match tactics'
  ],
  
  assessmentCriteria: [
    'Rally consistency',
    'Shot placement',
    'Net play ability',
    'Tactical awareness'
  ],
  
  isActive: true,
  createdAt: DateTime.now().subtract(Duration(days: 365)),
);

final advancedTennis = SportSkillLevel(
  id: 'skill_tennis_advanced',
  sportId: 'sport_tennis',
  level: 'advanced',
  displayName: 'Advanced',
  description: 'Strong all-around game with advanced tactics',
  order: 3,
  
  characteristics: [
    'Powerful and accurate groundstrokes',
    'Confident net play',
    'Variety of serves',
    'Advanced tactical understanding',
    'Competitive match experience'
  ],
  
  skillRequirements: [
    'Can hit winners from baseline',
    'Effective serve and volley',
    'Can construct points',
    'Handles pressure situations'
  ],
  
  typicalGameDuration: 120,
  recommendedOpponents: ['advanced players', 'competitive players'],
  recommendedEquipment: ['premium racket', 'professional balls'],
  
  trainingFocus: [
    'Shot power and precision',
    'Advanced tactics',
    'Mental toughness',
    'Fitness and conditioning'
  ],
  
  assessmentCriteria: [
    'Shot quality',
    'Tactical execution',
    'Mental strength',
    'Competitive results'
  ],
  
  isActive: true,
  createdAt: DateTime.now().subtract(Duration(days: 365)),
);
```

## Analytics Queries and Operations

### Performance Analytics

```dart
// Calculate user's overall performance metrics
Future<Map<String, dynamic>> calculateUserPerformance(String userId) async {
  final analytics = userAnalyticsBox.query(
    UserAnalytics_.userId.equals(userId)
  ).build().findFirst();
  
  if (analytics == null) return {};
  
  final sportStats = userSportStatsBox.query(
    UserSportStats_.userId.equals(userId)
  ).build().find();
  
  return {
    'overall': {
      'games_played': analytics.totalGamesPlayed,
      'win_rate': analytics.winRate,
      'average_rating': analytics.averageRating,
      'active_streak': analytics.currentActiveStreak,
      'total_sports': sportStats.length,
    },
    'by_sport': sportStats.map((stat) => {
      'sport_id': stat.sportId,
      'skill_level': stat.skillLevel.name,
      'matches': stat.totalMatches,
      'win_rate': stat.winRate,
      'skill_rating': stat.skillRating,
      'total_hours': stat.totalHoursPlayed,
    }).toList(),
    'recent_form': {
      'last_10_games': analytics.monthlyGames,
      'performance_trend': analytics.performanceTrend,
      'improvement_rate': analytics.skillProgressRate,
    },
    'social': {
      'total_friends': analytics.totalFriends,
      'invites_sent': analytics.totalGameInvitesSent,
      'invites_accepted': analytics.totalGameInvitesAccepted,
    }
  };
}

// Get sport-specific improvement recommendations
Future<List<String>> getSportImprovementRecommendations(String userId, String sportId) async {
  final sportStats = userSportStatsBox.query(
    UserSportStats_.userId.equals(userId)
      .and(UserSportStats_.sportId.equals(sportId))
  ).build().findFirst();
  
  if (sportStats == null) return [];
  
  final recommendations = <String>[];
  
  // Win rate analysis
  if (sportStats.winRate < 40) {
    recommendations.add('Consider booking training sessions to improve technique');
    recommendations.add('Practice with players of similar skill level');
  } else if (sportStats.winRate > 70) {
    recommendations.add('Challenge yourself with higher-level opponents');
    recommendations.add('Consider entering tournaments');
  }
  
  // Consistency analysis
  if (sportStats.consistencyScore < 0.7) {
    recommendations.add('Focus on consistent practice schedule');
    recommendations.add('Work on basic fundamentals');
  }
  
  // Activity analysis
  final daysSinceLastGame = DateTime.now().difference(sportStats.lastGameDate).inDays;
  if (daysSinceLastGame > 14) {
    recommendations.add('Schedule regular games to maintain skill level');
  }
  
  return recommendations;
}

// Track achievement progress
Future<Map<String, dynamic>> getAchievementProgress(String userId) async {
  final userAchievements = userAchievementBox.query(
    UserAchievement_.userId.equals(userId)
  ).build().find();
  
  final completedCount = userAchievements.where((ua) => ua.isCompleted).length;
  final totalPoints = userAchievements
    .where((ua) => ua.isCompleted)
    .fold(0, (sum, ua) => sum + ua.pointsEarned);
  
  final inProgress = userAchievements
    .where((ua) => !ua.isCompleted && ua.progress > 0)
    .map((ua) => {
      'achievement_id': ua.achievementId,
      'progress': ua.progress,
      'required': ua.requiredProgress,
      'percentage': (ua.progress / ua.requiredProgress * 100).round(),
    }).toList();
  
  return {
    'completed_achievements': completedCount,
    'total_points': totalPoints,
    'in_progress': inProgress,
    'completion_rate': userAchievements.isEmpty ? 0 : 
      (completedCount / userAchievements.length * 100).round(),
  };
}
```

This comprehensive example file demonstrates how to work with all analytics and sports-related models in the Playo platform, including user statistics, achievements, sport definitions, and performance tracking.
