-- Created by Vertabelo (http://vertabelo.com)
-- Script type: create
-- Scope: [tables, references, sequences, procedures]
-- Generated at Sun Mar 29 12:21:14 UTC 2015




-- tables
-- Table `group`
CREATE TABLE `group` (
    id int    NOT NULL  AUTO_INCREMENT,
    group_number int    NOT NULL ,
    session_id int    NOT NULL ,
    group_name varchar(5)    NOT NULL ,
    CONSTRAINT group_pk PRIMARY KEY (id)
);

-- Table league
CREATE TABLE league (
    id int    NOT NULL  AUTO_INCREMENT,
    league_name varchar(40)    NOT NULL ,
    CONSTRAINT league_pk PRIMARY KEY (id)
);

-- Table location
CREATE TABLE location (
    id int    NOT NULL  AUTO_INCREMENT,
    location_name varchar(60)    NOT NULL ,
    street_address varchar(200)    NOT NULL ,
    comments varchar(200)    NOT NULL ,
    contact_info varchar(200)    NOT NULL ,
    CONSTRAINT location_pk PRIMARY KEY (id)
);

-- Table machine
CREATE TABLE machine (
    id int    NOT NULL  AUTO_INCREMENT,
    machine_nickname varchar(7)    NOT NULL ,
    machine_name varchar(20)    NOT NULL ,
    IPDB_number int    NOT NULL ,
    CONSTRAINT machine_pk PRIMARY KEY (id)
);

-- Table machine_on_location
CREATE TABLE machine_on_location (
    id int    NOT NULL  AUTO_INCREMENT,
    display_name varchar(8)    NOT NULL ,
    location_id int    NOT NULL ,
    state_of_repair varchar(20)    NOT NULL ,
    comments varchar(300)    NOT NULL ,
    contact_info varchar(20)    NOT NULL ,
    machine_id int    NOT NULL ,
    playable bool    NOT NULL DEFAULT true ,
    CONSTRAINT machine_on_location_pk PRIMARY KEY (id)
);

-- Table machine_selection
CREATE TABLE machine_selection (
    id int    NOT NULL  AUTO_INCREMENT,
    machine_id int    NOT NULL ,
    session_id int    NOT NULL ,
    temprorarily_broken bool    NOT NULL ,
    CONSTRAINT machine_selection_pk PRIMARY KEY (id)
);

-- Table `match`
CREATE TABLE `match` (
    id int    NOT NULL  AUTO_INCREMENT,
    machine_selection_id int    NOT NULL ,
    creation_time timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ,
    end_time timestamp    NOT NULL ,
    ongoing bool    NOT NULL ,
    group_id int    NOT NULL ,
    notes varchar(800)    NOT NULL ,
    CONSTRAINT match_pk PRIMARY KEY (id)
);

-- Table match_score
CREATE TABLE match_score (
    id int    NOT NULL  AUTO_INCREMENT,
    match_id int    NOT NULL ,
    score int    NOT NULL ,
    matchpoints int    NOT NULL ,
    player_in_group_id int    NOT NULL ,
    player_order int    NOT NULL ,
    CONSTRAINT match_score_pk PRIMARY KEY (id)
);

-- Table player
CREATE TABLE player (
    id int    NOT NULL  AUTO_INCREMENT,
    givenname varchar(20)    NOT NULL ,
    surname varchar(20)    NOT NULL ,
    email varchar(30)    NOT NULL ,
    initials varchar(3)    NOT NULL ,
    IFPA_number int    NOT NULL ,
    active bool    NOT NULL ,
    normalized_game_time real(7,4)    NOT NULL DEFAULT 1 ,
    CONSTRAINT player_pk PRIMARY KEY (id)
);

-- Table player_in_group
CREATE TABLE player_in_group (
    id int    NOT NULL  AUTO_INCREMENT,
    group_id int    NOT NULL ,
    player_in_session_id int    NOT NULL ,
    total_matchpoints int    NOT NULL ,
    outscored_players int    NOT NULL ,
    opposing_players int    NOT NULL ,
    CONSTRAINT player_in_group_pk PRIMARY KEY (id)
);

-- Table player_in_season
CREATE TABLE player_in_season (
    id int    NOT NULL  AUTO_INCREMENT,
    paid_dues bool    NOT NULL ,
    season_id int    NOT NULL ,
    player_id int    NOT NULL ,
    CONSTRAINT player_in_season_pk PRIMARY KEY (id)
);

-- Table player_in_session
CREATE TABLE player_in_session (
    id int    NOT NULL  AUTO_INCREMENT,
    session_id int    NOT NULL ,
    player_in_season_id int    NOT NULL ,
    CONSTRAINT player_in_session_pk PRIMARY KEY (id)
);

-- Table season
CREATE TABLE season (
    id int    NOT NULL  AUTO_INCREMENT,
    season_name varchar(30)    NOT NULL ,
    league_id int    NOT NULL ,
    max_session_count int    NOT NULL ,
    CONSTRAINT season_pk PRIMARY KEY (id)
);

-- Table session
CREATE TABLE session (
    id int    NOT NULL  AUTO_INCREMENT,
    session_name varchar(60)    NOT NULL ,
    creation_time timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ,
    date date    NOT NULL ,
    week_num int    NOT NULL ,
    location_id int    NOT NULL ,
    season_id int    NOT NULL ,
    is_playoff bool    NOT NULL ,
    CONSTRAINT session_pk PRIMARY KEY (id)
);





-- foreign keys
-- Reference:  group_player_group (table: player_in_group)


ALTER TABLE player_in_group ADD CONSTRAINT group_player_group FOREIGN KEY group_player_group (group_id)
    REFERENCES `group` (id);
-- Reference:  group_session (table: `group`)


ALTER TABLE `group` ADD CONSTRAINT group_session FOREIGN KEY group_session (session_id)
    REFERENCES session (id);
-- Reference:  machine_location (table: machine_on_location)


ALTER TABLE machine_on_location ADD CONSTRAINT machine_location FOREIGN KEY machine_location (location_id)
    REFERENCES location (id);
-- Reference:  machine_on_location_machine (table: machine_on_location)


ALTER TABLE machine_on_location ADD CONSTRAINT machine_on_location_machine FOREIGN KEY machine_on_location_machine (machine_id)
    REFERENCES machine (id);
-- Reference:  machine_selection_machine (table: machine_selection)


ALTER TABLE machine_selection ADD CONSTRAINT machine_selection_machine FOREIGN KEY machine_selection_machine (machine_id)
    REFERENCES machine_on_location (id);
-- Reference:  machine_selection_session (table: machine_selection)


ALTER TABLE machine_selection ADD CONSTRAINT machine_selection_session FOREIGN KEY machine_selection_session (session_id)
    REFERENCES session (id);
-- Reference:  match_group (table: `match`)


ALTER TABLE `match` ADD CONSTRAINT match_group FOREIGN KEY match_group (group_id)
    REFERENCES `group` (id);
-- Reference:  match_machine_selection (table: `match`)


ALTER TABLE `match` ADD CONSTRAINT match_machine_selection FOREIGN KEY match_machine_selection (machine_selection_id)
    REFERENCES machine_selection (id);
-- Reference:  match_player_match (table: match_score)


ALTER TABLE match_score ADD CONSTRAINT match_player_match FOREIGN KEY match_player_match (match_id)
    REFERENCES `match` (id);
-- Reference:  match_score_group_player (table: match_score)


ALTER TABLE match_score ADD CONSTRAINT match_score_group_player FOREIGN KEY match_score_group_player (player_in_group_id)
    REFERENCES player_in_group (id);
-- Reference:  player_in_group_player_in_session (table: player_in_group)


ALTER TABLE player_in_group ADD CONSTRAINT player_in_group_player_in_session FOREIGN KEY player_in_group_player_in_session (player_in_session_id)
    REFERENCES player_in_session (id);
-- Reference:  player_in_season_player (table: player_in_season)


ALTER TABLE player_in_season ADD CONSTRAINT player_in_season_player FOREIGN KEY player_in_season_player (player_id)
    REFERENCES player (id);
-- Reference:  player_in_season_season (table: player_in_season)


ALTER TABLE player_in_season ADD CONSTRAINT player_in_season_season FOREIGN KEY player_in_season_season (season_id)
    REFERENCES season (id);
-- Reference:  player_in_session_player_in_season (table: player_in_session)


ALTER TABLE player_in_session ADD CONSTRAINT player_in_session_player_in_season FOREIGN KEY player_in_session_player_in_season (player_in_season_id)
    REFERENCES player_in_season (id);
-- Reference:  player_in_session_session (table: player_in_session)


ALTER TABLE player_in_session ADD CONSTRAINT player_in_session_session FOREIGN KEY player_in_session_session (session_id)
    REFERENCES session (id);
-- Reference:  season_league (table: season)


ALTER TABLE season ADD CONSTRAINT season_league FOREIGN KEY season_league (league_id)
    REFERENCES league (id);
-- Reference:  session_location (table: session)


ALTER TABLE session ADD CONSTRAINT session_location FOREIGN KEY session_location (location_id)
    REFERENCES location (id);
-- Reference:  session_season (table: session)


ALTER TABLE session ADD CONSTRAINT session_season FOREIGN KEY session_season (season_id)
    REFERENCES season (id);



-- End of file.

