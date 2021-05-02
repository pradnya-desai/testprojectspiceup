<html>
<%@include file="conn.jsp" %>
<%
String user=request.getParameter("t1");
String pass=request.getParameter("t2");

		try
		{
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from login where username = '"+user+"' and password = '"+pass+"'");
		if(rs.next())
		{
			response.sendRedirect("Dashboard.html");
		}
		else
			out.println("Login Denied");

		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
%>
<head>
  <!--bootstrap libraries for implementation of bootstrap and css-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<!-- Start Of CSS-->
<style>
    /* start of navbar css */
    body {
      font-family: ariel;

    }

    #colour {
      color: #5f5950;
    }

     /*img {
      overflow: hidden;
      position: absolute;
    } */

    .navbar {
  overflow: hidden; 
  background-color: #333;
  position: fixed;
  /* Set the navbar to fixed position */
  top: 0;
  position: fixed;
  right: 0;
  z-index: 1030;
   /* Position the navbar at the top of the page */
  width: 100%;
  /* Full width */
  left: 0;
  /* overflow: visible; */
  align-items: center;
  justify-content: space-between;
  padding-bottom: 0.5rem;
    }

    .navbar ul li {
      list-style-type: none;
      width: 120px;
      /* padding: 5px; */
      float: left;
      text-align: center;
      /* margin-right: 50px; */
      padding-top: 8px;
    }
.navbar ul{
  display: inline;
  text-align: center;
  margin-right: 150px;
}

.navbar ul li a {
      text-decoration: none;
      color: darkgray;
    }
/*hover effect*/
    .navbar ul li:hover {
      
      background-color: #ff9b08;
    }
/*hover effect change of text color*/
    .navbar ul li a:hover {
      color: white;
    }

/*end of navbar css*/

    /* about us css*/
    .abt h3 {
      font-family: Viner Hand ITC;
      margin-top: 0px;
      font-size: 34px;
      font-weight: 400;
    }
/*end of about us css*/
/* css for sections*/
#page2 {
      height: 650px;
      background-color: #fffaf3;
    }

    #page2 .abt p {
      margin-top: 20px;
    }
    #s1 {
      color: #5f5950;
    }
    #page1 {
      height:70px;
    }

    #page3 {
      height: 850px;
      background-image: 
      url(https://chefoussama.com/wp-content/uploads/2020/05/kcal_faq_bg.jpg);

    }
/*end of css for section */

/*css for footer element*/ 
footer {
      margin-top:420px;
      overflow: hidden;
 position: fixed;
  left: 0;
  bottom: 0;
  width: 100%;
  background-color:#333;
  color: white;
  text-align: center;
    } 

/* css for images on the carousel*/
    .carousel-control-prev-icon,.carousel-control-next-icon{
      background-color:#333;
    }
    @keyframes blink{
  0%{
    opacity: 1;
  }
  50%{
    opacity: 0;
  }
  100%{
    opacity: 1;
  }
}
#blink11{
  animation: blink 2s ease-in-out infinite;
}
#blink11:hover{
  font-size: x-large;
}
 /*css for our menu & our speciality buttons on section 3*/
.ourspeciality{
  font-size: 25px;
  color: #444444;
  font-family:georgia;
  border:3px solid #00b0e0;
  border-radius: 5em;
margin-left :400px;
} 
.ourmenu{
  font-size: 25px;
  color: #444444;
  font-family:georgia;
  border:3px solid #00b0e0;
  border-radius: 5em;
  margin-left: 400px;
}
 
.res-menu button:hover{
  font-size: x-large;
}
/* end of css for buttons on section3 */


/*css for menu card images in section 3*/
#menupage1{
  margin-left: 850px;
}
#menupage2{
  margin-left:1070px;
  margin-top:-215px;
}
.menu3{
  margin-left: 850px;
}
.menu4{
  margin-left: 1070px;
  margin-top: -215px;
}
.menu5{
  margin-left: 850px;
}
.menu6{
  margin-left: 1070px;
  margin-top: -215px;
}
#menupage1 img:hover{
  height:250px;
  width:250px;
  opacity: 0.3;
}
#menupage2 img:hover{
  height:250px;
  width:250px;
  opacity: 0.3;
}
.menu3 img:hover{
  height:250px;
  width:250px;
  opacity: 0.3;
}
.menu4 img:hover{
  height:250px;
  width:250px;
  opacity: 0.3;
}
.menu5 img:hover{
  height:250px;
  width:250px;
  opacity: 0.3;
}
.menu6 img:hover{
  height:250px;
  width:250px;
  opacity: 0.3;
}
/* end of css for menu card images on section 3*/


