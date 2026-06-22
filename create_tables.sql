-- 1. جدول البطولات
CREATE TABLE Tournaments (
    tournament_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    start_date DATE,
    end_date DATE
);

-- 2. جدول الملاعب
CREATE TABLE Stadiums (
    stadium_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    location VARCHAR2(200)
);

-- 3. جدول الفرق
CREATE TABLE Teams (
    team_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    city VARCHAR2(100)
);

-- 4. جدول المدربين
CREATE TABLE Coaches (
    coach_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    team_id NUMBER REFERENCES Teams(team_id)
);

-- 5. جدول اللاعبين
CREATE TABLE Players (
    player_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    position VARCHAR2(50),
    team_id NUMBER REFERENCES Teams(team_id)
);

-- 6. جدول الحكام
CREATE TABLE Referees (
    referee_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL
);

-- 7. جدول المباريات
CREATE TABLE Matches (
    match_id NUMBER PRIMARY KEY,
    tournament_id NUMBER REFERENCES Tournaments(tournament_id),
    stadium_id NUMBER REFERENCES Stadiums(stadium_id),
    referee_id NUMBER REFERENCES Referees(referee_id),
    match_date TIMESTAMP
);

-- 8. جدول نتائج المباريات
CREATE TABLE Match_Results (
    result_id NUMBER PRIMARY KEY,
    match_id NUMBER REFERENCES Matches(match_id),
    team1_id NUMBER REFERENCES Teams(team_id),
    team2_id NUMBER REFERENCES Teams(team_id),
    score_team1 NUMBER,
    score_team2 NUMBER,
    winner_team_id NUMBER REFERENCES Teams(team_id)
);
-- جدول الجوائز . 9 --
CREATE TABLE Awards (
    award_id NUMBER PRIMARY KEY,
    award_name VARCHAR2(100) NOT NULL,
    description VARCHAR2(255),
    tournament_id NUMBER REFERENCES Tournaments(tournament_id)
);