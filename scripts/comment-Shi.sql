DROP TABLE IF EXISTS final01_comment;

CREATE TABLE IF NOT EXISTS final01_comment (
    comment_id INT NOT NULL AUTO_INCREMENT,
    content TEXT NOT NULL,
    article_id INT NOT NULL,
    user_id INT NOT NULL,
    parent_id INT NOT NULL,
    child_number INT,
    PRIMARY KEY (comment_id)

);

INSERT INTO final01_comment (content, article_id, user_id, parent_id, child_number) VALUES
('a common comment', 1, 2, 0, 2)
, ('a nested comment to Comment 1', 2, 3, 1, 0)
, ('another nested comment to Comment 1', 1, 3, 1, 0);


