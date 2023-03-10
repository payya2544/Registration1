<%-- 
    Document   : check
    Created on : Jun 30, 2022, 11:46:46 PM
    Author     : Acer
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mycompany.idrsproject.DBConnection" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>IDRS_Registration</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--        <link href="css/Indexstyle.css" rel="stylesheet" type="text/css">-->
        <link href="css/indexstyle.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/css/intlTelInput.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/js/intlTelInput.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/js/utils.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="imglogo">
                <img class="mahidollogo" src="pic/idrsmu.png" alt="idrsmu" >
            </div>
            <div class="title">Registration</div>
            <div class="content">
                <form action="check.jsp"  method="post">
                    <div class="user-details">

                        <div class="input-box">
                            <span class="details">First Name</span>
                            <input type="text" placeholder="Enter your first name" name="fname" required>
                        </div>

                        <div class="input-box">
                            <span class="details">Last Name</span>
                            <input type="text" placeholder="Enter your  last name" name="lname" required>
                        </div>

                        <div class="input-box">
                            <span class="details">Email</span>
                            <input type="email" placeholder="Enter your email" name="email" required>
                            <p class="notify" >*Confirmation and receipt emailed to this email address</p>
                        </div>

                        <!--                        <div class="input-box">
                                                    <span class="details">Phone Number</span>
                                                    <input type="text" placeholder="Enter your number" name="phone" required>
                                                </div>-->
                        <div class="input-box">
                            <span class="details">Affiliation</span>
                            <input type="text" placeholder="Enter your affiliation" name="affiliation" required>
                            <p class="notify">*Current place of study/work or other - on more than s affiliations, this will go on your name tag</p>
                        </div>
                        <div class="input-box">
                            <span class="details">Preferred pronouns</span>
                            <input type="text" placeholder="Enter your pronouns" name="pronouns" required>
                            <p class="notify">*if any - this will go on your name tag</p>
                        </div>
                        <!--                        phone Number with country code-->

                        <div class="input-box">              
                            <span class="details">Phone Number</span>
                            <input type="tel" id="phone" name="phone[main]" placeholder="Enter phone number">
                            <!--                            <span id="valid-msg" class="hide">✓ Valid</span>
                                                        <span id="error-msg" class="hide"></span>-->

                        </div>
                        <div class="input-box">
                            <span class="details">Current address</span>
                            <input type="text" placeholder="Enter your address" name="address" required>
                        </div>

                        <div class="input-box">
                            <span class="details">Registration package</span>
                            <select name="planid" class="planid" required >
                                <option value="" selected disabled hidden class="textplan">Choose your package</option>
                                <%
                                    try {
                                        Statement statement = null;
                                        ResultSet resultSet = null;
                                        Connection connection = DBConnection.getConnection();
                                        statement = connection.createStatement();
                                        String sql = "select * from promos";
                                        resultSet = statement.executeQuery(sql);
                                        while (resultSet.next()) {
                                %>
                                <option value="<%=resultSet.getString("promo_id")%>"><%=resultSet.getString("promo_name")%></option>
                                <%
                                        }
                                        connection.close();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                            </select>
                        </div>

                    </div>
                    <!--                <div class="gender-details">
                                            <input type="radio" name="gender" id="dot-1">
                                            <input type="radio" name="gender" id="dot-2">
                                            <input type="radio" name="gender" id="dot-3">
                                            <span class="gender-title">Gender</span>
                                            <div class="category">
                                                <label for="dot-1">
                                                    <span class="dot one"></span>
                                                    <span class="gender">Male</span>
                                                </label>
                                                <label for="dot-2">
                                                    <span class="dot two"></span>
                                                    <span class="gender">Female</span>
                                                </label>
                                                <label for="dot-3">
                                                    <span class="dot three"></span>
                                                    <span class="gender">Prefer not to say</span>
                                                </label>
                                            </div>
                                        </div>-->
                    <div>
                        <input type="checkbox" id="cerify" name="cerify" value="" required="">
                        <label for="cerify">I certify that if I select the member or student rate, I will be an IDRS member during the conference (July 18-22, 2023)</label>
                    </div>
                    <!--                            <div class="certify">
                                                    <input type="radio" name="cerify" id="dot-certify">
                                                 <div class="certify-checkbox">
                                                <label for="dot-certify" id="dot-certify">
                                                    <span class="dot certify"></span>
                                                    <span class="gender">I certify that if I select the member or student rate, I will be an IDRS member during the conference (July 18-22, 2023)</span>
                                                </label> 
                                                 </div>
                                                    
                                        </div>       -->
                    <div class="button">
                        <input type="submit" name="action" value="register" >
                    </div>
                </form>
            </div>
        </div>

    </body>
</html>
<script type="text/javascript">
    var input = document.querySelector("#phone"),
            errorMsg = document.querySelector("#error-msg"),
            validMsg = document.querySelector("#valid-msg");

    // here, the index maps to the error code returned from getValidationError - see readme
    var errorMap = ["Invalid number", "Invalid country code", "Too short", "Too long", "Invalid number"];

    // initialise plugin
//                            var iti = window.intlTelInput(input, {
//                                utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/js/utils.js",
//                                customPlaceholder: function (selectedCountryPlaceholder, selectedCountryData) {
//                                    return "e.g. " + selectedCountryPlaceholder;
//                                }
//                            });
    var phone_number = window.intlTelInput(input, {
        separateDialCode: true,
        preferredCountries: ["th"],
        hiddenInput: "full",
        utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/js/utils.js"
    });

    $("form").submit(function () {
        var full_number = phone_number.getNumber(intlTelInputUtils.numberFormat.E164);
        $("input[name='phone[full]'").val(full_number);
        console.log(full_number);
    });
    var reset = function () {
        input.classList.remove("error");
        errorMsg.innerHTML = "";
        errorMsg.classList.add("hide");
        validMsg.classList.add("hide");
    };
    // on blur: validate
    input.addEventListener('blur', function () {
        reset();
        if (input.value.trim()) {
            if (phone_number.isValidNumber()) {
                validMsg.classList.remove("hide");
            } else {
                input.classList.add("error");
                var errorCode = phone_number.getValidationError();
                errorMsg.innerHTML = errorMap[errorCode];
                errorMsg.classList.remove("hide");
            }
        }
    });
    // on keyup / change flag: reset
    input.addEventListener('change', reset);
    input.addEventListener('keyup', reset);
</script>
