<%--
  Created by IntelliJ IDEA.
  User: pjia958
  Date: 24/10/2019
  Time: 9:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Account</title>
</head>
<body>
<header>
    <jsp:include page="/WEB-INF/view/nav.jsp"/>
</header>
<h1>Account Info Update</h1>
<p>(get username from session. If the user has no account info, it should say/display: you need to create your
    account info at very first time. If the user has account info, just update it.)</p>

<form id="form" method="post" action="/userInterface">
    <p>First Name<input type="text" id="fname" name="fname"></p>
    <p>Last Name<input type="text" id="lname" name="lname"></p>
    <p>Email Address<input type="text" id="email"></p>
    <p>Phone<input type="text" id="phonenum"></p>
    <p>Date of Birth<input type="date" id="date" max= 2029-10-10></p> <%--date here should be handled as String--%>
<%--TODO: copy the dropdown list from the former project, and make the desc done, and avatar--%>
    <p>Country<input id="country"><p>
    <p>Description<input id="description"><p>

    <p>Choose a avatar or update your own one<input id="avatar"></p>

    <p><time hidden name="timestamp" value="gettimestamp()">time</time></p>
    <button type="submit" >submit</button>
    <button type="reset" value="reset">clear</button>
</form>

<%--<script type="text/javascript">--%>
<%--    function check() {--%>

<%--        let name = document.querySelector("#name").value;--%>
<%--        let result = nameOK(name);--%>
<%--        console.log(result);--%>

<%--        let email = document.querySelector("#email").value;--%>
<%--        let result1= emailOK(email);--%>
<%--        console.log(result1);--%>

<%--        // let zip = document.querySelector("#zip").value;--%>
<%--        // let result2 =  zipOK(zip);--%>
<%--        // console.log(result2);--%>

<%--        let psw = document.querySelector("#psw").value;--%>
<%--        let psw_confirmation=document.querySelector("#psw_confirmation").value;--%>
<%--        let result3 = pswOK(psw, psw_confirmation);--%>
<%--        console.log(result3);--%>

<%--        let startdate = document.querySelector("#date").value;--%>
<%--        let result4 =  ageOK(startdate);--%>
<%--        console.log(result4);--%>

<%--        return result&&result1&&result3&&result4;--%>
<%--        // gettimestamp();--%>
<%--    }--%>
<%--    // function gettimestamp() {--%>
<%--    //     var d=Date.now();--%>
<%--    //     return d;//我不知道你这里为啥return--%>
<%--    // }--%>

<%--    function nameOK(name) {--%>
<%--        let namepattern=new RegExp("^[A-Za-z][A-Za-z0-9]{0,}$");--%>
<%--        if (!name.match(namepattern)){--%>
<%--            window.alert("The account name can only be upper or lower case letters and numbers, but may not start with a number");--%>
<%--            return false;}--%>
<%--        else return true;--%>

<%--    }--%>
<%--    function emailOK(email) {--%>
<%--        if (email.length ===0){--%>
<%--            alert("email is empty");--%>
<%--            return false;--%>
<%--        }--%>
<%--        else return true;--%>
<%--    }--%>

<%--    function pswOK(psw, psw_confirmation) {--%>
<%--        if (psw !== psw_confirmation){--%>
<%--            window.alert("The passwords are not matched");--%>
<%--            return false;--%>
<%--        }--%>
<%--        else if (psw.replace(/(^s*)|(s*$)/g, "").length ===0){--%>
<%--            alert("password is empty");--%>
<%--            return false;--%>
<%--        }--%>
<%--        else return true;--%>

<%--    }--%>

<%--    function zipOK(zip) {--%>
<%--        let zippattern=new RegExp("(\\d{5}([\\-]\\d{4})?)");--%>
<%--        if (!zip.match(zippattern)){--%>
<%--            window.alert("The zip is not matched to the zip pattern");--%>
<%--            return false;}--%>
<%--        else return true;--%>

<%--    }--%>

<%--    function ageOK(startdate){--%>
<%--        if (startdate.toString().length<10){--%>
<%--            alert("日期不完整")--%>
<%--            return false;--%>
<%--        }--%>
<%--        let nowDate = new Date(); // 当前时间--%>
<%--        console.log(nowDate);--%>
<%--        let nowdate = nowDate.getDate().toString();--%>
<%--        console.log(nowdate);--%>
<%--        let nowmonth = parseInt(nowDate.getMonth().toString())+1;--%>
<%--        console.log(nowmonth);--%>
<%--        let nowyear = nowDate.getFullYear().toString();--%>
<%--        console.log(nowyear);--%>
<%--        console.log(startdate);--%>
<%--        let start = startdate.toString().split( "-" )--%>
<%--        console.log(start[0].toString());--%>
<%--        console.log(start[1].toString());--%>
<%--        console.log(start[2].toString());--%>
<%--        // window.alert("you are a child!");--%>
<%--        let gapyear = parseInt(nowyear)-parseInt(start[0]);--%>
<%--        let gapmonth = parseInt(nowmonth)-parseInt(start[1]);--%>
<%--        let gapday = parseInt(nowdate)-parseInt(start[2]);--%>

<%--        console.log(gapyear);--%>
<%--        console.log(gapmonth);--%>
<%--        console.log(gapday);--%>

<%--        if (parseInt(gapyear)<18){--%>
<%--            window.alert("you are a child!");--%>
<%--            return false;--%>
<%--        }--%>
<%--        else if (parseInt(gapyear)===18){--%>


<%--            if (gapmonth<0){--%>
<%--                window.alert("you are a child!");--%>
<%--                return false;}--%>

<%--            else if (gapmonth===0){--%>
<%--                if (gapday<0){--%>
<%--                    window.alert("you are a child!");--%>
<%--                    console.log(start[2]);--%>
<%--                    console.log("test");--%>
<%--                    return false;--%>
<%--                }--%>
<%--                else return true;--%>
<%--            }--%>
<%--            else return true;--%>
<%--        }--%>
<%--        else {--%>
<%--            console.log("test");--%>
<%--            return true;--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>
</body>
</html>
