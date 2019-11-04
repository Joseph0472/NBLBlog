DROP TABLE IF EXISTS fp_parentComment;

CREATE TABLE IF NOT EXISTS fp_parentComment (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL,
    article_id INT NOT NULL,
    user_id INT NOT NULL,
    date date
);

INSERT INTO fp_parentComment (content, article_id, user_id, date) VALUES('apple','1','3','2019-10-20');


DROP TABLE IF EXISTS fp_childComment;

CREATE TABLE IF NOT EXISTS fp_childComment (
                                                id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                                content TEXT NOT NULL,
                                                article_id INT NOT NULL,
                                                user_id INT NOT NULL,
                                                parent_id int not null,
                                                date date
);

INSERT INTO fp_childComment (content, article_id, user_id, parent_id, date)  VALUES('apple','5','3','3','2019-10-20');
INSERT INTO fp_childComment (content, article_id, user_id, parent_id, date)  VALUES('apple','5','3','1','2019-10-20');
INSERT INTO fp_childComment (content, article_id, user_id, parent_id, date)  VALUES('apple','5','3','2','2019-10-20');
INSERT INTO fp_childComment (content, article_id, user_id, parent_id, date)  VALUES('apple','5','3','3','2019-10-20');
INSERT INTO fp_childComment (content, article_id, user_id, parent_id, date)  VALUES('apple','5','3','3','2019-10-20');
INSERT INTO fp_childComment (content, article_id, user_id, parent_id, date)  VALUES('apple','5','3','3','2019-10-20');
