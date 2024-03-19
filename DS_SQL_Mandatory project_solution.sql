SELECT * FROM ig_clone.users;

select * from users;

-- We want to reward the user who has been around the longest, Find the 5 oldest users.
SELECT * FROM USERS where datediff('days',current_date()- created_at)
group by username limit 5;

-- To target inactive users in an email ad campaign, find the users who have never posted a photo.
select * from users where id not in (select user_id from photos);
select * from photos;
select * from users;
-- Suppose you are running a contest to find out who got the most likes on a photo. Find out who won?

select * from likes;
select * from photos;
select * from users;
select u.username,sum(l.photo_id) from users u inner join photos p on u.id=p.user_id inner join likes l on p.id=l.photo_id 
group by l.user_id;

-- The investors want to know how many times does the average user post.

with cte as (select sum(p.user_id) as number_posts from users u inner join photos p on u.id=p.user_id
group by p.user_id)

select avg(number_posts) from cte;


-- A brand wants to know which hashtag to use on a post, and find the top 5 most used hashtags.

select * from tags;
select * from photo_tags;
with cte2 as (select t.tag_name,sum(tag_id) as number_tags from tags t inner join photo_tags pt on t.id=pt.tag_id
group by t.tag_name 
order by number_tags desc limit 5)

select * from cte2;

-- To find out if there are bots, find users who have liked every single photo on the site.
select * from likes;
select * from users;

-- Find the users who have created instagramid in may and select top 5 newest joinees from it?
with cte3 as (select * from users where extract(month from created_at)=5)
select * from cte3
order by created_at desc limit 5;
select *,sec(created_by) as timeduration from cte3 order by timeduration asc;

-- Can you help me find the users whose name starts with c and ends with any number and have posted the photos as well as liked the photos?

with cte4 as (select * from users where username regexp '^c' and username regexp '[0-9]$')
select * from cte4 c inner join photos p on c.id=p.user_id inner join likes l on c.id=l.user_id;

-- Demonstrate the top 30 usernames to the company who have posted photos in the range of 3 to 5

select username from users u inner join photos p on u.id=p.user_id where sum(p.user_id)  in (3,4,5)
group by p.user_id limit 30; 

select * from photos;







;







