CREATE TABLE finals AS
  SELECT "RSF" AS hall, "61A" as course UNION
  SELECT "Wheeler"    , "61A"           UNION
  SELECT "Pimentel"   , "61A"           UNION
  SELECT "Li Ka Shing", "61A"           UNION
  SELECT "Stanley"    , "61A"           UNION
  SELECT "RSF"        , "61B"           UNION
  SELECT "Wheeler"    , "61B"           UNION
  SELECT "Morgan"     , "61B"           UNION
  SELECT "Wheeler"    , "61C"           UNION
  SELECT "Pimentel"   , "61C"           UNION
  SELECT "Soda 310"   , "61C"           UNION
  SELECT "Soda 306"   , "10"            UNION
  SELECT "RSF"        , "70";

CREATE TABLE sizes AS
  SELECT "RSF" AS room, 900 as seats    UNION
  SELECT "Wheeler"    , 700             UNION
  SELECT "Pimentel"   , 500             UNION
  SELECT "Li Ka Shing", 300             UNION
  SELECT "Stanley"    , 300             UNION
  SELECT "Morgan"     , 100             UNION
  SELECT "Soda 306"   , 80              UNION
  SELECT "Soda 310"   , 40              UNION
  SELECT "Soda 320"   , 30;

CREATE TABLE sharing AS
  SELECT 
    a.course AS course,                     -- 当前课程
    COUNT(DISTINCT a.hall) AS shared        -- 与其他课程共享的教室数量
  FROM 
    finals AS a,                            -- 教室 A
    finals AS b                             -- 教室 B
  WHERE 
    a.hall = b.hall                         -- 两门课程共用同一教室
    AND a.course != b.course                -- 确保是不同的课程
  GROUP BY 
    a.course;                               -- 按课程分组


-- 创建 pairs 表
CREATE TABLE pairs AS
  SELECT 
    a.room || ' and ' || b.room || ' together have ' || (a.seats + b.seats) || ' seats' AS rooms
  FROM 
    sizes AS a,        -- 房间 A
    sizes AS b         -- 房间 B
  WHERE 
    a.room < b.room     -- 确保房间按字母顺序排列
    AND (a.seats + b.seats) >= 1000  -- 总座位数至少为 1000
  ORDER BY 
    (a.seats + b.seats) DESC;  -- 按总座位数降序排列


CREATE TABLE big AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";

CREATE TABLE remaining AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";