/* CSS for Popup*/
.login-trigger {
  font-weight: bold;
  color: #fff;
  background: linear-gradient(to bottom right, #B05574, #F87E7B);
  padding: 15px 30px;
  border-radius: 30px;
  position: relative; 
  top: 50%;
}

/*Pop-Up*/
a#login_pop:hover, a#join_pop:hover {
    border-color: orange;
}
 .overlay {
    background-color: rgba(0, 0, 0, 0.6);
    bottom: 0;
    cursor: default;
    left: 0;
    opacity: 0;
    position: fixed;
    right: 0;
    top: 0;
    visibility: hidden;
    z-index: 1;

    -webkit-transition: opacity .5s;
    -moz-transition: opacity .5s;
    -ms-transition: opacity .5s;
    -o-transition: opacity .5s;
    transition: opacity .5s;
} 
.overlay:target {
    visibility: visible;
    opacity: 1;
}
.popup {
    background-color: #ff9b08;
    border: 3px solid #fff;
    display: inline-block;
    left: 50%;
    opacity: 0;
    padding: 15px;
    position: fixed;
    text-align: justify;
    top: 40%;
    visibility: hidden;
    z-index: 10;

    -webkit-transform: translate(-50%, -50%);
    -moz-transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%);
    -o-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);

    -webkit-border-radius: 10px;
    -moz-border-radius: 10px;
    -ms-border-radius: 10px;
    -o-border-radius: 10px;
    border-radius: 10px;

    -webkit-box-shadow: 0 1px 1px 2px rgba(0, 0, 0, 0.4) inset;
    -moz-box-shadow: 0 1px 1px 2px rgba(0, 0, 0, 0.4) inset;
    -ms-box-shadow: 0 1px 1px 2px rgba(0, 0, 0, 0.4) inset;
    -o-box-shadow: 0 1px 1px 2px rgba(0, 0, 0, 0.4) inset;
    box-shadow: 0 1px 1px 2px rgba(0, 0, 0, 0.4) inset;

    -webkit-transition: opacity .5s, top .5s;
    -moz-transition: opacity .5s, top .5s;
    -ms-transition: opacity .5s, top .5s;
    -o-transition: opacity .5s, top .5s;
    transition: opacity .5s, top .5s;
}
.overlay:target+.popup {
    top: 50%;
    opacity: 1;
    visibility: visible;
}
.close {
    background-color: rgba(0, 0, 0, 0.8);
    height: 30px;
    line-height: 30px;
    position: absolute;
    right: 0;
    text-align: center;
    text-decoration: none;
    top: -15px;
    width: 40px;

    -webkit-border-radius: 15px;
    -moz-border-radius: 15px;
    -ms-border-radius: 15px;
    -o-border-radius: 15px;
    border-radius: 15px;
}
.close:before {
    color: rgba(255, 255, 255, 0.9);
    content: "X";
    font-size: 24px;
    text-shadow: 0 -1px rgba(0, 0, 0, 0.9);
}
.close:hover {
    background-color: rgba(64, 128, 128, 0.8);
}
.popup p, .popup div {
    margin-bottom: 10px;
}
.popup label {
    display: inline-block;
    text-align: left;
    width: 130px;
}
.popup input[type="text"], .popup input[type="password"] {
    border: 1px solid;
    border-color: #999 #ccc #ccc;
    margin: 0;
    padding: 2px;

    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    -ms-border-radius: 2px;
    -o-border-radius: 2px;
    border-radius: 2px;
}
.popup input[type="text"]:hover, .popup input[type="password"]:hover {
    border-color: #555 #888 #888;
}
/*end of input css*/

/*end of css section*/
  </style>
  
