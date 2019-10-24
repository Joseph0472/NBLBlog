drop table if exists fp_articles;

create table fp_articles (
  id int not null primary key auto_increment,
  title varchar(128),
  content text,
  imageFilename varchar(128),
    userId int
);

insert into fp_articles (title, content, imageFilename,userId) values
('Cheetah', 'The <strong class="important">cheetah</strong> (/ˈtʃiːtə/; Acinonyx jubatus) is a large cat of the subfamily Felinae that occurs in North, Southern and East Africa, and a few localities in Iran.','cheetah.jpg',1);
