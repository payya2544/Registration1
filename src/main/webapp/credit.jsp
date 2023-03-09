<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/credit_style.css">

</head>
<body>

<div class="container">

    <div class="card-container">

        <div class="front">
            <div class="image">
                <img src="pic/chip.png" alt="">
                <img  id="demo1" src="pic/visa.png" alt="">
            </div>
            <div class="card-number-box">################</div>
            <div class="flexbox">
                <div class="box">
                    <span>card holder</span>
                    <div class="card-holder-name">full name</div>
                </div>
                <div class="box">
                    <span>expires</span>
                    <div class="expiration">
                        <span class="exp-month">mm</span>
                        <span class="exp-year">yy</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="back">
            <div class="stripe"></div>
            <div class="box">
                <span>cvv</span>
                <div class="cvv-box"></div>
                <img src="pic/visa.png" alt="">
            </div>
        </div>

    </div>

    <form action="">
        <div class="inputBox">
            <span>card number</span>
            <input type="text" maxlength="16" class="card-number-input">
        </div>
        <div class="inputBox">
            <span>card holder</span>
            <input type="text" class="card-holder-input">
        </div>
        <div class="flexbox">
            <div class="inputBox">
                <span>expiration mm</span>
                <select name="" id="" class="month-input">
                    <option value="month" selected disabled>month</option>
                    <option value="01">01</option>
                    <option value="02">02</option>
                    <option value="03">03</option>
                    <option value="04">04</option>
                    <option value="05">05</option>
                    <option value="06">06</option>
                    <option value="07">07</option>
                    <option value="08">08</option>
                    <option value="09">09</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                </select>
            </div>
            <div class="inputBox">
                <span>expiration yy</span>
                <select name="" id="" class="year-input">
                    <option value="year" selected disabled>year</option>
                    <option value="2021">2021</option>
                    <option value="2022">2022</option>
                    <option value="2023">2023</option>
                    <option value="2024">2024</option>
                    <option value="2025">2025</option>
                    <option value="2026">2026</option>
                    <option value="2027">2027</option>
                    <option value="2028">2028</option>
                    <option value="2029">2029</option>
                    <option value="2030">2030</option>
                </select>
            </div>
            <div class="inputBox">
                <span>cvv</span>
                <input type="text" maxlength="4" class="cvv-input">
            </div>
        </div>
        <input type="submit" value="purchase" class="submit-btn">
    </form>

</div> 
<!--<p id="demo"></p>
<div class="image">
 <img id="demo1" src="pic/visa.png" alt="">
</div>
    -->





<script>

function detectCardType(number) {
    var re = {
        electron: /^(4026|417500|4405|4508|4844|4913|4917)\d+$/,
        maestro: /^(5018|5020|5038|5612|5893|6304|6759|6761|6762|6763|0604|6390)\d+$/,
        dankort: /^(5019)\d+$/,
        interpayment: /^(636)\d+$/,
        unionpay: /^(62|88)\d+$/,
        visa: /^4[0-9]{12}(?:[0-9]{3})?$/,
        mastercard: /^5[1-5][0-9]{14}$/,
        amex: /^3[47][0-9]{13}$/,
        diners: /^3(?:0[0-5]|[68][0-9])[0-9]{11}$/,
        discover: /^6(?:011|5[0-9]{2})[0-9]{12}$/,
        jcb: /^(?:2131|1800|35\d{3})\d{11}$/
    }

    for(var key in re) {
        if(re[key].test(number)) {
            return key
        }
    }
}

document.querySelector('.card-number-input').oninput = () =>{
    document.querySelector('.card-number-box').innerText = document.querySelector('.card-number-input').value;
    //document.getElementById("demo").innerHTML = detectCardType(document.querySelector('.card-number-input').value);
    if(detectCardType(document.querySelector('.card-number-input').value) == 'visa'){document.getElementById("demo1").src="pic/CreditLogo/visa.png";}
    else if(detectCardType(document.querySelector('.card-number-input').value) == 'mastercard'){document.getElementById("demo1").src="pic/CreditLogo/MC.png";}
    else if(detectCardType(document.querySelector('.card-number-input').value) == 'amex'){document.getElementById("demo1").src="pic/CreditLogo/AMEX.png";}
    else if(detectCardType(document.querySelector('.card-number-input').value) == 'diners'){document.getElementById("demo1").src="pic/CreditLogo/DINERS.png";}
    else if(detectCardType(document.querySelector('.card-number-input').value) == 'discover'){document.getElementById("demo1").src="pic/CreditLogo/DISCOVER.png";}
    else if(detectCardType(document.querySelector('.card-number-input').value) == 'jcb'){document.getElementById("demo1").src="pic/CreditLogo/JCB.png";}
    else if(detectCardType(document.querySelector('.card-number-input').value) == 'unionpay'){document.getElementById("demo1").src="pic/CreditLogo/UnionPay.png";}
    else if(detectCardType(document.querySelector('.card-number-input').value) == 'interpayment'){document.getElementById("demo1").src="pic/CreditLogo/INTERPAY.png";}
    else if(detectCardType(document.querySelector('.card-number-input').value) == 'dankort'){document.getElementById("demo1").src="pic/CreditLogo/DANKORT.png";}
    else if(detectCardType(document.querySelector('.card-number-input').value) == 'maestro'){document.getElementById("demo1").src="pic/CreditLogo/MAESTRO.png";}
    else if(detectCardType(document.querySelector('.card-number-input').value) == 'electron'){document.getElementById("demo1").src="pic/CreditLogo/Electron.png";}    
}

document.querySelector('.card-holder-input').oninput = () =>{
    document.querySelector('.card-holder-name').innerText = document.querySelector('.card-holder-input').value;
}

document.querySelector('.month-input').oninput = () =>{
    document.querySelector('.exp-month').innerText = document.querySelector('.month-input').value;
}

document.querySelector('.year-input').oninput = () =>{
    document.querySelector('.exp-year').innerText = document.querySelector('.year-input').value;
}

document.querySelector('.cvv-input').onmouseenter = () =>{
    document.querySelector('.front').style.transform = 'perspective(1000px) rotateY(-180deg)';
    document.querySelector('.back').style.transform = 'perspective(1000px) rotateY(0deg)';
}

document.querySelector('.cvv-input').onmouseleave = () =>{
    document.querySelector('.front').style.transform = 'perspective(1000px) rotateY(0deg)';
    document.querySelector('.back').style.transform = 'perspective(1000px) rotateY(180deg)';
}

document.querySelector('.cvv-input').oninput = () =>{
    document.querySelector('.cvv-box').innerText = document.querySelector('.cvv-input').value;
}

</script>







</body>
</html>