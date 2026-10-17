CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Table: users
CREATE TABLE users (
    user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255),
    email_address VARCHAR(255) UNIQUE NOT NULL,
    mobile_number VARCHAR(20) UNIQUE,
    avatar_url VARCHAR(255),
    location_area VARCHAR(255),
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8),
    favorite_sports TEXT[],
    karma_score INTEGER DEFAULT 0,
    games_played_count INTEGER DEFAULT 0,
    playpals_user_ids UUID[],
    gender VARCHAR(50),
    bio TEXT,
    booked_sessions_ids UUID[],
    blocked_user_ids UUID[],
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    is_email_verified BOOLEAN DEFAULT FALSE,
    is_mobile_verified BOOLEAN DEFAULT FALSE,
    user_role VARCHAR(50) NOT NULL CHECK (user_role IN ('user', 'trainer', 'admin', 'venue_partner'))
);

-- Table: sports
CREATE TABLE sports (
    sport_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    sport_name VARCHAR(255) UNIQUE NOT NULL,
    icon_url VARCHAR(255),
    image_url VARCHAR(255),
    sport_category VARCHAR(100),
    aliases TEXT,
    game_type VARCHAR(50) CHECK (game_type IN ('Singles', 'Doubles', 'Team')),
    minimum_players INTEGER,
    maximum_players INTEGER,
    game_duration_minutes INTEGER,
    rules_and_regulations TEXT,
    is_sport_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    equipment_required TEXT[]
);

-- Table: trainers
CREATE TABLE trainers (
    trainer_id UUID PRIMARY KEY DEFAULT uuid_generate_v4 (),
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255),
    bio TEXT,
    sport_id UUID,
    service_area VARCHAR(255),
    audience_type VARCHAR(100),
    address VARCHAR(255),
    hourly_rate NUMERIC(10, 2),
    ratings NUMERIC(3, 2),
    total_reviews INTEGER DEFAULT 0,
    avatar_url VARCHAR(255),
    email_address VARCHAR(255) UNIQUE NOT NULL,
    mobile_number VARCHAR(20) UNIQUE,
    created_at TIMESTAMP
    WITH
        TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP
    WITH
        TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        is_available BOOLEAN DEFAULT TRUE,
        FOREIGN KEY (sport_id) REFERENCES sports (sport_id)
);

-- Table: games
CREATE TABLE games (
    game_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    organiser_user_id UUID NOT NULL,
    sport_id UUID NOT NULL,
    area_of_game VARCHAR(255),
    game_date DATE,
    game_time TIME,
    game_access_type VARCHAR(50) CHECK (game_access_type IN ('Public', 'Invite Only')),
    current_players_count INTEGER,
    venue_name VARCHAR(255),
    venue_id UUID,
    venue_address VARCHAR(255),
    venue_latitude DECIMAL(10, 8),
    venue_longitude DECIMAL(11, 8),
    player_ids UUID[],
    waitlist_user_ids UUID[],
    game_rules TEXT,
    equipment_required TEXT,
    equipment_provided TEXT,
    requires_approval BOOLEAN DEFAULT FALSE,
    contact_information VARCHAR(255),
    notes TEXT,
    view_count INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    venue_partner_id UUID,
    FOREIGN KEY (organiser_user_id) REFERENCES users(user_id),
    FOREIGN KEY (sport_id) REFERENCES sports(sport_id),
    FOREIGN KEY (venue_partner_id) REFERENCES users(user_id)
);

-- Table: training_services
CREATE TABLE training_services (
    service_id UUID PRIMARY KEY DEFAULT uuid_generate_v4 (),
    trainer_id UUID NOT NULL,
    sport_id UUID NOT NULL,
    service_name VARCHAR(255),
    service_description TEXT,
    service_type VARCHAR(50) CHECK (
        service_type IN ('one-on-one', 'group')
    ),
    price NUMERIC(10, 2),
    age_group VARCHAR(100),
    maximum_participants INTEGER,
    is_service_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP
    WITH
        TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP
    WITH
        TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (trainer_id) REFERENCES trainers (trainer_id),
        FOREIGN KEY (sport_id) REFERENCES sports (sport_id)
);

