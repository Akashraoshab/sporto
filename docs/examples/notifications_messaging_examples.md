# Notifications & Messaging Examples

This file contains practical examples for all notification, messaging, and payment-related models in Playo.

## Notification Model Examples

### Game-Related Notifications

```dart
// Game Invitation Notification
final gameInviteNotification = NotificationModel(
  id: 'notif_game_invite_001',
  userId: 'usr_player_123',
  title: 'Tennis Game Invitation',
  body: 'Alex invited you to join a tennis doubles match tomorrow at 6 PM at Mumbai Tennis Club',
  type: NotificationType.gameInvite,
  priority: NotificationPriority.high,
  
  // Deep linking
  deepLink: '/game/game_tennis_doubles_002/invite',
  relatedEntityId: 'game_tennis_doubles_002',
  relatedEntityType: 'game',
  
  // Action button
  actionText: 'View Invitation',
  actionUrl: '/game/game_tennis_doubles_002',
  
  // Additional data for the app
  data: {
    'game_id': 'game_tennis_doubles_002',
    'inviter_id': 'usr_player_456',
    'invite_id': 'invite_001',
    'game_start_time': '2024-01-25T18:00:00Z',
    'venue_name': 'Mumbai Tennis Club',
    'sport': 'tennis'
  },
  
  // Metadata
  tags: ['game', 'invitation', 'tennis', 'urgent'],
  category: 'games',
  
  // Status
  isRead: false,
  isDelivered: true,
  deliveredAt: DateTime.now(),
  
  // Scheduling
  scheduledFor: DateTime.now(), // Send immediately
  expiresAt: DateTime.now().add(Duration(days: 2)), // Expires when game starts
  
  createdAt: DateTime.now(),
);

// Game Reminder Notification
final gameReminderNotification = NotificationModel(
  id: 'notif_game_reminder_002',
  userId: 'usr_player_123',
  title: 'Game Starting Soon',
  body: 'Your tennis match starts in 1 hour at Mumbai Tennis Club. Don\'t forget your racket!',
  type: NotificationType.gameReminder,
  priority: NotificationPriority.medium,
  
  deepLink: '/game/game_tennis_singles_001',
  relatedEntityId: 'game_tennis_singles_001',
  relatedEntityType: 'game',
  
  actionText: 'View Game Details',
  
  data: {
    'game_id': 'game_tennis_singles_001',
    'reminder_type': '1_hour_before',
    'venue_address': 'Marine Drive, Mumbai',
    'opponent_name': 'Sarah Johnson'
  },
  
  tags: ['reminder', 'game', 'tennis'],
  category: 'reminders',
  
  isRead: false,
  isDelivered: true,
  deliveredAt: DateTime.now(),
  
  // This was scheduled to be sent 1 hour before game
  scheduledFor: DateTime.now(),
  
  createdAt: DateTime.now().subtract(Duration(hours: 1)),
);

// Game Cancellation Notification
final gameCancellationNotification = NotificationModel(
  id: 'notif_game_cancelled_003',
  userId: 'usr_player_123',
  title: 'Game Cancelled',
  body: 'Unfortunately, the badminton match scheduled for today has been cancelled due to court maintenance. Full refund processed.',
  type: NotificationType.gameCancellation,
  priority: NotificationPriority.high,
  
  deepLink: '/game/game_badminton_001',
  relatedEntityId: 'game_badminton_001',
  relatedEntityType: 'game',
  
  actionText: 'View Refund Details',
  
  data: {
    'game_id': 'game_badminton_001',
    'cancellation_reason': 'Court maintenance',
    'refund_amount': '800.0',
    'refund_id': 'refund_001'
  },
  
  tags: ['cancellation', 'refund', 'badminton'],
  category: 'games',
  
  isRead: false,
  isDelivered: true,
  deliveredAt: DateTime.now(),
  
  createdAt: DateTime.now(),
);

// Game Result Notification
final gameResultNotification = NotificationModel(
  id: 'notif_game_result_004',
  userId: 'usr_player_123',
  title: 'Match Complete - You Won! 🏆',
  body: 'Congratulations! You won your tennis match 6-4, 6-3. Your rating has increased to 4.5.',
  type: NotificationType.gameResult,
  priority: NotificationPriority.medium,
  
  deepLink: '/game/game_tennis_singles_001/result',
  relatedEntityId: 'game_tennis_singles_001',
  relatedEntityType: 'game',
  
  actionText: 'View Match Details',
  
  data: {
    'game_id': 'game_tennis_singles_001',
    'result': 'won',
    'score': '6-4, 6-3',
    'new_rating': '4.5',
    'rating_change': '+0.2',
    'achievements_unlocked': ['ach_winning_streak_3']
  },
  
  tags: ['result', 'win', 'tennis', 'rating-update'],
  category: 'achievements',
  
  isRead: false,
  isDelivered: true,
  deliveredAt: DateTime.now(),
  
  createdAt: DateTime.now(),
);
```

