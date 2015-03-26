-- Created by Vertabelo (http://vertabelo.com)
-- Script type: drop
-- Scope: [tables, references, sequences, procedures]
-- Generated at Tue Mar 24 10:26:17 UTC 2015



-- foreign keys
ALTER TABLE player_in_group DROP FOREIGN KEY group_player_group;
ALTER TABLE `group` DROP FOREIGN KEY group_session;
ALTER TABLE machine_on_location DROP FOREIGN KEY machine_location;
ALTER TABLE machine_on_location DROP FOREIGN KEY machine_on_location_machine;
ALTER TABLE machine_selection DROP FOREIGN KEY machine_selection_machine;
ALTER TABLE machine_selection DROP FOREIGN KEY machine_selection_session;
ALTER TABLE `match` DROP FOREIGN KEY match_group;
ALTER TABLE `match` DROP FOREIGN KEY match_machine_selection;
ALTER TABLE match_score DROP FOREIGN KEY match_player_match;
ALTER TABLE match_score DROP FOREIGN KEY match_score_group_player;
ALTER TABLE player_in_group DROP FOREIGN KEY player_in_group_player_in_session;
ALTER TABLE player_in_season DROP FOREIGN KEY player_in_season_player;
ALTER TABLE player_in_season DROP FOREIGN KEY player_in_season_season;
ALTER TABLE player_in_session DROP FOREIGN KEY player_in_session_player_in_season;
ALTER TABLE player_in_session DROP FOREIGN KEY player_in_session_session;
ALTER TABLE season DROP FOREIGN KEY season_league;
ALTER TABLE session DROP FOREIGN KEY session_location;
ALTER TABLE session DROP FOREIGN KEY session_season;

-- tables
-- Table `group`
DROP TABLE `group`;
-- Table league
DROP TABLE league;
-- Table location
DROP TABLE location;
-- Table machine
DROP TABLE machine;
-- Table machine_on_location
DROP TABLE machine_on_location;
-- Table machine_selection
DROP TABLE machine_selection;
-- Table `match`
DROP TABLE `match`;
-- Table match_score
DROP TABLE match_score;
-- Table player
DROP TABLE player;
-- Table player_in_group
DROP TABLE player_in_group;
-- Table player_in_season
DROP TABLE player_in_season;
-- Table player_in_session
DROP TABLE player_in_session;
-- Table season
DROP TABLE season;
-- Table session
DROP TABLE session;



-- End of file.