-- Table: training_sessions
CREATE TABLE training_sessions (
    session_id UUID PRIMARY KEY DEFAULT uuid_generate_v4 (),
    service_id UUID NOT NULL,
    trainer_id UUID NOT NULL,
    student_user_id UUID NOT NULL,
    created_at TIMESTAMP
    WITH
        TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP
    WITH
        TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (service_id) REFERENCES training_services (service_id),
        FOREIGN KEY (trainer_id) REFERENCES trainers (trainer_id),
        FOREIGN KEY (student_user_id) REFERENCES users (user_id)
);

-- Table: user_preferences
CREATE TABLE user_preferences (
    preference_id UUID PRIMARY KEY DEFAULT uuid_generate_v4 (),
    user_id UUID NOT NULL UNIQUE,
    notifications_enabled BOOLEAN DEFAULT TRUE,
    game_invites_enabled BOOLEAN DEFAULT TRUE,
    app_theme VARCHAR(50) DEFAULT 'dark',
    promotional_emails_enabled BOOLEAN DEFAULT TRUE,
    location_sharing_enabled BOOLEAN DEFAULT TRUE,
    preferred_language VARCHAR(10) DEFAULT 'en',
    distance_unit VARCHAR(10) DEFAULT 'km',
    time_format VARCHAR(10) DEFAULT '24h',
    search_radius_km DECIMAL(5, 2),
    updated_at TIMESTAMP
    WITH
        TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES users (user_id)
);

-- Table: sports_skill_level
CREATE TABLE sports_skill_level (
    skill_level_id UUID PRIMARY KEY DEFAULT uuid_generate_v4 (),
    sport_id UUID NOT NULL,
    level_number INTEGER NOT NULL,
    display_name VARCHAR(100) NOT NULL,
    level_order INTEGER,
    characteristics TEXT,
    created_at TIMESTAMP
    WITH
        TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP
    WITH
        TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (sport_id) REFERENCES sports (sport_id)
);

-- Table: game_invites
CREATE TABLE game_invites (
    invite_id UUID PRIMARY KEY DEFAULT uuid_generate_v4 (),
    game_id UUID NOT NULL,
    inviter_user_id UUID NOT NULL,
    invitee_user_id UUID NOT NULL,
    invite_status VARCHAR(50) CHECK (
        invite_status IN (
            'Pending',
            'Accepted',
            'Rejected',
            'Expired'
        )
    ),
    sent_at TIMESTAMP
    WITH
        TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        responded_at TIMESTAMP
    WITH
        TIME ZONE,
        expires_at TIMESTAMP
    WITH
        TIME ZONE,
        created_at TIMESTAMP
    WITH
        TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP
    WITH
        TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (game_id) REFERENCES games (game_id),
        FOREIGN KEY (inviter_user_id) REFERENCES users (user_id),
        FOREIGN KEY (invitee_user_id) REFERENCES users (user_id)
);

-- Table: game_participation
CREATE TABLE game_participation (
    participation_id UUID PRIMARY KEY DEFAULT uuid_generate_v4 (),
    game_id UUID NOT NULL,
    user_id UUID NOT NULL,
    participation_status VARCHAR(50) CHECK (
        participation_status IN (
            'Joined',
            'Waitlisted',
            'Cancelled'
        )
    ),
    joined_at TIMESTAMP
    WITH
        TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        is_organiser BOOLEAN DEFAULT FALSE,
        has_paid BOOLEAN DEFAULT FALSE,
        paid_at TIMESTAMP
    WITH
        TIME ZONE,
        left_at TIMESTAMP
    WITH
        TIME ZONE,
        created_at TIMESTAMP
    WITH
        TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP
    WITH
        TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (game_id) REFERENCES games (game_id),
        FOREIGN KEY (user_id) REFERENCES users (user_id)
);

