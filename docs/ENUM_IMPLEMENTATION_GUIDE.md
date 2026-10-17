# ObjectBox Enum Implementation Guide

This document explains how enums have been implemented in the Playo project following ObjectBox best practices for stable enum persistence.

## Overview

All enums in the project have been updated to follow the ObjectBox recommended pattern for enum handling. This ensures that enum values are stored using stable IDs rather than unstable ordinal values, preventing data corruption when enum definitions change.

## Implementation Pattern

### Enum Definition

Each enum now includes:
1. An `unknown` value as the first enum value for handling unknown/null cases
2. A `stableId` getter that returns a stable integer ID for each enum value
3. A static `fromStableId` method that converts stable IDs back to enum values

Example:
```dart
enum NotificationType {
  @JsonValue('unknown')
  unknown, // Default for handling unknown values
  @JsonValue('system')
  system,
  @JsonValue('game_invite')
  gameInvite,
  // ... more values

  // Stable enum ID mapping for ObjectBox persistence
  int get stableId {
    switch (this) {
      case NotificationType.unknown:
        return 0;
      case NotificationType.system:
        return 1;
      case NotificationType.gameInvite:
        return 2;
      // ... more cases
    }
  }

  static NotificationType fromStableId(int id) {
    switch (id) {
      case 0:
        return NotificationType.unknown;
      case 1:
        return NotificationType.system;
      case 2:
        return NotificationType.gameInvite;
      // ... more cases
      default:
        return NotificationType.unknown;
    }
  }
}
```

### Entity Class Implementation

Each entity class that uses enums follows this pattern:
1. The enum field is marked as `@Transient()` so ObjectBox ignores it
2. A database getter/setter pair handles the conversion between enum and stable ID
3. The constructor assigns enum values properly

Example:
```dart
@Entity()
class NotificationModel {
  // Store enum as stable int for ObjectBox compatibility
  @Transient()
  NotificationType? type;

  // Stable database field for enum storage
  int? get dbType {
    return type?.stableId;
  }

  set dbType(int? value) {
    if (value == null) {
      type = null;
    } else {
      type = NotificationType.fromStableId(value);
    }
  }

  NotificationModel({
    // ... other parameters
    NotificationType type = NotificationType.system,
    // ... more parameters
  }) {
    this.type = type;
  }
}
```

## Updated Models and Enums

### Notification Models
- **NotificationType**: 17 values (unknown, system, game_invite, etc.)
- **NotificationPriority**: 5 values (unknown, low, normal, high, urgent)
- **MessageType**: 8 values (unknown, text, image, file, etc.)
- **PaymentStatus**: 8 values (unknown, pending, processing, etc.)
- **PaymentMethod**: 7 values (unknown, card, upi, etc.)

### Game Models
- **GameStatus**: 7 values (unknown, draft, published, etc.)
- **ParticipationStatus**: 8 values (unknown, requested, confirmed, etc.)
- **InviteStatus**: 6 values (unknown, pending, accepted, etc.)

### Venue Models
- **VenueType**: 8 values (unknown, outdoor, indoor, etc.)
- **CourtType**: 5 values (unknown, standard, premium, etc.)
- **BookingStatus**: 9 values (unknown, pending, confirmed, etc.)
- **BookingType**: 6 values (unknown, hourly, daily, etc.)

### Trainer Models
- **TrainerType**: 4 values (unknown, individual, academy, group)
- **ServiceType**: 6 values (unknown, oneOnOne, group, etc.)
- **SessionStatus**: 8 values (unknown, scheduled, confirmed, etc.)

### User Models
- **UserRole**: 5 values (unknown, player, trainer, admin, venueOwner)
- **AuthProvider**: 4 values (unknown, email, google, apple)
- **SubscriptionStatus**: 4 values (unknown, free, premium, pro)
- **ConnectionStatus**: 5 values (unknown, pending, accepted, etc.)

### Analytics Models
- **UserSkillLevel**: 6 values (unknown, beginner, intermediate, advanced, expert, professional)
- **AchievementCategory**: 7 values (unknown, games, training, social, skill, streak, special)
- **AchievementRarity**: 5 values (unknown, common, rare, epic, legendary)

### Sport Models
- **SportCategory**: 9 values (unknown, racket, ball, water, individual, team, combat, adventure, fitness)

## Benefits

1. **Stability**: Enum values won't break existing data when enum definitions change
2. **Safety**: Unknown values are gracefully handled with the `unknown` enum value
3. **Flexibility**: New enum values can be added without affecting existing data
4. **Performance**: Direct integer storage is efficient for database operations

## Usage in Queries

When querying with ObjectBox, use the stable ID values:

```dart
// Query for notifications with system type (stable ID = 1)
final systemNotifications = notificationBox.query(
  NotificationModel_.dbType.equals(NotificationType.system.stableId)
).build().find();

// Query for games with published status (stable ID = 2)
final publishedGames = gameBox.query(
  Game_.dbStatus.equals(GameStatus.published.stableId)
).build().find();
```

## Migration Considerations

If you have existing data with the old enum implementation:
1. The stable IDs were designed to match the original ordinal values where possible
2. Existing data should continue to work without migration
3. Any unknown values will be handled gracefully as `unknown` enum values

## Naming Conflict Resolution

A naming conflict was resolved between two `SportSkillLevel` definitions:
- **Analytics Model**: Renamed enum `SportSkillLevel` to `UserSkillLevel` (represents user skill levels in analytics)
- **Sport Model**: Kept entity class `SportSkillLevel` (represents sport skill level definitions in database)

This ensures both serve their distinct purposes without conflicts:
- `UserSkillLevel` enum: For user analytics and skill tracking
- `SportSkillLevel` entity: For storing sport-specific skill level definitions

## Best Practices

1. **Never change stable IDs**: Once assigned, stable IDs should never be changed
2. **Always add new values at the end**: Add new enum values with new stable IDs
3. **Use unknown for defaults**: Always handle the `unknown` case in switch statements
4. **Test migrations**: Test enum changes with existing data to ensure compatibility

## Example Usage

```dart
// Creating a notification
final notification = NotificationModel(
  id: 'notif_123',
  userId: 'user_456',
  title: 'Game Invitation',
  body: 'You have been invited to a game',
  type: NotificationType.gameInvite,  // Will be stored as stable ID 2
  priority: NotificationPriority.high, // Will be stored as stable ID 3
);

// Reading back from database
print(notification.type); // NotificationType.gameInvite
print(notification.priority); // NotificationPriority.high

// The database stores: dbType = 2, dbPriority = 3
```