### Training-Related Notifications

```dart
// Training Session Reminder
final trainingReminderNotification = NotificationModel(
  id: 'notif_training_reminder_005',
  userId: 'usr_student_123',
  title: 'Training Session Tomorrow',
  body: 'Your tennis coaching session with Coach Maria is scheduled for tomorrow at 5 PM. Remember to bring water and a towel!',
  type: NotificationType.trainingReminder,
  priority: NotificationPriority.medium,
  
  deepLink: '/training/session_tennis_001',
  relatedEntityId: 'session_tennis_001',
  relatedEntityType: 'training_session',
  
  actionText: 'View Session Details',
  
  data: {
    'session_id': 'session_tennis_001',
    'trainer_name': 'Maria Rodriguez',
    'session_time': '2024-01-25T17:00:00Z',
    'venue_name': 'Mumbai Tennis Academy',
    'session_type': 'one_on_one'
  },
  
  tags: ['training', 'reminder', 'tennis', 'coaching'],
  category: 'training',
  
  isRead: false,
  scheduledFor: DateTime.now().add(Duration(hours: 20)), // 20 hours before session
  
  createdAt: DateTime.now(),
);

// Training Session Completed
final trainingCompleteNotification = NotificationModel(
  id: 'notif_training_complete_006',
  userId: 'usr_student_123',
  title: 'Training Session Complete',
  body: 'Great session today! Coach Maria has shared feedback and practice tips. Check your progress report.',
  type: NotificationType.trainingComplete,
  priority: NotificationPriority.low,
  
  deepLink: '/training/session_tennis_001/feedback',
  relatedEntityId: 'session_tennis_001',
  relatedEntityType: 'training_session',
  
  actionText: 'View Feedback',
  
  data: {
    'session_id': 'session_tennis_001',
    'trainer_name': 'Maria Rodriguez',
    'rating_given': '4.5',
    'feedback_available': true,
    'homework_assigned': true,
    'next_session_recommended': true
  },
  
  tags: ['training', 'feedback', 'completed'],
  category: 'training',
  
  isRead: false,
  isDelivered: true,
  deliveredAt: DateTime.now(),
  
  createdAt: DateTime.now(),
);

// New Training Package Available
final trainingPackageNotification = NotificationModel(
  id: 'notif_training_package_007',
  userId: 'usr_student_123',
  title: 'Special Training Package Available',
  body: 'Coach Maria is offering a 30% discount on 10-session tennis packages. Limited time offer expires in 3 days!',
  type: NotificationType.promotion,
  priority: NotificationPriority.medium,
  
  deepLink: '/trainer/trainer_tennis_pro_001/packages',
  relatedEntityId: 'trainer_tennis_pro_001',
  relatedEntityType: 'trainer',
  
  actionText: 'View Package',
  secondaryActionText: 'Dismiss',
  
  data: {
    'trainer_id': 'trainer_tennis_pro_001',
    'package_type': '10_sessions',
    'discount_percentage': '30',
    'original_price': '40000.0',
    'discounted_price': '28000.0',
    'expires_at': '2024-01-28T23:59:59Z'
  },
  
  tags: ['promotion', 'training', 'discount', 'limited-time'],
  category: 'promotions',
  
  isRead: false,
  expiresAt: DateTime.now().add(Duration(days: 3)),
  
  createdAt: DateTime.now(),
);
```

### Social Notifications

