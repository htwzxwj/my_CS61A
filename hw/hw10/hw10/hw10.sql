CREATE TABLE parents AS
  SELECT "ace" AS parent, "bella" AS child UNION
  SELECT "ace"          , "charlie"        UNION
  SELECT "daisy"        , "hank"           UNION
  SELECT "finn"         , "ace"            UNION
  SELECT "finn"         , "daisy"          UNION
  SELECT "finn"         , "ginger"         UNION
  SELECT "ellie"        , "finn";

CREATE TABLE dogs AS
  SELECT "ace" AS name, "long" AS fur, 26 AS height UNION
  SELECT "bella"      , "short"      , 52           UNION
  SELECT "charlie"    , "long"       , 47           UNION
  SELECT "daisy"      , "long"       , 46           UNION
  SELECT "ellie"      , "short"      , 35           UNION
  SELECT "finn"       , "curly"      , 32           UNION
  SELECT "ginger"     , "short"      , 28           UNION
  SELECT "hank"       , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT 
    children.name AS dog_name       -- 仅返回狗的名字
  FROM 
    parents                         -- 父母-子女关系表
  JOIN 
    dogs AS children                -- 子女信息
  ON 
    parents.child = children.name   -- 将父母表中的 child 和狗表中的名字匹配
  JOIN 
    dogs AS parents_info            -- 父母信息
  ON 
    parents.parent = parents_info.name -- 将父母表中的 parent 和狗表中的名字匹配
  ORDER BY 
    parents_info.height DESC;       -- 按父母高度降序排序




-- 创建 size_of_dogs 表
CREATE TABLE size_of_dogs AS
  SELECT 
    dogs.name AS name,      -- 狗的名字
    sizes.size AS size      -- 狗的大小分类
  FROM 
    dogs
  JOIN 
    sizes
  ON 
    dogs.height > sizes.min AND dogs.height <= sizes.max;  -- 根据高度分类


-- 创建 siblings 表，包含兄弟姐妹对
CREATE TABLE siblings AS
  SELECT 
    p1.child AS sibling1,      -- 第一个兄弟姐妹的名字
    p2.child AS sibling2,      -- 第二个兄弟姐妹的名字
    sizes1.size AS size        -- 兄弟姐妹的大小
  FROM 
    parents p1                 -- 父母-子女关系表
  JOIN 
    parents p2
  ON 
    p1.parent = p2.parent      -- 兄弟姐妹有相同的父母
  JOIN 
    size_of_dogs AS sizes1
  ON 
    p1.child = sizes1.name     -- 第一个兄弟姐妹的大小
  JOIN 
    size_of_dogs AS sizes2
  ON 
    p2.child = sizes2.name     -- 第二个兄弟姐妹的大小
  WHERE 
    p1.child < p2.child        -- 确保兄弟姐妹对只出现一次（按字母排序）
    AND sizes1.size = sizes2.size; -- 兄弟姐妹的大小相同



-- 示例主查询
CREATE TABLE sentences AS
  SELECT 
    "The two siblings, " || sibling1 || " and " || sibling2 || ", have the same size: " || size AS sentence
  FROM 
    siblings;




-- 创建 low_variance 表
CREATE TABLE low_variance AS
  SELECT 
    fur,                                        -- 毛皮类型
    MAX(height) - MIN(height) AS height_range  -- 身高范围（最大减最小）
  FROM 
    dogs
  GROUP BY 
    fur                                        -- 按毛皮类型分组
  HAVING 
    MIN(height) >= AVG(height) * 0.7           -- 确保没有狗的身高小于平均身高的 70%
    AND MAX(height) <= AVG(height) * 1.3;      -- 确保没有狗的身高大于平均身高的 130%