</head>
<body>
    <!--page1 home page-->
    <section id="page1">
      <!--navbar logo and menu code-->
      <div class="navbar">
        <a href="#page1" alt=""><img src="nav-logo.png" style="margin-top:-10px; height: 80px;width:90px; margin-left:6px;margin-top:-2px;border-radius:6em;"></a>
        <ul type="none">
              <li><a href="#page1">HOME</a></li>
          <li><a href="#page2">ABOUT US</a></li>
          <li><a href="#page3">MENU</a></li>
          <li><a href="BookTheTable.html">BOOK A TABLE</a></li>
          <li><a href="ContactSpiceUp.html">CONTACT US</a></li>
          <li><a href="#login_form" id="login_pop">ADMIN LOGIN</a></li>      
        </ul>
      </div>
      <!--end of navbar logo and menu code-->    
    </section>
    <!--end of page1 home page-->
  
  
    <!--image gallery using bootstrap-->
    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="image4.jpg" class="d-block w-100" alt="img1">
        </div>
        <div class="carousel-item">
          <img src="image2.jpg" class="d-block w-100" alt="img2">
        </div>
        <div class="carousel-item">
          <img src="image3.jpg" class="d-block w-100" alt="img3">
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
  
    <!--end of image gallery-->
  
  
    <!--about us page2 -->
    <section id="page2">
      <div class="abt">
        <h3 style="padding-top:10px;padding-left: 15px;font-weight: 800;">
          <font color="sky blue">About</font> <span id="colour">Spice Up</span>
        </h3>
        <p style="color: #ff9b08;display:block; margin-top: 0px;margin-left: 30px;">
          <b>Welcome to our Multi-Cuisine Restaurant.<br>
            It is one of the best restaurants in the city<br> which provides a luxurious ambience!<br>The royal attire
            of the Seating area matches<br> the Aesthetics of the restaurant ambience with<br> a Breath Taking view on
            all sides.
            You Will surely<br> enjoy the good food with your good friends by having <br>a overall good time.</b>
        </p>
       <!--logo for cuisines we offer include-->
        <img
          src="https://thumbs.dreamstime.com/b/cooking-cuisine-logo-cute-girl-chef-hat-cartoon-vector-illustration-cooking-cuisine-logo-cute-girl-chef-hat-cartoon-vector-144985328.jpg"
          style="border-radius:5em; height:50px; width:50px;">
        <p style="color: #848484; font-style: italic!important; font-size: 15px;margin-left: 2px; display: inline;">
          <b>
            <font face="PERPETUA TITLING MT">Cuisines We Offer Include.
          </b>
        </p>
  
        <ul>
          <font face="ariel">
            <li><span style="color: #444444;">
                North Indian.</span></li>
            <li><span style="color: #444444;"> Chinese.</span></li>
            <li><span style="color: #444444;"> Italian.</span></li>
          </font>
        </ul>
        <!--end of cuisines section-->
  
        <!--logo for type of restaurant-->
        <img
          src="https://thumbs.dreamstime.com/b/cook-chef-logo-label-restaurant-concept-cartoon-vector-cook-chef-logo-label-restaurant-concept-cartoon-vector-illustration-114015793.jpg"
          style="border-radius: 5em; height:50px; width:50px; margin-top:-10px;">
        <p style="color: #848484;font-style: italic!important; font-size: 15px;margin-left: 2px;display: inline;">
          <b>
            <font face="PERPETUA TITLING MT">Type
          </b>
        </p>
        <ul>
          <font face="ariel">
            <li><span style="color: #444444;">Happy Hours</span></li>
            <li><span style="color: #444444;">Casual Dining</span></li>
            <li><span style="color: #444444;">Safe To Eat Out</span></li>
            <li><span style="color: #444444;">Contactless Dining</span></li>
          </font>
        </ul>
  <!--end of type of restaurant section-->
  
  <!--logo for cost-->
        <img
          src=" https://thumbs.dreamstime.com/b/indian-rupees-currency-symbol-gold-coin-money-sign-flat-style-vector-illustration-isolated-white-background-indian-rupees-109136122.jpg"
          style="border-radius:50em; height:50px; width:50px; margin-top:-10px;">
        <p style="color: #848484;font-style: italic!important; font-size: 15px;margin-left:2px;display: inline;">
          <font face="PERPETUA TITLING MT"><b>Average Cost</b></font>
        </p>
  
        <ul>
          <font color="black" face="ariel">
            <li><span style="color: #444444;">1000 Rs for Two</span></li>
          </font>
        </ul>
  <!--end of cost section-->
  
  <!--video link-->
        <iframe width="450" height="280" src=" https://www.youtube.com/embed/7B1uUsLFY1w" 
        frameborder="20" allow="autoplay; clipboard-write; encrypted-media; 
        gyroscope; picture-in-picture" 
        allowfullscreen style="margin-top:-600px; margin-left:530px;">
              </iframe>
      
      </div>
    </section>
  
    <!--end of about us page 2-->
  
  
  
  
    <!--menu page 3-->
    <section id="page3">
      <b><u style="text-decoration-color:darkgray;">
          <h2 style="color:black; font-family:Viner Hand ITC;
           margin-left:600px; margin-top: 0px; font-weight: 800;">
           <div class="col-12 col-sm-6">

            <font color="sky blue">Check Our Tasty</font> <span id="s1"> Menu
            </div>
            </h2>
        </u></b>
        

        <font face="new baskerville" style="color: #ffb03b; 
        font-size: 22.7676px;margin-left:550px;">
          There Is No Sincere Love Than That Of Food!</font>
        <br>
        <br>
        
         <!--our speciality and our menu button-->
            <button class="ourspeciality">Our Speciality</button>
     
              <button class="ourmenu">Our Menu</button>
              <br>
              <br>
  
              <!--images of menu card-->
              <p id="menupage1">
                <a href="menupage1.jpg" target="_blank">
              <img src="menupage1.jpg" height="200px" width="200px"></a>
                </p>
              <p id="menupage2">
                <a href="menupage2.jpg" target="_blank">
                <img src="menupage2.jpg" height="200px" width="200px"></a>
                </p>
                <p class="menu3">
                  <a href="menupage3.jpg" target="_blank">
                  <img src="menupage3.jpg" height="200px" width="200px">
                  </a>
                  </p>
                  <p class="menu4">
                    <a href="menupage4.jpg" target="_blank">
                    <img src="menupage4.jpg" height="200px" width="200px"></a>
                    </p>
                    <p class="menu5">
                      <a href="menupage5.jpg" target="_blank">
                      <img src="menupage5.jpg" height="200px" width="200px"></a>
                      </p>
                      <p class="menu6">
                        <a href="menupage6.jpg" target="_blank">
                        <img src="menupage6.jpg" height="200px" width="200px">
                        </a>
                        </p>
                        <!--end of images section of menu card-->
  
                        <!--black background image for our speciality-->
              <img src="https://wallpaperaccess.com/full/2413558.jpg"
               height="250px" width="450px" 
               style="margin-left: 300px; margin-top: -650px;opacity:0.3 ;"> 
              <h5><ul style="list-style-image:url(listlogo1.jpg);
              margin-top:-630px;margin-left: 350px;">
                <li>Paneer Tikka Masala</li>
                <li type="none">Paneer Tikka Masala</li>
                <li type="none">Cheese Grilled Sandwich</li>
                <li type="none">Cold Coffee</li>
                <li type="none">Veg Cheese Pizza</li>
                <li type="none">Tacos</li>
              </h5>
  
              <!--qr code image-->
              <img src="SpiceUp Restaurant Menu Card.png" style="margin-left:430px;margin-top:60px">
              <h3 style="font-size: x-large;font-family: fantasy;margin-left: 290px;" >
                Scan The QR Code to Download the Menu Card!</h3>
                <font face="new baskerville" style="color: #5f5950; font-size: 22px; margin-left: 10px;">
                    Or Send Us An E-Mail For Any Further Help Or Any Other Queries!</font>
                      <p id="blink11"><a href="
                        https://mail.google.com/mail/u/0/?view=cm&fs=1&tf=1&to=mailto:spiceup@gmail.com" 
                        style="color:#ffb03b;margin-left: 10px;">
                        <b>Send Email</b></a></p>
                  
         </section>
    <!-- end of menu page 3-->

    <!-- PopUp Login/Register-->

