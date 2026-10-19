-- GameJet Microtransactions Analysis
-- Purpose: Analyze app engagement, in-app purchases, and spending personas.
-- Dataset tables: game_jet.users, game_jet.sessions, game_jet.iaps
-- Note: These queries are based on the LevelUp Milestone assignment.

-- 1. Total number of downloaded users
SELECT COUNT(*) AS total_users
FROM game_jet.users;

-- 2. Distinct users who opened the app
SELECT COUNT(DISTINCT udid) AS users_who_opened_app
FROM game_jet.sessions;

-- 3. Users who downloaded but never opened the app
SELECT
    (SELECT COUNT(*) FROM game_jet.users)
    - (SELECT COUNT(DISTINCT udid) FROM game_jet.sessions)
    AS downloaded_but_never_opened;

-- 4. Number of sessions per user, from most to fewest
SELECT
    udid,
    COUNT(*) AS total_sessions
FROM game_jet.sessions
GROUP BY udid
ORDER BY total_sessions DESC;

-- 5. Users with more than the average 32.1 sessions
SELECT
    udid,
    COUNT(*) AS total_sessions
FROM game_jet.sessions
GROUP BY udid
HAVING COUNT(*) > 32.1
ORDER BY total_sessions DESC;

-- 6. Number of users who made at least one in-app purchase
SELECT COUNT(DISTINCT udid) AS purchasing_users
FROM game_jet.iaps;

-- 7. Total spending by user, including users with no purchases
-- Revenue is recorded in cents; NULL means no purchase record.
SELECT
    users.udid,
    SUM(iaps.rev) AS total_spent_cents
FROM game_jet.users AS users
LEFT JOIN game_jet.iaps AS iaps
    ON users.udid = iaps.udid
GROUP BY users.udid;

-- 8. Assign each user a spending persona
WITH player_personas AS (
    SELECT
        users.udid,
        SUM(iaps.rev) AS total_spent_cents,
        CASE
            WHEN SUM(iaps.rev) IS NULL OR SUM(iaps.rev) = 0
                THEN 'free player'
            WHEN SUM(iaps.rev) < 2000 THEN 'minnow'
            WHEN SUM(iaps.rev) < 10000 THEN 'dolphin'
            ELSE 'whale'
        END AS persona
    FROM game_jet.users AS users
    LEFT JOIN game_jet.iaps AS iaps
        ON users.udid = iaps.udid
    GROUP BY users.udid
)
SELECT
    persona,
    COUNT(*) AS total_users
FROM player_personas
GROUP BY persona
ORDER BY total_users DESC;

-- 9. Revenue by paying persona (dollars)
WITH player_personas AS (
    SELECT
        users.udid,
        SUM(iaps.rev) AS total_spent_cents,
        CASE
            WHEN SUM(iaps.rev) IS NULL OR SUM(iaps.rev) = 0
                THEN 'free player'
            WHEN SUM(iaps.rev) < 2000 THEN 'minnow'
            WHEN SUM(iaps.rev) < 10000 THEN 'dolphin'
            ELSE 'whale'
        END AS persona
    FROM game_jet.users AS users
    LEFT JOIN game_jet.iaps AS iaps
        ON users.udid = iaps.udid
    GROUP BY users.udid
)
SELECT
    persona,
    SUM(total_spent_cents) / 100.0 AS total_revenue_dollars
FROM player_personas
WHERE persona IN ('minnow', 'dolphin', 'whale')
GROUP BY persona
ORDER BY total_revenue_dollars DESC;

-- 10. Number of distinct purchasers by days since install.
-- This groups purchases by the number of days after install, not necessarily
-- each user's first purchase date.
SELECT
    iaps.date::date - users.install_date::date AS days_since_install,
    COUNT(DISTINCT users.udid) AS unique_purchasers
FROM game_jet.users AS users
JOIN game_jet.iaps AS iaps
    ON users.udid = iaps.udid
GROUP BY days_since_install
ORDER BY days_since_install;