-- Policies for 'users' table

-- Enable RLS
ALTER TABLE users ENABLE ROW LEVEL SECURITY;

-- Allow authenticated users to view their own profile
CREATE POLICY "Allow authenticated users to view own profile" ON users FOR
SELECT USING (auth.uid () = user_id);

-- Allow authenticated users to update their own profile
CREATE POLICY "Allow authenticated users to update own profile" ON users FOR
UPDATE USING (auth.uid () = user_id)
WITH
    CHECK (auth.uid () = user_id);

-- Allow admins to view all user profiles
CREATE POLICY "Allow admins to view all profiles" ON users FOR
SELECT USING (
        EXISTS (
            SELECT 1
            FROM users
            WHERE
                user_id = auth.uid ()
                AND user_role = 'admin'
        )
    );

-- Policies for 'trainers' table

-- Enable RLS
ALTER TABLE trainers ENABLE ROW LEVEL SECURITY;

-- Allow authenticated users to view all trainers
CREATE POLICY "Allow authenticated users to view all trainers" ON trainers FOR
SELECT TO authenticated USING (TRUE);

-- Allow trainers to update their own profile
CREATE POLICY "Allow trainers to update their own profile" ON trainers FOR
UPDATE USING (
    auth.uid () = trainer_id
    AND EXISTS (
        SELECT 1
        FROM users
        WHERE
            user_id = auth.uid ()
            AND user_role = 'trainer'
    )
)
WITH
    CHECK (
        auth.uid () = trainer_id
        AND EXISTS (
            SELECT 1
            FROM users
            WHERE
                user_id = auth.uid ()
                AND user_role = 'trainer'
        )
    );

-- Policies for 'games' table

-- Enable RLS
ALTER TABLE games ENABLE ROW LEVEL SECURITY;

-- Allow authenticated users to view public games or games they are part of
CREATE POLICY "Allow users to view public and joined games" ON games FOR
SELECT USING (
        game_access_type = 'Public'
        OR auth.uid () = ANY (player_ids)
        OR auth.uid () = ANY (waitlist_user_ids)
    );

-- Allow authenticated users to create a new game
CREATE POLICY "Allow authenticated users to create a new game" ON games FOR
INSERT
WITH
    CHECK (
        organiser_user_id = auth.uid ()
    );

-- Allow the organiser to update their own game
CREATE POLICY "Allow organiser to update their own game" ON games FOR
UPDATE USING (
    organiser_user_id = auth.uid ()
)
WITH
    CHECK (
        organiser_user_id = auth.uid ()
    );

-- Policies for 'training_services' table

-- Enable RLS
ALTER TABLE training_services ENABLE ROW LEVEL SECURITY;

-- Allow authenticated users to view all services
CREATE POLICY "Allow authenticated users to view all services" ON training_services FOR
SELECT TO authenticated USING (TRUE);

-- Allow trainers to create new services
CREATE POLICY "Allow trainers to create new services" ON training_services FOR
INSERT
WITH
    CHECK (
        trainer_id = auth.uid ()
        AND EXISTS (
            SELECT 1
            FROM users
            WHERE
                user_id = auth.uid ()
                AND user_role = 'trainer'
        )
    );

-- Allow trainers to update their own services
CREATE POLICY "Allow trainers to update their own services" ON training_services FOR
UPDATE USING (trainer_id = auth.uid ())
WITH
    CHECK (trainer_id = auth.uid ());

-- Policies for 'training_sessions' table

-- Enable RLS
ALTER TABLE training_sessions ENABLE ROW LEVEL SECURITY;

-- Allow a user to view their own training sessions
CREATE POLICY "Allow users to view their own training sessions" ON training_sessions FOR
SELECT USING (student_user_id = auth.uid ());

-- Allow a trainer to view their own training sessions
CREATE POLICY "Allow trainers to view their own training sessions" ON training_sessions FOR
SELECT USING (trainer_id = auth.uid ());

