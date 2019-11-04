-- Work of Joseph~

-- PWD table
drop table if exists fp_userLogin;
create table fp_userLogin(
                           id             INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                           username       VARCHAR(32) UNIQUE,
                           password       VARCHAR(16),
                           passHashBase64 VARCHAR(128) UNIQUE,
                           saltBase64     VARCHAR(128),
                           numIterations  INT
                         );


-- UserInfo table
drop table if exists fp_userInfo;
create table fp_userInfo(
-- id should be a foreign key here
                            fname  VARCHAR (32),
                            lname VARCHAR (32),
                            emailAddress VARCHAR (128),
                            phoneNum VARCHAR (64),
                            dob   DATE ,
                            country CHAR (32),
                            description TEXT,
                            avatarFilename varchar(128),
                            userid int primary key unique ,

                            FOREIGN KEY (userid) REFERENCES fp_userLogin(id)
);


insert into fp_userInfo(dob) value ("1993/11/23");
-- insert into fp_userInfo(userid) VALUE (2);