```dart
// Friend Request Notification
final friendRequestNotification = NotificationModel(
  id: 'notif_friend_request_008',
  userId: 'usr_player_123',
  title: 'New Friend Request',
  body: 'Alex Johnson wants to connect with you. You both play tennis and badminton!',
  type: NotificationType.friendRequest,
  priority: NotificationPriority.medium,
  
  deepLink: '/friends/requests',
  relatedEntityId: 'conn_friend_request_001',
  relatedEntityType: 'user_connection',
  
  actionText: 'View Request',
  
  data: {
    'connection_id': 'conn_friend_request_001',
    'requester_id': 'usr_player_456',
    'requester_name': 'Alex Johnson',
    'mutual_sports': ['tennis', 'badminton'],
    'mutual_friends': 3
  },
  
  tags: ['social', 'friend-request', 'connection'],
  category: 'social',
  
  isRead: false,
  isDelivered: true,
  deliveredAt: DateTime.now(),
  
  createdAt: DateTime.now(),
);

// Achievement Unlocked Notification
final achievementNotification = NotificationModel(
  id: 'notif_achievement_009',
  userId: 'usr_player_123',
  title: 'Achievement Unlocked! 🏆',
  body: 'Congratulations! You\'ve earned the "Social Butterfly" achievement for connecting with 25 players.',
  type: NotificationType.achievement,
  priority: NotificationPriority.medium,
  
  deepLink: '/profile/achievements',
  relatedEntityId: 'ach_social_butterfly',
  relatedEntityType: 'achievement',
  
  actionText: 'View Achievement',
  
  data: {
    'achievement_id': 'ach_social_butterfly',
    'achievement_name': 'Social Butterfly',
    'points_earned': '250',
    'reward': 'Special social badge',
    'category': 'social'
  },
  
  tags: ['achievement', 'milestone', 'social'],
  category: 'achievements',
  
  isRead: false,
  isDelivered: true,
  deliveredAt: DateTime.now(),
  
  createdAt: DateTime.now(),
);
```

### System and Business Notifications

```dart
// Payment Success Notification
final paymentSuccessNotification = NotificationModel(
  id: 'notif_payment_success_010',
  userId: 'usr_player_123',
  title: 'Payment Successful',
  body: 'Your payment of ₹2,500 for court booking has been processed successfully.',
  type: NotificationType.paymentSuccess,
  priority: NotificationPriority.medium,
  
  deepLink: '/bookings/booking_tennis_001',
  relatedEntityId: 'pay_booking_001',
  relatedEntityType: 'payment',
  
  actionText: 'View Receipt',
  
  data: {
    'payment_id': 'pay_booking_001',
    'amount': '2500.0',
    'currency': 'INR',
    'booking_id': 'booking_tennis_001',
    'venue_name': 'Mumbai Tennis Club',
    'booking_date': '2024-01-25'
  },
  
  tags: ['payment', 'success', 'booking'],
  category: 'payments',
  
  isRead: false,
  isDelivered: true,
  deliveredAt: DateTime.now(),
  
  createdAt: DateTime.now(),
);

// App Update Notification
final appUpdateNotification = NotificationModel(
  id: 'notif_app_update_011',
  userId: 'usr_player_123',
  title: 'New Features Available!',
  body: 'Update Playo to access video analysis tools, improved matchmaking, and performance tracking.',
  type: NotificationType.appUpdate,
  priority: NotificationPriority.low,
  
  deepLink: 'app://update',
  
  actionText: 'Update Now',
  secondaryActionText: 'Later',
  
  data: {
    'version': '2.1.0',
    'features': ['Video Analysis', 'Smart Matchmaking', 'Performance Tracking'],
    'update_size': '45 MB',
    'required': false
  },
  
  tags: ['app-update', 'features', 'system'],
  category: 'system',
  
  isRead: false,
  expiresAt: DateTime.now().add(Duration(days: 30)),
  
  createdAt: DateTime.now(),
);

// Venue Promotion Notification
final venuePromotionNotification = NotificationModel(
  id: 'notif_venue_promo_012',
  userId: 'usr_player_123',
  title: 'Special Offer at Mumbai Tennis Club',
  body: 'Book any court this weekend and get 20% off! Perfect for your regular tennis sessions.',
  type: NotificationType.promotion,
  priority: NotificationPriority.medium,
  
  deepLink: '/venues/venue_mumbai_tennis_001',
  relatedEntityId: 'venue_mumbai_tennis_001',
  relatedEntityType: 'venue',
  
  actionText: 'Book Now',
  
  data: {
    'venue_id': 'venue_mumbai_tennis_001',
    'discount_percentage': '20',
    'valid_days': ['Saturday', 'Sunday'],
    'expires_at': '2024-01-28T23:59:59Z',
    'promo_code': 'WEEKEND20'
  },
  
  tags: ['promotion', 'venue', 'discount', 'weekend'],
  category: 'promotions',
  
  isRead: false,
  expiresAt: DateTime.now().add(Duration(days: 3)),
  
  createdAt: DateTime.now(),
);
```

