<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>My Post</title>
    <link rel="stylesheet" href="./css/site.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>


<div class="display-comments">

    <h2>Comments</h2>
    <c:forEach var="comment" items="${comments}">
        <c:if test="${comment.parentId == 0}">
            <p>First layer Comment User: ${comment.userId}</p>
            <li>${comment.content}</li>

            <button type="submit" value="${comment.id}" name="parentIdForNestedComments" id="parentid" onclick="displayNestedComments(${comment.id})">Display Comments(${comment.childNumber})</button>
            <button type="submit" value="${comment.id}" name="parentIdForNewNestedComment" id="parentidfornewnestedcomment" onclick="displayTextarea(${comment.id})">New Comment</button>
<%--            console.log(${comment.id});--%>
            <div name="display-nested-comments" id="${comment.id}"></div>
            <div name="add-new-nested-comments" id="textarea-${comment.id}"></div>
<%--                        console.log(textarea-${comment.id});--%>

        </c:if>
    </c:forEach>

</div>

<script>
    function displayNestedComments(parentId) {

        console.log("called displayNestedComments...");
        // let parentId = document.querySelector("#parentid").value;
        console.log(parentId);

        $.ajax({
            type: "get",
            url: "/display-nested-comments",
            data: {parentId:parentId},
            dataType: "json",
            success: function (nestedComments){
                console.log("AJAX success...");

                let comment = document.getElementById(parentId);
                comment.innerHTML = "";

                for (let i = 0; i < nestedComments.length; i++) {

                    let commentJson = nestedComments[i];
                    console.log(commentJson.parentId);
                    let parentId = commentJson.parentId;

                    let userId = document.createElement("p");
                    userId.innerText = commentJson.userId;
                    console.log(commentJson.userId);

                    let content = document.createElement("li");
                    content.innerText = commentJson.content;

                    let newComment = document.createElement("div");
                    // <%--newComment.innerHTML = `<button type="submit" value="${commentJson.id}" --%>
                    //         <%--name="parentIdLayer2" id="parentidlayer2" onclick="displayTextarea()">New Nested Comment</button>`;--%>
                    newComment.innerHTML = `<button type="submit">New Nested Comment</button>`
                    newComment.value = commentJson.id;
                    newComment.name = "parentIdLayer2";
                    newComment.id = "parentidlayer2";
                    // newComment.onclick = displayTextarea(newComment.value);
                    //
                    // console.log(newComment);


                    comment.appendChild(userId);
                    comment.appendChild(content);
                    comment.appendChild(newComment);
                }
            }
        });
    }

    function displayTextarea(parentId) {
        console.log("test if we reach here");
        let id = "textarea-" + parentId;
        console.log("displaytextarea " + id);
        let newComment = document.getElementById(id);
        newComment.innerHTML = "";

        // newComment.innerHTML = `<textarea name="content" id="new-nested-comment"
        // placeholder="Write your comment here" rows="3"></textarea>`;

        let text = document.createElement("textarea");
        text.name = "content";
        text.id = "new-nested-comment";
        text.placeholder = "Write your nested comment here";
        text.rows = 3;


        let newCommentSubmit = document.createElement("p");
        newCommentSubmit.innerHTML = `<button type="submit">Reply</button>`;
        newCommentSubmit.value = parentId;
        newCommentSubmit.onclick = publishNewNestedComment(parentId, text.name);

        newComment.appendChild(text);
        newComment.appendChild(newCommentSubmit);

    }

    function publishNewNestedComment(parentId, content) {

        console.log("have we got to this function?");
        $.ajax({
            type: "get",
            url: "/new-nested-comment",
            data: {parentId:parentId, content: content},
            dataType: "json",
            success:  displayNestedComments(parentId)
        });
    }

</script>

</body>
</html>