<!-- <div class="main">
    <div class="panel">
        <a href="#login_form" id="login_pop">Log In</a>
    </div>
</div> -->

<script>
  	/* function login()
  	{
  	  ch=0;
  	  username=document.getElementById('login').value;
  	  password=document.getElementById('password').value;
  	  if(username=="" && password=="")
  	  {
  		  alert("Plzzzzzz enter username and password");
  	  }
  	  else
  	  {
  		  str=null
  		  ob=new XMLHttpRequest();

		  if(window.XMLHttpRequest)
		  {  
			  ob=new XMLHttpRequest();  
		  }  
		  else if(window.ActiveXObject)
		  {  
			  ob=new ActiveXObject("Microsoft.XMLHTTP");   
		  } 
		  ob.onreadystatechange=function()
		  {
		              if(ob.readyState==4 && ob.status==200)
		              {
		                         // document.getElementById('output').innerHTML=ob.responseText;
		                         str=ob.responseText;
		                         if(str==="Login Successful")
		                   			window.location.href = "Dashboard.html";
		                         else
		                         	alert(str);	 
		                         
		              }
		  }
		  ob.open("POST","HomePageBack.jsp?username="+username+"&password="+password+"&choice="+ch);
		  ob.send();
  	  }
  	} */
  	
/*   	function validate()
  	{
  		if(str=="Login Successful")
  		{
  			window.location.href = "Dashboard.html";
  	 	}
  	} */
  	/* function register()
  	{
  		ch=1;
  		name=document.getElementById('rname').value;
  		email=document.getElementById('remail').value;
  		pass=document.getElementById('rpassword').value;
  		if(name=="" && email=="" && pass=="")
  		{
  			alert("Plzzz Enter All Details");	
  		}
  		else
  		{
  			ob=new XMLHttpRequest();

  		 	 if(window.XMLHttpRequest)
  		 	 {  
  				  ob=new XMLHttpRequest();  
  		  	}  
  		 	 else if(window.ActiveXObject)
  		 	 {  
  				  ob=new ActiveXObject("Microsoft.XMLHTTP");   
  		 	 } 
  		 	 ob.onreadystatechange=function()
  		  	{
  		              if(ob.readyState==4 && ob.status==200)
  		              {
  		            			// document.getElementById('output').innerHTML=ob.responseText;
	                       		  alert(ob.responseText);
  		              }
  		  	}
  		 	 ob.open("GET","HomePageBack.jsp?user="+name+"&email="+email+"&pass="+pass+"&choice="+ch);
  		 	 ob.send();
  		} 
  	} */
  </script>