## Message Model Examples

### Direct Messages

```dart
// Game Planning Message
final gamePlanningMessage = Message(
  id: 'msg_game_plan_001',
  conversationId: 'conv_tennis_partners_001',
  senderId: 'usr_player_123',
  receiverId: 'usr_player_456',
  content: 'Hey Alex! Are you free for tennis tomorrow evening? I booked the court at 6 PM.',
  type: MessageType.text,
  
  // Message status
  isRead: false,
  isDelivered: true,
  deliveredAt: DateTime.now(),
  
  // Related context
  relatedEntityId: 'game_tennis_singles_001',
  relatedEntityType: 'game',
  
  // Metadata
  metadata: {
    'game_id': 'game_tennis_singles_001',
    'venue_name': 'Mumbai Tennis Club',
    'proposed_time': '2024-01-25T18:00:00Z'
  },
  
  createdAt: DateTime.now(),
);

// Response Message
final responseMessage = Message(
  id: 'msg_response_002',
  conversationId: 'conv_tennis_partners_001',
  senderId: 'usr_player_456',
  receiverId: 'usr_player_123',
  content: 'Perfect! I\'ll be there. Should I bring the balls or will you?',
  type: MessageType.text,
  
  // Reply context
  replyToMessageId: 'msg_game_plan_001',
  replyToContent: 'Hey Alex! Are you free for tennis tomorrow evening?',
  
  isRead: false,
  isDelivered: true,
  deliveredAt: DateTime.now(),
  
  createdAt: DateTime.now(),
);

// Image Message
final imageMessage = Message(
  id: 'msg_image_003',
  conversationId: 'conv_tennis_partners_001',
  senderId: 'usr_player_123',
  receiverId: 'usr_player_456',
  content: 'Check out my new racket!',
  type: MessageType.image,
  
  // Media content
  mediaUrl: 'https://user-images.com/tennis_racket_123.jpg',
  mediaThumbnailUrl: 'https://user-images.com/thumbnails/tennis_racket_123_thumb.jpg',
  mediaSize: 2048576, // bytes
  mediaDuration: null, // for images
  
  isRead: false,
  isDelivered: true,
  deliveredAt: DateTime.now(),
  
  createdAt: DateTime.now(),
);

// Voice Message
final voiceMessage = Message(
  id: 'msg_voice_004',
  conversationId: 'conv_training_feedback_002',
  senderId: 'usr_trainer_789',
  receiverId: 'usr_student_123',
  content: 'Voice message with training feedback',
  type: MessageType.audio,
  
  mediaUrl: 'https://audio-messages.com/feedback_voice_001.m4a',
  mediaDuration: 45, // seconds
  mediaSize: 1024000,
  
  // Training context
  relatedEntityId: 'session_tennis_001',
  relatedEntityType: 'training_session',
  
  metadata: {
    'session_id': 'session_tennis_001',
    'feedback_type': 'voice_note',
    'transcript': 'Great progress on your backhand today. Focus on follow-through for next session.'
  },
  
  isRead: false,
  isDelivered: true,
  deliveredAt: DateTime.now(),
  
  createdAt: DateTime.now(),
);

// Location Message
final locationMessage = Message(
  id: 'msg_location_005',
  conversationId: 'conv_game_meetup_003',
  senderId: 'usr_player_123',
  receiverId: 'usr_player_456',
  content: 'I\'m here at the tennis club entrance',
  type: MessageType.location,
  
  // Location data
  latitude: 18.9220,
  longitude: 72.8347,
  locationName: 'Mumbai Tennis Club Entrance',
  locationAddress: 'Marine Drive, Mumbai, Maharashtra 400001',
  
  relatedEntityId: 'venue_mumbai_tennis_001',
  relatedEntityType: 'venue',
  
  isRead: false,
  isDelivered: true,
  deliveredAt: DateTime.now(),
  
  createdAt: DateTime.now(),
);
```

### Group Messages

