DROP TABLE IF EXISTS "Videos";

CREATE TABLE "Videos"
(
  ID character varying,
  Title character varying,
  Runtime_Sec Integer,
  URL character varying,
  CONSTRAINT Video_pkey PRIMARY KEY (ID)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "Videos"
  OWNER TO postgres;


INSERT INTO "Videos" (ID, Title, Runtime_Sec, URL) VALUES
    ('WCm1XNVD_0c', 'FarFromTheMaddingCrowd', 93, 'https://www.youtube.com/watch?v=WCm1XNVD_0c'),
    ('mAqxH0IAPQI', 'Spy', 119, 'https://www.youtube.com/watch?v=mAqxH0IAPQI'),
    ('hEJnMQG9ev8', 'MadMax', 151, 'https://www.youtube.com/watch?v=hEJnMQG9ev8');
    

DROP TABLE IF EXISTS "Reviews";

CREATE TABLE "Reviews"
(
  UserName character varying,
  Rating Integer,
  Review character varying,
  VideoID character varying
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "Reviews"
  OWNER TO postgres;


INSERT INTO "Reviews" (UserName, VideoID, Rating, Review) VALUES
    ('Randi', 'WCm1XNVD_0c', 4, 'Loved it!'),
    ('Randi', 'mAqxH0IAPQI', 1, 'Hated it.'),
    ('Mica', 'hEJnMQG9ev8', 3, 'I think I will see it.'),
    ('Mica', 'WCm1XNVD_0c', 5, 'Definitely want to see it.');


select Title, count(Rating) NumofRatings, Avg(Rating) AvgRatings
from "Videos" V left join "Reviews" R on V.ID=R.VideoID
where Rating is not NULL
group by Title
order by Avg(Rating) desc;
