package ictgradschool.web.deployments.model;

public class Comment {
    private int id;
    private String content;
    private int articleId;
    private int userId;
    private int parentId;
    private int childNumber;

    public Comment(String content, int articleId, int userId, int parentId, int childNumber) {
        this.content = content;
        this.articleId = articleId;
        this.userId = userId;
        this.parentId = parentId;
        this.childNumber = childNumber;
    }

    public Comment(int id, String content, int articleId, int userId, int parentId, int childNumber) {
        this.id = id;
        this.content = content;
        this.articleId = articleId;
        this.userId = userId;
        this.parentId = parentId;
        this.childNumber = childNumber;
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

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public int getChildNumber() {
        return childNumber;
    }

    public void setChildNumber(int childNumber) {
        this.childNumber = childNumber;
    }


    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", articleId=" + articleId +
                ", userId=" + userId +
                ", parentId=" + parentId +
                ", childNumber=" + childNumber +
                '}';
    }
}