```dart
// Group Game Organization
final groupGameMessage = Message(
  id: 'msg_group_game_006',
  conversationId: 'conv_badminton_group_004',
  senderId: 'usr_organizer_123',
  receiverId: null, // Group message
  content: 'Who\'s interested in doubles badminton this Saturday? I can book the courts.',
  type: MessageType.text,
  
  // Group context
  isGroupMessage: true,
  groupId: 'group_badminton_enthusiasts',
  groupName: 'Badminton Enthusiasts',
  
  // Participants
  mentionedUserIds: [], // Could mention specific users
  
  relatedEntityId: 'game_badminton_doubles_005',
  relatedEntityType: 'game',
  
  isRead: false,
  isDelivered: true,
  deliveredAt: DateTime.now(),
  
  createdAt: DateTime.now(),
);

// Group Training Announcement
final groupTrainingMessage = Message(
  id: 'msg_group_training_007',
  conversationId: 'conv_tennis_academy_005',
  senderId: 'usr_trainer_456',
  receiverId: null,
  content: 'Reminder: Advanced tennis clinic starts Monday 6 PM. Bring your A-game! 🎾',
  type: MessageType.text,
  
  isGroupMessage: true,
  groupId: 'group_tennis_academy_students',
  groupName: 'Tennis Academy Students',
  
  relatedEntityId: 'service_tennis_clinic_001',
  relatedEntityType: 'training_service',
  
  metadata: {
    'training_type': 'group_clinic',
    'start_date': '2024-01-22T18:00:00Z',
    'duration': '90',
    'skill_level': 'advanced'
  },
  
  isRead: false,
  isDelivered: true,
  deliveredAt: DateTime.now(),
  
  createdAt: DateTime.now(),
);
```

### System Messages

```dart
// Automated Game Reminder
final autoReminderMessage = Message(
  id: 'msg_auto_reminder_008',
  conversationId: 'conv_system_reminders_006',
  senderId: 'system',
  receiverId: 'usr_player_123',
  content: 'Your tennis match with Sarah starts in 2 hours at Mumbai Tennis Club. Court 3 is reserved.',
  type: MessageType.system,
  
  relatedEntityId: 'game_tennis_singles_001',
  relatedEntityType: 'game',
  
  metadata: {
    'reminder_type': '2_hours_before',
    'game_id': 'game_tennis_singles_001',
    'court_number': '3',
    'venue_name': 'Mumbai Tennis Club'
  },
  
  isRead: false,
  isDelivered: true,
  deliveredAt: DateTime.now(),
  
  createdAt: DateTime.now(),
);

// Booking Confirmation Message
final bookingConfirmationMessage = Message(
  id: 'msg_booking_confirm_009',
  conversationId: 'conv_system_bookings_007',
  senderId: 'system',
  receiverId: 'usr_player_123',
  content: 'Booking confirmed! Court 2 at Mumbai Tennis Club is reserved for tomorrow 6-8 PM. Booking ID: BK001.',
  type: MessageType.system,
  
  relatedEntityId: 'booking_tennis_001',
  relatedEntityType: 'venue_booking',
  
  metadata: {
    'booking_id': 'booking_tennis_001',
    'court_name': 'Court 2',
    'venue_name': 'Mumbai Tennis Club',
    'start_time': '2024-01-25T18:00:00Z',
    'end_time': '2024-01-25T20:00:00Z',
    'total_amount': '2500.0'
  },
  
  isRead: false,
  isDelivered: true,
  deliveredAt: DateTime.now(),
  
  createdAt: DateTime.now(),
);
```

## Payment Model Examples

### Game Payment

