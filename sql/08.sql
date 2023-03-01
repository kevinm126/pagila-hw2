/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */
select title from (select title,rating, unnest(special_features) As all_features from film) as A where all_features = 'Trailers' and rating = 'G' order by title;
