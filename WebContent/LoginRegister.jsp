<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
    <head>

        <style>
            *{
                font-family: sans-serif;
                margin: 0;
                padding: 0;
            }
            .hero{
                height: 100%;
                width: 100%;
                background-image: linear-gradient(rgba(0,0,0,0.2),rgba(0,0,0,0.2)),url(image3.jpg);
            background-position: center;
            background-size: cover;
            position: absolute;
            }
            .form-box{
                width: 380px;
                height: 480px;
                position: relative;
                margin: 6% auto;
                background:lavenderblush;
                padding: 5px;
                overflow:hidden;
            }
            .button-box{
                width: 220px;
                margin: 35px auto;
                position: relative;
                box-shadow: 0 0 20px 9px #ff61241f;
            border-radius: 30px;
            }
            .toggle-btn{
                padding:10px 30px;
                cursor:pointer;
                background:transparent;
                border:0;
                outline: none;
                position:relative;
            }
            #btn{
                top: 0;
                left: 0;
                position: absolute;
                width: 110px;
                height: 100%;
                background: linear-gradient(to right,#F26FC9, #8772EF);
                border-radius: 30px;
                transition: 0.5s;
                
            }
            .input-group{
                top:180px;
                position: absolute;
                width: 280px;
                transition: .5s;
            }
            .input-field{
                width: 100%;
                padding:10px 0;
                margin:5px 0;
                border-left:0;
                border-top:0;
                border-bottom: 1px solid #999;
                border-right:0;
                outline: none;
                background: transparent;
            }
            .submit-btn{
                width:85%;
                padding:10px 30px;
                cursor: pointer;
                display: block;
                margin-top: 30px;
                margin-left: 24px;
                background: linear-gradient(to right,#F26FC9, #8772EF);
                border: 0;
                outline: none;
                border-radius: 30px;
            }
            .check-box{
                margin: 30px 10px 30px 0px;
        
            }
            span{
                color: #777;
                font-size: 12px;
                bottom:149px;
                position: absolute;
                font-size: 16px;
            }
            #log-in{
                left: 50px;
            }
            #register{
                left: 450px;
            }
            .back-btn{
                width:85%;
                padding:10px 30px;
                cursor: pointer;
                display: block;
                
                background: linear-gradient(to right,#F26FC9, #8772EF);
                border: 0;
                outline: none;
                border-radius: 30px;
                margin-top: 25px;
                margin-left: 24px;
               
            }
            #no
            {
            	text-decoration:none;
            }
        </style>
    </head>
    <body>
        <div class="hero">
            <div class="form-box">
       <div class="button-box">
           <div id="btn"></div>
<button type="button" class="toggle-btn" onclick="LogIn()">Log In</button>
<button type="button" class="toggle-btn" onclick="Register()">Register</button>
       </div>
      <div class="input-group" id="log-in"> 
           <input type="text" name="username" id="user" class="input-field" placeholder="Email-id" required>
           <input type="password" name="password" id="pass" class="input-field" placeholder="Password" required>
           <!-- <input type="checkbox" class="check-box"><span>Remember Me</span> -->
      <button type="button" class="submit-btn" onclick="login()">Login</button>
      <a href="modifiedhomepagespiceup.html" id="no"><button type="button" class="back-btn">Back</button></a>
     
       </div> 
        <div class="input-group" id="register">
            <input type="text" class="input-field" id="rname" placeholder="Name" required>
            <input type="text" class="input-field" id="remail" placeholder="Email-id" required>
            <input type="password" class="input-field" id="rpassword" placeholder="Password" required>
      
        
            <!-- <input type="checkbox" class="check-box"><span>i</span> -->
       <button type="button" class="submit-btn" onclick="register()">Register</button>
       <a href="modifiedhomepagespiceup.html" id="no"><button type="button" class="back-btn">Back</button></a>
         </div>
        </div>
        
    </div>
    	
    <script>
        
        var x=document.getElementById("log-in");
        var y=document.getElementById("register");    
  	    var z=document.getElementById("btn");
   		function Register()
   		{
  	    x.style.left="-400px";
   		y.style.left="50px";
   		z.style.left="110px";
   		}
   		function LogIn()
   		{
   		x.style.left="50px";
   		y.style.left="450px";
   		z.style.left="0px";
   		}
		function login()
		{
			  username=document.getElementById('user').value;
			  password=document.getElementById('pass').value;
			  choice=1;
			  if(username=="" && password=="")
			  {
				  alert("Please enter username and password");
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
			                        /* document.getElementById('o').innerHTML=ob.responseText; */ 
			                        str=ob.responseText;
			                        str1="Login Successful";
			                        str=str.trim();
			                        
			                        if(str==str1)
			                        	window.location.href = "Dashboard.html";
			                        else
			                        	alert(ob.responseText);
			   			 }
			  }
			  ob.open("GET","LoginRegisterBack.jsp?user="+username+"&pass="+password+"&choice="+choice);
			  ob.send();
			  } 
			
		}
		function register()
		{
		  		ch=2;
		  		name=document.getElementById('rname').value;
		  		email=document.getElementById('remail').value;
		  		pass=document.getElementById('rpassword').value;
		  		if(name=="" && email=="" && pass=="" || name=="" || pass=="")
		  		{
		  			alert("Please Enter All Details");	
		  		}
		  		
		  		else	if (email == "") {
							alert("Please fill Email ID");
							return false;
						}
		  		else	if (email.indexOf('@') <= 0) {
							alert("@ is at invalid Position");
							return false;
						}
		  		else	if ((email.charAt(email.length - 4) != '.')
								&& (email.charAt(email.length - 3) != '.')) {
							alert("(.) is at invalid position");
							return false;
						} 
		  		else {
							ob = new XMLHttpRequest();

							if (window.XMLHttpRequest) {
								ob = new XMLHttpRequest();
							} else if (window.ActiveXObject) {
								ob = new ActiveXObject("Microsoft.XMLHTTP");
							}
							ob.onreadystatechange = function() {
								if (ob.readyState == 4 && ob.status == 200) {
									// document.getElementById('output').innerHTML=ob.responseText;
									alert(ob.responseText);
									
								}
							}
							ob.open("GET", "LoginRegisterBack.jsp?user=" + name
									+ "&email=" + email + "&pass=" + pass
									+ "&choice=" + ch);
							ob.send();
						}
					}
				</script>
    </body>
</html>