```dart
// Tennis Game Entry Fee Payment
final gameEntryPayment = Payment(
  id: 'pay_game_entry_001',
  userId: 'usr_player_123',
  sourceId: 'game_tennis_doubles_002',
  sourceType: 'game_entry',
  
  // Payment details
  amount: 2500.0,
  currency: 'INR',
  status: PaymentStatus.succeeded,
  method: PaymentMethod.upi,
  
  // Gateway information
  gatewayProvider: 'razorpay',
  gatewayTransactionId: 'pay_razorpay_123456789',
  gatewayOrderId: 'order_razorpay_987654321',
  
  // Payment breakdown
  description: 'Entry fee for weekend tennis doubles tournament',
  baseAmount: 2500.0,
  fees: 50.0, // Gateway fees
  taxes: 450.0, // GST
  discount: 0.0,
  netAmount: 2000.0, // Amount after fees and taxes
  
  // Timestamps
  initiatedAt: DateTime.now().subtract(Duration(minutes: 2)),
  succeededAt: DateTime.now(),
  
  // Receipt and tracking
  receiptNumber: 'RCP-GAME-001-2024',
  receiptUrl: 'https://receipts.playo.com/pay_game_entry_001.pdf',
  
  // Additional context
  metadata: {
    'game_id': 'game_tennis_doubles_002',
    'game_title': 'Weekend Tennis Doubles Tournament',
    'venue_name': 'Mumbai Tennis Club',
    'organizer_id': 'usr_organizer_456',
    'sport': 'tennis'
  },
  
  createdAt: DateTime.now().subtract(Duration(minutes: 2)),
);

// Refund Payment
final refundPayment = Payment(
  id: 'pay_refund_002',
  userId: 'usr_player_123',
  sourceId: 'game_badminton_cancelled_003',
  sourceType: 'game_refund',
  
  amount: -800.0, // Negative for refund
  currency: 'INR',
  status: PaymentStatus.succeeded,
  method: PaymentMethod.upi,
  
  gatewayProvider: 'razorpay',
  gatewayTransactionId: 'rfnd_razorpay_111222333',
  
  description: 'Refund for cancelled badminton match',
  baseAmount: -800.0,
  fees: 0.0, // No fees on refunds
  taxes: 0.0,
  netAmount: -800.0,
  
  initiatedAt: DateTime.now().subtract(Duration(hours: 1)),
  succeededAt: DateTime.now().subtract(Duration(minutes: 30)),
  
  receiptNumber: 'RFD-GAME-002-2024',
  receiptUrl: 'https://receipts.playo.com/pay_refund_002.pdf',
  
  // Link to original payment
  originalPaymentId: 'pay_game_entry_badminton_003',
  refundReason: 'Game cancelled due to court maintenance',
  
  metadata: {
    'original_game_id': 'game_badminton_cancelled_003',
    'cancellation_reason': 'court_maintenance',
    'cancelled_by': 'venue_owner'
  },
  
  createdAt: DateTime.now().subtract(Duration(hours: 1)),
);
```

### Venue Booking Payment

```dart
// Court Booking Payment
final courtBookingPayment = Payment(
  id: 'pay_court_booking_003',
  userId: 'usr_player_123',
  sourceId: 'booking_tennis_court_001',
  sourceType: 'venue_booking',
  
  amount: 5000.0,
  currency: 'INR',
  status: PaymentStatus.succeeded,
  method: PaymentMethod.card,
  
  gatewayProvider: 'stripe',
  gatewayTransactionId: 'pi_stripe_1234567890',
  
  description: 'Tennis court booking - 2 hours peak time',
  baseAmount: 5000.0,
  fees: 100.0,
  taxes: 900.0,
  discount: 500.0, // Member discount
  netAmount: 4000.0,
  
  // Card details (masked)
  cardDetails: {
    'last_four': '4242',
    'brand': 'visa',
    'exp_month': '12',
    'exp_year': '2025'
  },
  
  initiatedAt: DateTime.now().subtract(Duration(minutes: 5)),
  succeededAt: DateTime.now().subtract(Duration(minutes: 3)),
  
  receiptNumber: 'RCP-VENUE-003-2024',
  receiptUrl: 'https://receipts.playo.com/pay_court_booking_003.pdf',
  
  metadata: {
    'booking_id': 'booking_tennis_court_001',
    'venue_id': 'venue_mumbai_tennis_001',
    'venue_name': 'Mumbai Tennis Club',
    'court_id': 'court_tennis_center_001',
    'court_name': 'Center Court',
    'booking_start': '2024-01-25T18:00:00Z',
    'booking_end': '2024-01-25T20:00:00Z',
    'duration_hours': '2',
    'rate_type': 'peak_hour'
  },
  
  createdAt: DateTime.now().subtract(Duration(minutes: 5)),
);
```

### Training Payment

