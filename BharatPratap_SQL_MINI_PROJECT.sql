use ipl;
select * from ipl_bidding_details;
select * from ipl_bidder_points;

-- 1. Show the percentage of wins of each bidder in the order of highest to lowest percentage.
 select p.BIDDER_ID, BIDDER_name, p.NO_OF_BIDS, count(d.bid_status)as "Won in bids",
 round(100*(count(d.bid_status)/p.NO_OF_BIDS),2) as "percentage of wins" 
 from ipl_bidder_points p left join ipl_bidding_details d 
 on p.BIDDER_ID = d.BIDDER_ID and d.bid_status = 'Won' 
 inner join ipl_bidder_details b on p.BIDDER_ID = b.BIDDER_ID
 group by BIDDER_ID 
 order by round(100*(count(d.bid_status)/p.NO_OF_BIDS)) desc;

-- 2.Which teams have got the highest and the lowest no. of bids?

-- method 1
select d.bid_team, t.team_name, count(d.bid_team) as "teams no of bid"
from ipl_bidding_details d inner join ipl_team t 
on d.bid_team = t.team_id where BID_STATUS != 'Cancelled' group by bid_team 
having count(bid_team) = (select max(cdcd)from (
select bid_team, count(bid_team) as cdcd
from ipl_bidding_details
where BID_STATUS != 'Cancelled'
group by bid_team)as big)
union 
select d.bid_team, t.team_name, count(d.bid_team) as "teams no of bid" 
from ipl_bidding_details d inner join ipl_team t 
on d.bid_team = t.team_id where BID_STATUS != 'Cancelled' group by bid_team 
having count(bid_team) = (select min(cdcd)from (
select bid_team, count(bid_team) as cdcd
from ipl_bidding_details
where BID_STATUS != 'Cancelled'
group by bid_team)as big);


-- method 2
-- for highest
select bid_team, count(bid_team) as cdcd
from ipl_bidding_details
where BID_STATUS != 'Cancelled'
group by bid_team order by cdcd desc limit 1;

-- for lowest
select bid_team, count(bid_team) as cdcd
from ipl_bidding_details
where BID_STATUS != 'Cancelled'
group by bid_team order by cdcd limit 1;

-- 3. In a given stadium, what is the percentage of wins by a team which had won the toss?
	-- first making correction in given information
      -- creating view
create view ipl_match_improve as
select *, case
when i.team = team_id1 then 1
when i.team = team_id2 then 2
else i.team
end match_winner1 from (select *,case
when match_winner = 1 then team_id1
when match_winner = 2 then team_id2
else match_winner
end team from ipl_match ) as i;
select * from ipl_match_improve;
-- queries
select c.stadium_id, stadium_name, match_played, match_toss_won , round(100*match_toss_won/match_played,2) as "winning percentage" 
from (select stadium_id, count(match_id) as match_played from ipl_match_schedule group by stadium_id) as a,
     (select stadium_id, count(match_id) as match_toss_won from ipl_match_schedule 
      where match_id in ( select match_id from ipl_match_improve where match_winner1 = toss_winner)
      group by stadium_id)as b,
	 (select stadium_id, stadium_name from ipl_stadium )as c
where a.stadium_id = b.stadium_id and c.stadium_id = b.stadium_id order by stadium_id;

-- 4. What is the total no. of bids placed on the team that has won highest no. of matches?
select BID_TEAM, count(*) as Number_of_bids from ipl_bidding_details where BID_TEAM = (select team from(
select *, case
when match_winner = 1 then team_id1
when match_winner = 2 then team_id2
else match_winner
end team from ipl_match) as ipl_winning_team group by team order by count(team) desc limit 1);

/* 5. From the current team standings, if a bidder places a bid on which of the teams, there is a possibility of (s)he winning the highest no. 
of points – in simple words, identify the team which has the highest jump in its total points (in terms of percentage) from the 
previous year to current year.*/
-- method 1
SELECT
    team_id,
	tournmt_id,
    total_points,
    ROUND(
    PERCENT_RANK()
    OVER (
        PARTITION BY tournmt_id
        ORDER BY total_points
    )*100,2) percentile_rank
FROM ipl_team_standings;
     
-- method 2
select t7.team_id, t7.tournmt_id, t7.total_points, t8.team_id, t8.tournmt_id, t8.total_points,
round(100*(t8.total_points-t7.total_points)/(t7.total_points),2) as jump_terms_of_percentage
from ipl_team_standings t7 inner join ipl_team_standings t8
on t7.team_id = t8.team_id where t7.tournmt_id = 2017 and t8.tournmt_id = 2018 order by jump_terms_of_percentage desc;