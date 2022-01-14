-- Find all posts which were reacted to with a heart
-- Find all posts which were reacted to with a heart.
-- Tables: facebook_reactions, facebook_posts

SELECT
    distinct
    p.*
FROM
    facebook_posts p
INNER JOIN
    facebook_reactions r 
ON
    p.post_id = r.post_id AND 
    r.reaction = 'heart'