```dart
// Training Session Payment
final trainingSessionPayment = Payment(
  id: 'pay_training_session_004',
  userId: 'usr_student_123',
  sourceId: 'session_tennis_coaching_001',
  sourceType: 'training_session',
  
  amount: 4000.0,
  currency: 'INR',
  status: PaymentStatus.succeeded,
  method: PaymentMethod.netBanking,
  
  gatewayProvider: 'razorpay',
  gatewayTransactionId: 'pay_rzp_training_456789',
  
  description: 'One-on-one tennis coaching with Maria Rodriguez',
  baseAmount: 4000.0,
  fees: 80.0,
  taxes: 720.0,
  discount: 0.0,
  netAmount: 3200.0,
  
  // Bank details
  bankDetails: {
    'bank_name': 'HDFC Bank',
    'account_ending': '1234'
  },
  
  initiatedAt: DateTime.now().subtract(Duration(hours: 2)),
  succeededAt: DateTime.now().subtract(Duration(hours: 2, minutes: 5)),
  
  receiptNumber: 'RCP-TRAIN-004-2024',
  receiptUrl: 'https://receipts.playo.com/pay_training_session_004.pdf',
  
  metadata: {
    'session_id': 'session_tennis_coaching_001',
    'trainer_id': 'trainer_tennis_pro_001',
    'trainer_name': 'Maria Rodriguez',
    'service_id': 'service_tennis_1on1_001',
    'session_date': '2024-01-25T17:00:00Z',
    'duration_minutes': '60',
    'venue_name': 'Mumbai Tennis Academy'
  },
  
  createdAt: DateTime.now().subtract(Duration(hours: 2)),
);

// Training Package Payment
final trainingPackagePayment = Payment(
  id: 'pay_training_package_005',
  userId: 'usr_student_123',
  sourceId: 'package_tennis_10_sessions',
  sourceType: 'training_package',
  
  amount: 35000.0,
  currency: 'INR',
  status: PaymentStatus.succeeded,
  method: PaymentMethod.upi,
  
  gatewayProvider: 'razorpay',
  gatewayTransactionId: 'pay_rzp_package_789012',
  
  description: '10-session tennis coaching package with discount',
  baseAmount: 40000.0, // 10 sessions × ₹4000
  fees: 700.0,
  taxes: 6300.0,
  discount: 5000.0, // Package discount
  netAmount: 28000.0,
  
  initiatedAt: DateTime.now().subtract(Duration(days: 1)),
  succeededAt: DateTime.now().subtract(Duration(days: 1, minutes: 2)),
  
  receiptNumber: 'RCP-PACK-005-2024',
  receiptUrl: 'https://receipts.playo.com/pay_training_package_005.pdf',
  
  metadata: {
    'package_id': 'package_tennis_10_sessions',
    'trainer_id': 'trainer_tennis_pro_001',
    'trainer_name': 'Maria Rodriguez',
    'total_sessions': '10',
    'session_duration': '60',
    'package_validity': '90_days',
    'discount_percentage': '12.5'
  },
  
  createdAt: DateTime.now().subtract(Duration(days: 1)),
);
```

### Failed and Pending Payments

```dart
// Failed Payment
final failedPayment = Payment(
  id: 'pay_failed_006',
  userId: 'usr_player_123',
  sourceId: 'game_football_5v5_001',
  sourceType: 'game_entry',
  
  amount: 400.0,
  currency: 'INR',
  status: PaymentStatus.failed,
  method: PaymentMethod.card,
  
  gatewayProvider: 'stripe',
  gatewayTransactionId: 'pi_failed_1234567890',
  
  description: 'Entry fee for 5v5 football match',
  baseAmount: 400.0,
  fees: 8.0,
  taxes: 72.0,
  netAmount: 320.0,
  
  // Failure details
  failureReason: 'insufficient_funds',
  failureMessage: 'Your card has insufficient funds to complete this transaction',
  failedAt: DateTime.now().subtract(Duration(minutes: 10)),
  
  initiatedAt: DateTime.now().subtract(Duration(minutes: 15)),
  
  metadata: {
    'game_id': 'game_football_5v5_001',
    'retry_count': '1',
    'original_attempt_time': '2024-01-24T10:30:00Z'
  },
  
  createdAt: DateTime.now().subtract(Duration(minutes: 15)),
);

// Pending Payment
final pendingPayment = Payment(
  id: 'pay_pending_007',
  userId: 'usr_player_456',
  sourceId: 'booking_swimming_pool_001',
  sourceType: 'venue_booking',
  
  amount: 1200.0,
  currency: 'INR',
  status: PaymentStatus.pending,
  method: PaymentMethod.netBanking,
  
  gatewayProvider: 'razorpay',
  gatewayTransactionId: 'pay_rzp_pending_345678',
  
  description: 'Swimming pool lane booking',
  baseAmount: 1200.0,
  fees: 24.0,
  taxes: 216.0,
  netAmount: 960.0,
  
  initiatedAt: DateTime.now().subtract(Duration(minutes: 5)),
  
  // Pending details
  pendingReason: 'bank_processing',
  estimatedCompletionTime: DateTime.now().add(Duration(minutes: 10)),
  
  metadata: {
    'booking_id': 'booking_swimming_pool_001',
    'venue_name': 'Mumbai Aquatic Center',
    'lane_number': '3',
    'booking_duration': '2_hours'
  },
  
  createdAt: DateTime.now().subtract(Duration(minutes: 5)),
);
```

