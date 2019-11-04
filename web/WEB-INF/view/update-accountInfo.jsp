<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js" lang="en">
<head>
    <!--- basic page needs
        ================================================== -->
    <meta charset="utf-8">
    <title>Update Account</title>

    <!-- mobile specific metas
    ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS
    ================================================== -->
    <link href="./froala-editor/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="/css/avatar.css">

    <link rel="stylesheet" href="css/base.css" type="text/css">
    <link rel="stylesheet" href="css/vendor.css" type="text/css">
    <link rel="stylesheet" href="css/main.css" type="text/css">

    <!-- script
    ================================================== -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="js/modernizr.js" type="text/javascript"></script>

</head>

<body id="top">

<!-- preloader
================================================== -->
<div id="preloader">
    <div id="loader" class="dots-fade">
        <div></div>
        <div></div>
        <div></div>
    </div>
</div>

<!-- header
================================================== -->
<header class="s-header header">

    <div class="header__logo">
        <a class="logo" href="/articles">
            <img src="assets/images/logo.png" alt="Homepage">
        </a>
    </div> <!-- end header__logo -->

    <a class="header__search-trigger" href="#0"></a>
    <div class="header__search">

        <form method="get" class="header__search-form" action="/search-article">
            <label>
                <span class="hide-content">Search for:</span>
                <input type="search" class="search-field" placeholder="Type Keywords" value="" name="search"
                       title="Search for:" autocomplete="off">
            </label>
            <input type="submit" class="search-submit" value="Search">
        </form>

        <a href="#0" title="Close Search" class="header__overlay-close">Close</a>

    </div>  <!-- end header__search -->

    <a class="header__toggle-menu" href="#0" title="Menu"><span>Menu</span></a>
    <nav class="header__nav-wrap">

        <h2 class="header__nav-heading h6">Navigate to</h2>

        <ul class="header__nav">
            <li class="current"><a href="/articles" title="">Home</a></li>
            <li><a href="/newArticle" title="">Compose</a></li>
            <li class="has-children">
                <a href="/articles" title="">Articles</a>
                <ul class="sub-menu">
                    <li><a href="/articles">All articles</a></li>
                    <li><a href="/articlesByUsers">Your articles</a></li>
                </ul>
            </li>
            <li><a href="/updateInfo" title="">Profile</a></li>
            <li class="has-children">
                <a href="#0" title="">Gallery</a>
                <ul class="sub-menu">
                    <li><a href="/user_gallery">All</a></li>
                    <li><a href="/personal_gallery">Your gallery</a></li>
                </ul>
            </li>
            <li class="has-children">
                <a href="/user-login" title="">account</a>
                <ul class="sub-menu">
                    <li><a href="/user-login">Log in</a></li>
                    <li><a onclick="logoff()">Log out</a></li>
                    <li><a href="/user-signup">Sign up</a></li>
                </ul>
            </li>
        </ul> <!-- end header__nav -->

    </nav> <!-- end header__nav-wrap -->

</header> <!-- s-header -->

