CREATE TABLE teams (
    team_id SERIAL PRIMARY KEY,
    name TEXT
);

INSERT INTO teams (name) VALUES
('Red Dragons'),
('Blue Sharks');

CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams(team_id),
    first_name TEXT,
    last_name TEXT,
    goals_scored INTEGER
);

INSERT INTO players (team_id, first_name, last_name, goals_scored) VALUES
(1, 'Mark', 'Johnson', 13),
(2, 'Luke', 'Davis', 5);

CREATE TABLE matches (
    match_id SERIAL PRIMARY KEY,
    team_1_id INTEGER REFERENCES teams(team_id),
    team_2_id INTEGER REFERENCES teams(team_id),
    season_id INTEGER REFERENCES seasons(season_id)
);

INSERT INTO matches (team_1_id, team_2_id, season_id) VALUES
(1, 2, 1);

CREATE TABLE referees (
    referee_id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT
);

INSERT INTO referees (first_name, last_name) VALUES
('Jack', 'Williams');

CREATE TABLE match_referees (
    match_id INTEGER REFERENCES matches(match_id),
    referee_id INTEGER REFERENCES referees(referee_id),
    PRIMARY KEY (match_id, referee_id)
);

INSERT INTO match_referees (match_id, referee_id) VALUES
(1, 1);

CREATE TABLE seasons (
    season_id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

INSERT INTO seasons (start_date, end_date) VALUES
('2024-01-01', '2024-12-31');

CREATE TABLE standings (
    team_id INTEGER REFERENCES teams(team_id),
    season_id INTEGER REFERENCES seasons(season_id),
    rank INTEGER
);

INSERT INTO standings (team_id, season_id, rank) VALUES
(1, 1, 1),
(2, 1, 2);