## Common Messaging and Notification Operations

### Notification Management

```dart
// Send bulk notifications for game reminders
Future<void> sendGameReminders() async {
  final tomorrow = DateTime.now().add(Duration(days: 1));
  final tomorrowStart = DateTime(tomorrow.year, tomorrow.month, tomorrow.day);
  final tomorrowEnd = tomorrowStart.add(Duration(days: 1));
  
  // Find games happening tomorrow
  final upcomingGames = gameBox.query(
    Game_.startTime.between(
      tomorrowStart.millisecondsSinceEpoch,
      tomorrowEnd.millisecondsSinceEpoch,
    ).and(Game_.dbStatus.equals(GameStatus.published.stableId))
  ).build().find();
  
  for (final game in upcomingGames) {
    // Get all confirmed participants
    final participants = gameParticipationBox.query(
      GameParticipation_.gameId.equals(game.id)
        .and(GameParticipation_.dbStatus.equals(ParticipationStatus.confirmed.stableId))
    ).build().find();
    
    // Send reminder to each participant
    for (final participant in participants) {
      final notification = NotificationModel(
        id: 'notif_reminder_${game.id}_${participant.userId}',
        userId: participant.userId,
        title: 'Game Tomorrow',
        body: 'Your ${game.title} is scheduled for tomorrow at ${_formatTime(game.startTime)}',
        type: NotificationType.gameReminder,
        priority: NotificationPriority.medium,
        relatedEntityId: game.id,
        relatedEntityType: 'game',
        scheduledFor: DateTime.now(),
        createdAt: DateTime.now(),
      );
      
      notificationBox.put(notification);
    }
  }
}

// Mark notifications as read
Future<void> markNotificationsAsRead(String userId, List<String> notificationIds) async {
  final notifications = notificationBox.query(
    NotificationModel_.userId.equals(userId)
      .and(NotificationModel_.id.oneOf(notificationIds))
  ).build().find();
  
  for (final notification in notifications) {
    notification.isRead = true;
    notification.readAt = DateTime.now();
    notificationBox.put(notification);
  }
}

// Get unread notification count
Future<int> getUnreadNotificationCount(String userId) async {
  return notificationBox.query(
    NotificationModel_.userId.equals(userId)
      .and(NotificationModel_.isRead.equals(false))
  ).build().count();
}
```

### Message Operations

```dart
// Send message in conversation
Future<Message> sendMessage({
  required String conversationId,
  required String senderId,
  String? receiverId,
  required String content,
  required MessageType type,
  String? mediaUrl,
  String? replyToMessageId,
}) async {
  final message = Message(
    id: generateUUID(),
    conversationId: conversationId,
    senderId: senderId,
    receiverId: receiverId,
    content: content,
    type: type,
    mediaUrl: mediaUrl,
    replyToMessageId: replyToMessageId,
    isRead: false,
    isDelivered: false, // Will be set when actually delivered
    createdAt: DateTime.now(),
  );
  
  messageBox.put(message);
  
  // Update conversation last message
  // Implementation would update conversation model
  
  return message;
}

// Get conversation messages
Future<List<Message>> getConversationMessages(String conversationId, {
  int limit = 50,
  int offset = 0,
}) async {
  return messageBox.query(
    Message_.conversationId.equals(conversationId)
  ).order(Message_.createdAt, flags: Order.descending)
  .build()
  .find()
  .skip(offset)
  .take(limit)
  .toList();
}

// Mark messages as read
Future<void> markMessagesAsRead(String conversationId, String userId) async {
  final unreadMessages = messageBox.query(
    Message_.conversationId.equals(conversationId)
      .and(Message_.receiverId.equals(userId))
      .and(Message_.isRead.equals(false))
  ).build().find();
  
  for (final message in unreadMessages) {
    message.isRead = true;
    message.readAt = DateTime.now();
    messageBox.put(message);
  }
}
```

This comprehensive example file demonstrates how to work with all notification, messaging, and payment-related models in the Playo platform, including various notification types, message formats, payment scenarios, and common operations.