-- Allow authenticated users to create a training session for themselves
CREATE POLICY "Allow users to create their own sessions" ON training_sessions FOR
INSERT
WITH
    CHECK (student_user_id = auth.uid ());

-- ---------------------------------------------------------------------------
-- Migration: Refactor games schema (Game model redesign)
-- Date: 2025-10-02
-- ---------------------------------------------------------------------------
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'game_access_type_enum') THEN
        CREATE TYPE game_access_type_enum AS ENUM ('public', 'invite_only');
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'game_type_enum') THEN
        CREATE TYPE game_type_enum AS ENUM ('regular', 'coaching', 'tournament');
    END IF;
END$$;

-- Safe existence checks (some columns may already be migrated in fresh envs)
ALTER TABLE games RENAME COLUMN organiser_user_id TO host_id;
ALTER TABLE games RENAME COLUMN waitlist_user_ids TO requested_user_ids;
ALTER TABLE games RENAME COLUMN game_rules TO other_instructions;

-- Add new columns (if not exists pattern via DO block for idempotency)
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name='games' AND column_name='co_host_id'
    ) THEN
        ALTER TABLE games
            ADD COLUMN co_host_id uuid NULL,
            ADD COLUMN invited_user_ids uuid[] DEFAULT '{}',
            ADD COLUMN bring_your_own_equipment boolean NOT NULL DEFAULT false,
            ADD COLUMN cost_shared boolean NOT NULL DEFAULT false,
            ADD COLUMN total_players_limit integer NULL,
            ADD COLUMN pay_to_join boolean NOT NULL DEFAULT false,
            ADD COLUMN cost_per_player numeric(10,2) NULL,
            ADD COLUMN game_type game_type_enum NOT NULL DEFAULT 'regular',
            ADD COLUMN access_type game_access_type_enum;
    END IF;
END$$;

-- Migrate access_type values from old game_access_type (if still present)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name='games' AND column_name='game_access_type'
    ) THEN
        UPDATE games
        SET access_type = CASE 
            WHEN lower(game_access_type) = 'public' THEN 'public'
            ELSE 'invite_only'
        END
        WHERE access_type IS NULL;
        ALTER TABLE games DROP COLUMN game_access_type;
    END IF;
END$$;

-- Drop removed venue detail columns & notes (ignore errors if already absent)
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='games' AND column_name='notes') THEN
        ALTER TABLE games DROP COLUMN notes;
    END IF;
    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='games' AND column_name='venue_name') THEN
        ALTER TABLE games DROP COLUMN venue_name;
    END IF;
    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='games' AND column_name='venue_address') THEN
        ALTER TABLE games DROP COLUMN venue_address;
    END IF;
    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='games' AND column_name='venue_latitude') THEN
        ALTER TABLE games DROP COLUMN venue_latitude;
    END IF;
    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='games' AND column_name='venue_longitude') THEN
        ALTER TABLE games DROP COLUMN venue_longitude;
    END IF;
END$$;

-- Ensure access_type NOT NULL (after backfill)
ALTER TABLE games ALTER COLUMN access_type SET NOT NULL;

-- New indexes
CREATE INDEX IF NOT EXISTS idx_games_host_id ON games(host_id);
CREATE INDEX IF NOT EXISTS idx_games_co_host_id ON games(co_host_id);
CREATE INDEX IF NOT EXISTS idx_games_access_type ON games(access_type);
CREATE INDEX IF NOT EXISTS idx_games_game_type ON games(game_type);

-- New table: game_queries
CREATE TABLE IF NOT EXISTS game_queries (
    query_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    game_id uuid NOT NULL REFERENCES games(game_id) ON DELETE CASCADE,
    user_id uuid NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    question text NOT NULL,
    answer text,
    asked_at timestamptz NOT NULL DEFAULT now(),
    answered_at timestamptz,
    created_at timestamptz DEFAULT now(),
    updated_at timestamptz DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_game_queries_game_id ON game_queries(game_id);
CREATE INDEX IF NOT EXISTS idx_game_queries_user_id ON game_queries(user_id);
