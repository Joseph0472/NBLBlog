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

                let comment = document.getElementById(parentId);
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
    console.log(id);
    let newComment = document.getElementById(id);
    // newComment.innerHTML = `<textarea name="content" id="new-nested-comment"
    // placeholder="Write your comment here" rows="3"></textarea>`;

    console.log(newComment);

    let text = document.createElement("textarea");
    text.name = "content";
    text.id = "new-nested-comment";
    text.placeholder = "Write your nested comment here";
    text.rows = 3;


    let newCommentSubmit = document.createElement("p");
    newCommentSubmit.innerHTML = `<button type="submit">Reply</button>`;
    newCommentSubmit.value = parentId;
    newCommentSubmit.onclick = publishNewNestedComment(parentId);

    newComment.appendChild(text);
    newComment.appendChild(newCommentSubmit);

}

function publishNewNestedComment(parentId) {
    $.ajax({
        type: "get",
        url: "/new-nested-comment",
        data: {parentId:parentId},
        dataType: "json",
        success:  displayNestedComments(parentId)
    });
}