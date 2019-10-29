package ictgradschool.web.deployments.model;

import java.sql.Timestamp;
import java.sql.Date;

public class Article {

    private Integer id;
    private String title;
    private String content;
    private String imageFilename;
    private Integer userId;
    private Date date;


    public Article(Integer id, String title, String content, String imageFilename,Integer userID, Date date) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.imageFilename = imageFilename;
        this.userId = userID;
        this.date = date;
    }
    public Article(Integer id, String title, String content, String imageFilename, Date date) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.imageFilename = imageFilename;
        this.date = date;

    }

    public Article( String title, String content, String imageFilename,Integer userID,Date date) {
        this.title = title;
        this.content = content;
        this.imageFilename = imageFilename;
        this.userId = userID;
        this.date = date;
    }

    public Article(String title, String content, String imageFilename,Date date) {
        this.title = title;
        this.content = content;
        this.imageFilename = imageFilename;
        this.date = date;
    }

    public Article(String title, String content,Date date) {
        this.title = title;
        this.content = content;
        this.date = date;
    }

    public Article(String imageFilename) {
        this.imageFilename = imageFilename;
    }

    public Article() {

    }
    public Integer getUserId(){return userId;}
    public void setUserId(Integer userId){this.userId = userId;}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImageFilename() {
        return imageFilename;
    }

    public void setImageFilename(String imageFilename) {
        this.imageFilename = imageFilename;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", imageFilename='" + imageFilename + '\'' +
                ", userId=" + userId +
                '}';
    }
}