<!-- popup form #1 -->
<form action="" method="POST">
<a href="#x" class="overlay" id="login_form"></a>
<div class="popup">
  <h2>Login</h2>

<div>
   <label for="login">Email/Username</label>
   <input type="text" name="t1" id="login" value="" />
</div>
<div>
 <label for="password">Password</label>
 <input type="password" name="t2" id="password" value="" />
 <br>
 <a href="ChangePassword.html" style="margin-left: 210px; color:black"><b>Forgot Password?</b></a>
</div>
<!-- <a href="Dashboard.html"> -->
<button type="submit" value="Login">Login</button>
<a href="#login_form1" id="login_pop">Register</a>
<a class="close" href="#close"></a>

</div>
</form>
<a href="#x" class="overlay" id="login_form1"></a>
<div class="popup">
  <h2>Register</h2>
  <div>
   <label for="register">Name:</label>
   <input type="text" id="rname" value="" />
   </div>
<div>
<label for="login">Email/Username</label>
<input type="text" id="remail" value="" />
</div>
<div>
<label for="password">Password</label>
<input type="password" id="rpassword" value="" />
</div>
<button type="button" onclick="register()">Register</button>
<a class="register" href="#login_form">Login</a>
<a class="close" href="#close"></a>
</div>
<!--end of popup forms-->

<!--footer-->

<section id="page6">
    <footer>
      <b>
      </b>
      <font color="gray"> &copy; Copyright <strong>
        <span style="color:#ff9b08;">Spice Up</span></strong> All Rights Reserved</font>
</footer>
  </section>
  <!--end of footer-->
</body>

<!--javascript library for bootstrap-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

</html>


  