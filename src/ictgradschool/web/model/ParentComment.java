package ictgradschool.web.model;

import java.sql.Date;

public class ParentComment {
    private int id;
    private String content;
    private int articleId;
    private int userId;
    private Date date;

    // add username by SHI

    private String username;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public ParentComment(String content, int articleId, int userId, Date date, String username) {
        this.content = content;
        this.articleId = articleId;
        this.userId = userId;
        this.date = date;
        this.username = username;
    }

    public ParentComment(int id, String content, int articleId, int userId, Date date, String username) {
        this.id = id;
        this.content = content;
        this.articleId = articleId;
        this.userId = userId;
        this.date = date;
        this.username = username;
    }

    public ParentComment(int id, String content, int articleId, int userId, Date date) {
        this.id = id;
        this.content = content;
        this.articleId = articleId;
        this.userId = userId;
        this.date = date;
    }

    public ParentComment( String content, int articleId, int userId, Date date) {
        this.content = content;
        this.articleId = articleId;
        this.userId = userId;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getArticleId() {
        return articleId;
    }

    public void setArticleId(int articleId) {
        this.articleId = articleId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "ParentComment{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", articleId=" + articleId +
                ", userId=" + userId +
                ", date=" + date +
                '}';
    }
}



