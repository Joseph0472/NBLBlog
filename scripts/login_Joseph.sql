drop table if exists fp_userLogin;
create table fp_userLogin(
                           id             INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                           username       VARCHAR(32) UNIQUE,
                           password       VARCHAR(16),
                           passHashBase64 VARCHAR(128) UNIQUE,
                           saltBase64     VARCHAR(128),
                           numIterations  INT
                         );