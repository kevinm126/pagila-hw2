/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */
select title from (select title from (select film.title, unnest(special_features) as special_feature from film) as a  WHERE special_feature = 'Behind the Scenes' group by title) b JOIN (select title from (select film.title, unnest(special_features) as special from film) c  WHERE special = 'Trailers' group by title) as d  USING (title)group by title order by title;
