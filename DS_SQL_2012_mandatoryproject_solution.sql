-- We want to reward the user who has been around the longest, Find the 5 oldest users.
SELECT username,datediff('day',current_date- created_at) as no_of_days FROM  users ;

-- To target inactive users in an email ad campaign, find the users who have never posted a photo.
select * from users where id not in (select user_id from photos);

-- Suppose you are running a contest to find out who got the most likes on a photo. Find out who won?
WITH likes_count AS (select u.username,sum(l.photo_id) AS NO_OF_LIKES from users u inner join photos p on u.id=p.user_id inner join likes l on p.id=l.photo_id 
group by u.username)
SELECT * FROM LIKES_COUNT
order by NO_OF_LIKES limit 1;

--  The investors want to know how many times does the average user post.
with posts_count as (select sum(p.user_id) as number_posts from users u inner join photos p on u.id=p.user_id
group by p.user_id)
select avg(number_posts) from posts_count;

-- A brand wants to know which hashtag to use on a post, and find the top 5 most used hashtags.
with hashtag_count as (select t.tag_name,sum(tag_id) as number_of_tags from tags t inner join photo_tags pt on t.id=pt.tag_id
group by t.tag_name 
order by number_of_tags desc limit 5)
select * from hashtag_count;

-- To find out if there are bots, find users who have liked every single photo on the site.
SELECT p.user_id,u.username, count(p.user_id) AS user_in_photos, count(l.user_id) AS user_in_likes
FROM photos p
INNER JOIN likes l
ON p.user_id = l.user_id
inner join users u on p.user_id=u.id
group by p.user_id;

-- Find the users who have created instagramid in may and select top 5 newest joinees from it?




with cte3 as (select * from users where extract(month from created_at)=5)
select * from cte3
order by created_at desc limit 5;
select *,sec(created_by) as timeduration from cte3 order by timeduration asc;


-- Can you help me find the users whose name starts with c and ends with any number and have posted the photos as well as liked the photos?
with user_data as (select * from users where username regexp '^c' and username regexp '[0-9]$')
select * from user_data c inner join photos p on c.id=p.user_id inner join likes l on c.id=l.user_id;


-- Demonstrate the top 30 usernames to the company who have posted photos in the range of 3 to 5
with photos_data as (select u.username,sum(p.user_id) as photos_posted from users u inner join photos p on u.id=p.user_id 
group by p.user_id)
select * from photos_data where photos_posted between 3 and 5 limit 30;

