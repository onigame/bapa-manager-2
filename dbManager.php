<?php

// Uses the Slim Framework to provide RESTful services for the BAPA database.

require 'vendor/autoload.php';

require_once('load_ini.php');  // to get DB info
$db = new PDO(
  'mysql:host='.$inifile["HOST"].';dbname='.$inifile["DB"].';charset=utf8', 
  $inifile["USER"], 
  $inifile["PW"]
);
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);

$app = new \Slim\Slim();

/*
$app->get('/league/:id', 'getLeague');
$app->put('/league/:id', 'updateLeague');
$app->delete('/league/:id', 'deleteLeague');

*/

$app->get('/league', function() use ($db) {
  $sql = "SELECT * FROM league ORDER BY league_name";
  try {
    $stmt = $db->query($sql);
    $items = $stmt->fetchAll(PDO::FETCH_OBJ);
    echo '{"league": ' . json_encode($items) . '}';
  } catch(PDOException $e) {
    echo '{"error":{"text":'. $e->getMessage() .'}}';
  }
});

$app->get('/league/:id', function($id) use ($db) {
  $sql = "SELECT * FROM league WHERE id=:id";
  try {
    $stmt = $db->prepare($sql);
    $stmt->bindParam("id", $id);
    $stmt->execute();
    $item = $stmt->fetchObject();
    echo json_encode($item);
  } catch(PDOException $e) {
    echo '{"error":{"text":'. $e->getMessage() .'}}';
  }
});

$app->post('/league', function() use ($db) {
  $req = \Slim\Slim::getInstance()->request();
  $item = json_decode($req->getBody());
  $sql = "INSERT INTO league (league_name) VALUES (:league_name)";
  try {
    $stmt = $db->prepare($sql);
    $stmt->bindParam("league_name", $item->league_name);
    $stmt->execute();
    $item->id = $db->lastInsertId();
    $db = null;
    echo json_encode($wine);
  } catch(PDOException $e) {
    echo '{"error":{"text":'. $e->getMessage() .'}}';
  }
});

function updateLeague() {
}

function deleteLeague() {
}

$app->run();
