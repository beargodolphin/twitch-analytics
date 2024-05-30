--Inspecting the tables--
SELECT *
FROM stream
LIMIT 20;

SELECT *
FROM chat
LIMIT 20;

--What unique games are there?--
SELECT game
FROM stream
GROUP BY game;

--What unique channels are there?--
SELECT channel
FROM stream
GROUP BY channel;

--What are the most popular games?--
SELECT game, COUNT(*)
FROM stream
GROUP BY game
ORDER BY COUNT(*) DESC;

--Where are the viewers for the most popular game found?--
SELECT country, COUNT(*)
FROM stream
WHERE game = 'League of Legends'
GROUP BY country
ORDER BY COUNT(*) DESC;

--How are the streams being viewed?--
SELECT player, COUNT(*)
FROM stream
GROUP BY player
ORDER BY COUNT(*) DESC;

--How do the games rank based on genre?--
SELECT game,
 CASE
  WHEN game = 'Dota 2'
      THEN 'MOBA'
  WHEN game = 'League of Legends' 
      THEN 'MOBA'
  WHEN game = 'Heroes of the Storm'
      THEN 'MOBA'
    WHEN game = 'Counter-Strike: Global Offensive'
      THEN 'FPS'
    WHEN game = 'DayZ'
      THEN 'Survival'
    WHEN game = 'ARK: Survival Evolved'
      THEN 'Survival'
  ELSE 'Other'
  END AS 'genre',
  COUNT(*)
FROM stream
GROUP BY game
ORDER BY COUNT(*) DESC;

--What time of day do the streams begin?--
SELECT strftime('%H', time),
  COUNT(*)
FROM stream
GROUP BY 1;

--Join the tables--
SELECT *
FROM stream
JOIN chat
  ON stream.device_id = chat.device_id;
