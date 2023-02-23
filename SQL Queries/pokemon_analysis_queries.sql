-- Show how many pokemon is in each generation 
SELECT generation, COUNT(generation) 
FROM pokemon_basic_info
GROUP BY generation;

-- Answer: Generation 1: 151, Generation 2: 100, Generation 3: 135, Generation 4: 107
-- Generation 5: 156, Generation 6: 72, Generation 7: 80

-- Show which generation has the strongest pokemon by combining attack and defense scores (overall)
SELECT generation, COUNT(generation) AS num_of_pokemons, AVG(attack+defense) AS combined_attack_defense_total
FROM pokemon_attack_stats_1
INNER JOIN pokemon_basic_info
ON pokemon_attack_stats_1.pokedex_number = pokemon_basic_info.pokedex_number
GROUP BY generation
ORDER BY combined_attack_defense_total DESC
LIMIT 1;

-- Answer: Generation 7

-- Show which generation has the strongest pokemon by combining attack and defense scores (individually)
SELECT name, generation, (attack+defense) AS combined_attack_defense_total
FROM pokemon_attack_stats_1
INNER JOIN pokemon_basic_info
ON pokemon_attack_stats_1.pokedex_number = pokemon_basic_info.pokedex_number
ORDER BY combined_attack_defense_total DESC
LIMIT 1;

-- Answer: Aggron from Generation 3

-- Show which generation has the weakest pokemon by combining attack and defense scores (overall)
SELECT generation, COUNT(generation) AS num_of_pokemons, AVG(attack+defense) AS combined_attack_defense_total
FROM pokemon_attack_stats_1
INNER JOIN pokemon_basic_info
ON pokemon_attack_stats_1.pokedex_number = pokemon_basic_info.pokedex_number
GROUP BY generation
ORDER BY combined_attack_defense_total ASC
LIMIT 1;

-- Answer: Generation 2

-- Show which generation has the weakest pokemon by combining attack and defense scores (individually)
SELECT name, generation, (attack+defense) AS combined_attack_defense_total
FROM pokemon_attack_stats_1
INNER JOIN pokemon_basic_info
ON pokemon_attack_stats_1.pokedex_number = pokemon_basic_info.pokedex_number
ORDER BY combined_attack_defense_total ASC
LIMIT 1;

-- Answer: Chansey from Generation 1

-- Show which type of pokemon is the strongest
SELECT type1, ROUND(AVG(attack+defense),2) AS combined_attacked_defense_total
FROM pokemon_basic_info info
INNER JOIN pokemon_attack_stats_1 stats
ON info.pokedex_number = stats.pokedex_number
GROUP BY type1
ORDER BY combined_attacked_defense_total DESC
LIMIT 1;

-- Answer: Steel

-- Show which type of pokemon is the weakest
SELECT type1, ROUND(AVG(attack+defense),2) AS combined_attacked_defense_total
FROM pokemon_basic_info info
INNER JOIN pokemon_attack_stats_1 stats
ON info.pokedex_number = stats.pokedex_number
GROUP BY type1
ORDER BY combined_attacked_defense_total ASC
LIMIT 1;

-- Answer: Fairy
