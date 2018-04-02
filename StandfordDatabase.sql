# 1
select distinct title
from movie
where director=‘Steven’;

# 2
select distinct year
from movie m join rating r
on m.mid= r.mid
where stars=4 or stars=5
order by year;

# 3
select distinct title
from movie m left join rating r
on m.mid= r.mid
where r.rating is null;

# 4
select distinct rv.name
from rating rt left join reviewer rv
on rt.rid= rv.rid
where rt.ratingdate is null;

# 5
select rv.name as reviewer_name, m.title, r.stars, r.ratingDate
from reviewer rv, movie m, rating r
where rv.rid=r.rid
and m.mid=r.mid
order by 1, 2, 3;

# 6
select rv.name, 
from rating r1 join rating r2
(on r1.rid = r2.rid
and r1.mid = r2.mid
and r1.ratingDate< r2.ratingDate
and r1.stars< r2.stars)
join reviewer rv
on rv.rid= r.rid
join movie on m.mid=r1.mid
where (r1.rid, r2.mid) in
(select rid, mid
from rating
group by rid, mid
having count(*)= 2);
# same reviewer and same movie exactly twice, WHERE IN

# using CTE
with cte1 as
(select rid, mid, starts, ratingDate
from rating
where (rid, mid) in
(select rid, mid
from rating
group by rid, mid
having count(*) = 2)
)

select rv.name, m.title
from cte1 c1 join cte1 c2
(on c1.rid= c2.rid
and c1.mid= c2.mid
and c1.ratingDate< c2.ratingDate
and c1.stars< c2.stars)
join reviewer rv on c1.rid= rv.rid
join movie m on c1.mid= m.mid;

# 7
select 



# 8
select m.title, max(r.stars)-min(r.stars) as rating_spread
from rating r join movid m
on r.mid= m.mid
group by r.mid
order by rating_spread desc;

# 9
with avg_stars as
(select mid, avg(stars) as stars
from rating 
group by mid)

select (case when m.year<1980 then avg(avg.stars) end) -
(case when m.year>=1980 then avg(avg.stars) end) as difference
from avg_stars avg join movie m
on m.mid= avg.mid

# 9
select distinct rv.name
from movie m join rating r
on m.mid= r.rid
join reviewer rv
on r.rid= rv.rid
where m.name='Gone with the Wind'

# 10
select rv.name as reviewer_name, m.title, r.stars
from rating r join reviewer rv
on r.rid= rv.rid
join movie m
on m.mid= r.mid
where rv.name= m.director 

# 11
select rv.name, m.title
from movie m join rating r
on m.mid= r.mid
join reviewer rv on rv.rid= r.rid
order by 1, 2