<!-- s-content
================================================== -->
<section class="s-content s-content--top-padding s-content--narrow">

    <div class="row narrow">
        <div class="col-full s-content__header">
            <h1 class="display-1 display-1--with-line-sep">Account Info Update</h1>
            <%--<p>(get username from session. If the user has no account info, it should say/display: you need to create
                your
                account info at very first time. If the user has account info, just update it.)</p>--%>
        </div>
    </div>

    <%--TODO: check this out and debug code above : https://codepen.io/siremilomir/pen/jBbQGo--%>
    <%--<form id="form" method="post" action="/userInterface">--%>
    <%--    <p>First Name<input type="text" id="fname" name="fname"></p>--%>
    <%--    <p>Last Name<input type="text" id="lname" name="lname"></p>--%>
    <%--    <p>Email Address<input type="text" id="email"></p>--%>
    <%--    <p>Phone<input type="text" id="phonenum"></p>--%>
    <%--    <p>Date of Birth<input type="date" id="date" max= 2029-10-10></p> &lt;%&ndash;date here should be handled as String&ndash;%&gt;--%>
    <%--&lt;%&ndash;TODO: copy the dropdown list from the former project, and make the desc done, and avatar&ndash;%&gt;--%>
    <%--    <p>Country<input id="country"><p>--%>
    <%--    <p>Description<input id="description"><p>--%>

    <%--    <p>Choose a avatar or update your own one<input id="avatar"></p>--%>

    <%--    <p><time hidden name="timestamp" value="gettimestamp()">time</time></p>--%>
    <%--    <button type="submit" >submit</button>--%>
    <%--    <button type="reset" value="reset">clear</button>--%>
    <%--</form>--%>

    <div class="row">
        <div class="col-full s-content__main">
            <form action="./userInterface" method="post" enctype="multipart/form-data" class="contact-form">
                <fieldset>
                    <div>
                        <label for="fname">First Name</label>
                        <input type="text" id="fname" name="fname" class="full-width" placeholder="Kate" required>
                    </div>
                    <div>
                        <label for="lname">Last Name</label>
                        <input type="text" id="lname" name="lname" class="full-width" placeholder="Smith" required>
                    </div>
                    <div>
                        <label for="email">Email Address</label>
                        <input type="text" id="email" name="email" class="full-width"
                               placeholder="awesomeblogger@blog.com">
                    </div>
                    <div>
                        <label for="phonenum">Phone</label>
                        <input type="text" id="phonenum" name="phonenum" class="full-width" placeholder="1234567">
                    </div>
                    <div>
                        <label>Date of Birth</label>
                        <input type="date" name="date" max=2029-10-10 placeholder="30-12-1997">
                    </div>
                    <%--date here should be handled as String--%>
                    <div>
                        <label for="sampleRecipientInput">Country</label>
                        <div class="cl-custom-select">
                            <select id="sampleRecipientInput" name="country" class="full-width">
                                <option value="United States">United States</option>
                                <option value="United Kingdom">United Kingdom</option>
                                <option value="Afghanistan">Afghanistan</option>
                                <option value="Albania">Albania</option>
                                <option value="Algeria">Algeria</option>
                                <option value="American Samoa">American Samoa</option>
                                <option value="Andorra">Andorra</option>
                                <option value="Angola">Angola</option>
                                <option value="Anguilla">Anguilla</option>
                                <option value="Antarctica">Antarctica</option>
                                <option value="Antigua and Barbuda">Antigua and Barbuda</option>
                                <option value="Argentina">Argentina</option>
                                <option value="Armenia">Armenia</option>
                                <option value="Aruba">Aruba</option>
                                <option value="Australia">Australia</option>
                                <option value="Austria">Austria</option>
                                <option value="Azerbaijan">Azerbaijan</option>
                                <option value="Bahamas">Bahamas</option>
                                <option value="Bahrain">Bahrain</option>
                                <option value="Bangladesh">Bangladesh</option>
                                <option value="Barbados">Barbados</option>
                                <option value="Belarus">Belarus</option>
                                <option value="Belgium">Belgium</option>
                                <option value="Belize">Belize</option>
                                <option value="Benin">Benin</option>
                                <option value="Bermuda">Bermuda</option>
                                <option value="Bhutan">Bhutan</option>
                                <option value="Bolivia">Bolivia</option>
                                <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
                                <option value="Botswana">Botswana</option>
                                <option value="Bouvet Island">Bouvet Island</option>
                                <option value="Brazil">Brazil</option>
                                <option value="British Indian Ocean Territory">British Indian Ocean Territory
                                </option>
                                <option value="Brunei Darussalam">Brunei Darussalam</option>
                                <option value="Bulgaria">Bulgaria</option>
                                <option value="Burkina Faso">Burkina Faso</option>
                                <option value="Burundi">Burundi</option>
                                <option value="Cambodia">Cambodia</option>
                                <option value="Cameroon">Cameroon</option>
                                <option value="Canada">Canada</option>
                                <option value="Cape Verde">Cape Verde</option>
                                <option value="Cayman Islands">Cayman Islands</option>
                                <option value="Central African Republic">Central African Republic</option>
                                <option value="Chad">Chad</option>
                                <option value="Chile">Chile</option>
                                <option value="China">China</option>
                                <option value="Christmas Island">Christmas Island</option>
                                <option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
                                <option value="Colombia">Colombia</option>
                                <option value="Comoros">Comoros</option>
                                <option value="Congo">Congo</option>
                                <option value="Congo, The Democratic Republic of The">Congo, The Democratic Republic
                                    of
                                    The
                                </option>
                                <option value="Cook Islands">Cook Islands</option>
                                <option value="Costa Rica">Costa Rica</option>
                                <option value="Cote D'ivoire">Cote D'ivoire</option>
                                <option value="Croatia">Croatia</option>
                                <option value="Cuba">Cuba</option>
                                <option value="Cyprus">Cyprus</option>
                                <option value="Czech Republic">Czech Republic</option>
                                <option value="Denmark">Denmark</option>
                                <option value="Djibouti">Djibouti</option>
                                <option value="Dominica">Dominica</option>
                                <option value="Dominican Republic">Dominican Republic</option>
                                <option value="Ecuador">Ecuador</option>
                                <option value="Egypt">Egypt</option>
                                <option value="El Salvador">El Salvador</option>
                                <option value="Equatorial Guinea">Equatorial Guinea</option>
                                <option value="Eritrea">Eritrea</option>
                                <option value="Estonia">Estonia</option>
                                <option value="Ethiopia">Ethiopia</option>
                                <option value="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>
                                <option value="Faroe Islands">Faroe Islands</option>
                                <option value="Fiji">Fiji</option>
                                <option value="Finland">Finland</option>
                                <option value="France">France</option>
                                <option value="French Guiana">French Guiana</option>
                                <option value="French Polynesia">French Polynesia</option>
                                <option value="French Southern Territories">French Southern Territories</option>
                                <option value="Gabon">Gabon</option>
                                <option value="Gambia">Gambia</option>
                                <option value="Georgia">Georgia</option>
                                <option value="Germany">Germany</option>
                                <option value="Ghana">Ghana</option>
                                <option value="Gibraltar">Gibraltar</option>
                                <option value="Greece">Greece</option>
                                <option value="Greenland">Greenland</option>
                                <option value="Grenada">Grenada</option>
                                <option value="Guadeloupe">Guadeloupe</option>
                                <option value="Guam">Guam</option>
                                <option value="Guatemala">Guatemala</option>
                                <option value="Guinea">Guinea</option>
                                <option value="Guinea-bissau">Guinea-bissau</option>
                                <option value="Guyana">Guyana</option>
                                <option value="Haiti">Haiti</option>
                                <option value="Heard Island and Mcdonald Islands">Heard Island and Mcdonald
                                    Islands
                                </option>
                                <option value="Holy See (Vatican City State)">Holy See (Vatican City State)</option>
                                <option value="Honduras">Honduras</option>
                                <option value="Hong Kong">Hong Kong</option>
                                <option value="Hungary">Hungary</option>
                                <option value="Iceland">Iceland</option>
                                <option value="India">India</option>
                                <option value="Indonesia">Indonesia</option>
                                <option value="Iran, Islamic Republic of">Iran, Islamic Republic of</option>
                                <option value="Iraq">Iraq</option>
                                <option value="Ireland">Ireland</option>
                                <option value="Israel">Israel</option>
                                <option value="Italy">Italy</option>
                                <option value="Jamaica">Jamaica</option>
                                <option value="Japan">Japan</option>
                                <option value="Jordan">Jordan</option>
                                <option value="Kazakhstan">Kazakhstan</option>
                                <option value="Kenya">Kenya</option>
                                <option value="Kiribati">Kiribati</option>
                                <option value="Korea, Democratic People's Republic of">Korea, Democratic People's
                                    Republic
                                    of
                                </option>
                                <option value="Korea, Republic of">Korea, Republic of</option>
                                <option value="Kuwait">Kuwait</option>
                                <option value="Kyrgyzstan">Kyrgyzstan</option>
                                <option value="Lao People's Democratic Republic">Lao People's Democratic Republic
                                </option>
                                <option value="Latvia">Latvia</option>
                                <option value="Lebanon">Lebanon</option>
                                <option value="Lesotho">Lesotho</option>
                                <option value="Liberia">Liberia</option>
                                <option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
                                <option value="Liechtenstein">Liechtenstein</option>
                                <option value="Lithuania">Lithuania</option>
                                <option value="Luxembourg">Luxembourg</option>
                                <option value="Macao">Macao</option>
                                <option value="Macedonia, The Former Yugoslav Republic of">Macedonia, The Former
                                    Yugoslav
                                    Republic of
                                </option>
                                <option value="Madagascar">Madagascar</option>
                                <option value="Malawi">Malawi</option>
                                <option value="Malaysia">Malaysia</option>
                                <option value="Maldives">Maldives</option>
                                <option value="Mali">Mali</option>
                                <option value="Malta">Malta</option>
                                <option value="Marshall Islands">Marshall Islands</option>
                                <option value="Martinique">Martinique</option>
                                <option value="Mauritania">Mauritania</option>
                                <option value="Mauritius">Mauritius</option>
                                <option value="Mayotte">Mayotte</option>
                                <option value="Mexico">Mexico</option>
                                <option value="Micronesia, Federated States of">Micronesia, Federated States of
                                </option>
                                <option value="Moldova, Republic of">Moldova, Republic of</option>
                                <option value="Monaco">Monaco</option>
                                <option value="Mongolia">Mongolia</option>
                                <option value="Montserrat">Montserrat</option>
                                <option value="Morocco">Morocco</option>
                                <option value="Mozambique">Mozambique</option>
                                <option value="Myanmar">Myanmar</option>
                                <option value="Namibia">Namibia</option>
                                <option value="Nauru">Nauru</option>
                                <option value="Nepal">Nepal</option>
                                <option value="Netherlands">Netherlands</option>
                                <option value="Netherlands Antilles">Netherlands Antilles</option>
                                <option value="New Caledonia">New Caledonia</option>
                                <option value="New Zealand">New Zealand</option>
                                <option value="Nicaragua">Nicaragua</option>
                                <option value="Niger">Niger</option>
                                <option value="Nigeria">Nigeria</option>
                                <option value="Niue">Niue</option>
                                <option value="Norfolk Island">Norfolk Island</option>
                                <option value="Northern Mariana Islands">Northern Mariana Islands</option>
                                <option value="Norway">Norway</option>
                                <option value="Oman">Oman</option>
                                <option value="Pakistan">Pakistan</option>
                                <option value="Palau">Palau</option>
                                <option value="Palestinian Territory, Occupied">Palestinian Territory, Occupied
                                </option>
                                <option value="Panama">Panama</option>
                                <option value="Papua New Guinea">Papua New Guinea</option>
                                <option value="Paraguay">Paraguay</option>
                                <option value="Peru">Peru</option>
                                <option value="Philippines">Philippines</option>
                                <option value="Pitcairn">Pitcairn</option>
                                <option value="Poland">Poland</option>
                                <option value="Portugal">Portugal</option>
                                <option value="Puerto Rico">Puerto Rico</option>
                                <option value="Qatar">Qatar</option>
                                <option value="Reunion">Reunion</option>
                                <option value="Romania">Romania</option>
                                <option value="Russian Federation">Russian Federation</option>
                                <option value="Rwanda">Rwanda</option>
                                <option value="Saint Helena">Saint Helena</option>
                                <option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
                                <option value="Saint Lucia">Saint Lucia</option>
                                <option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
                                <option value="Saint Vincent and The Grenadines">Saint Vincent and The Grenadines
                                </option>
                                <option value="Samoa">Samoa</option>
                                <option value="San Marino">San Marino</option>
                                <option value="Sao Tome and Principe">Sao Tome and Principe</option>
                                <option value="Saudi Arabia">Saudi Arabia</option>
                                <option value="Senegal">Senegal</option>
                                <option value="Serbia and Montenegro">Serbia and Montenegro</option>
                                <option value="Seychelles">Seychelles</option>
                                <option value="Sierra Leone">Sierra Leone</option>
                                <option value="Singapore">Singapore</option>
                                <option value="Slovakia">Slovakia</option>
                                <option value="Slovenia">Slovenia</option>
                                <option value="Solomon Islands">Solomon Islands</option>
                                <option value="Somalia">Somalia</option>
                                <option value="South Africa">South Africa</option>
                                <option value="South Georgia and The South Sandwich Islands">South Georgia and The
                                    South
                                    Sandwich Islands
                                </option>
                                <option value="Spain">Spain</option>
                                <option value="Sri Lanka">Sri Lanka</option>
                                <option value="Sudan">Sudan</option>
                                <option value="Suriname">Suriname</option>
                                <option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option>
                                <option value="Swaziland">Swaziland</option>
                                <option value="Sweden">Sweden</option>
                                <option value="Switzerland">Switzerland</option>
                                <option value="Syrian Arab Republic">Syrian Arab Republic</option>
                                <option value="Taiwan, Province of China">Taiwan, Province of China</option>
                                <option value="Tajikistan">Tajikistan</option>
                                <option value="Tanzania, United Republic of">Tanzania, United Republic of</option>
                                <option value="Thailand">Thailand</option>
                                <option value="Timor-leste">Timor-leste</option>
                                <option value="Togo">Togo</option>
                                <option value="Tokelau">Tokelau</option>
                                <option value="Tonga">Tonga</option>
                                <option value="Trinidad and Tobago">Trinidad and Tobago</option>
                                <option value="Tunisia">Tunisia</option>
                                <option value="Turkey">Turkey</option>
                                <option value="Turkmenistan">Turkmenistan</option>
                                <option value="Turks and Caicos Islands">Turks and Caicos Islands</option>
                                <option value="Tuvalu">Tuvalu</option>
                                <option value="Uganda">Uganda</option>
                                <option value="Ukraine">Ukraine</option>
                                <option value="United Arab Emirates">United Arab Emirates</option>
                                <option value="United Kingdom">United Kingdom</option>
                                <option value="United States">United States</option>
                                <option value="United States Minor Outlying Islands">United States Minor Outlying
                                    Islands
                                </option>
                                <option value="Uruguay">Uruguay</option>
                                <option value="Uzbekistan">Uzbekistan</option>
                                <option value="Vanuatu">Vanuatu</option>
                                <option value="Venezuela">Venezuela</option>
                                <option value="Viet Nam">Viet Nam</option>
                                <option value="Virgin Islands, British">Virgin Islands, British</option>
                                <option value="Virgin Islands, U.S.">Virgin Islands, U.S.</option>
                                <option value="Wallis and Futuna">Wallis and Futuna</option>
                                <option value="Western Sahara">Western Sahara</option>
                                <option value="Yemen">Yemen</option>
                                <option value="Zambia">Zambia</option>
                                <option value="Zimbabwe">Zimbabwe</option>
                            </select>
                        </div>
                    </div>
                    <div>
                        <label for="description">Description</label>
                        <textarea id="description" name="description" class="full-width"
                                  placeholder="Tell me something about you"></textarea>
                    </div>

                    <%--        <p>Choose a avatar or update your own one</p><input type="file" name="avatar" accept="image/png, image/jpeg" />--%>
                    <%--<p><time hidden name="timestamp" value="gettimestamp()">time</time></p>--%>
                    <div class="container">
                        <h1>jQuery Image Upload
                            <small>with preview</small>
                        </h1>
                        <div class="avatar-upload">
                            <div class="avatar-edit">
                                <input type='file' id="imageUpload" name="avatar" accept=".png, .jpg, .jpeg"/>
                                <label for="imageUpload"></label>
                            </div>
                            <div class="avatar-preview">
                                <div id="imagePreview" style="background-image: url(http://i.pravatar.cc/500?img=7);">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <button type="submit" value="submit" class="submit btn btn--primary btn--large full-width">
                            Submit
                        </button>
                    </div>
                    <div>
                        <button type="reset" class="reset btn btn--large full-width">Reset</button>
                    </div>
                </fieldset>
            </form>
        </div> <!-- s-content__main -->
    </div> <!-- end row -->

</section> <!-- end s-content -->

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

<!-- s-footer
================================================== -->
<footer class="s-footer">
    <div class="s-footer__main">
        <p style="text-align: center"> This website is made with <i class="fa fa-heart" aria-hidden="true"></i> by
            NeverBeLate* team </p>
    </div>
    <div class="go-top">
        <a class="smoothscroll" title="Back to Top" href="#top"></a>
    </div>
</footer> <!-- end s-footer -->

<!-- Java Script
    ================================================== -->
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="js/plugins.js" type="text/javascript"></script>
<script src="js/main.js" type="text/javascript"></script>

<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#imagePreview').css('background-image', 'url(' + e.target.result + ')');
                $('#imagePreview').hide();
                $('#imagePreview').fadeIn(650);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#imageUpload").change(function () {
        readURL(this);
    });
</script>

<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#imagePreview').css('background-image', 'url(' + e.target.result + ')');
                $('#imagePreview').hide();
                $('#imagePreview').fadeIn(650);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#imageUpload").change(function () {
        readURL(this);
    });
</script>

</body>
</html>
