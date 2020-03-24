<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="La_Post.Login" %>

<!DOCTYPE html>
  <html>
  <head runat="server">
    <title></title>
    <meta lang="fr" charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <link rel="Stylesheet" href="StyleSheet.css" />
    <link rel="Stylesheet" href="font/font-awesome-4.6.1/css/font-awesome.min.css" />
    <link rel="Stylesheet" href="font/material-design/material.min.css" />
<script src="font/material-design/material.js"></script>
      
</head>
<body>
    <form id="login" runat="server">
     <center> 
     <div class="login_form">
       <div class="left_form">
           <div class="logo">
             <img src="font/logo-poste.png" />
           </div>
           <h4>POST MAROC</h4>
           <p>Le Contact qui vous facilité la vie </p>
           <span class="copyright"><i class="fa fa-copyright" aria-hidden="true"></i> COPYRIGHT 2016 </span>
       </div>
       <div class="right_form">
       <div class="title"> 
         <b> LOGIN </b></div>
    <div class="group_input">

            <div class="input_form">
            <i class="fa user_name fa-user"></i> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <input class="mdl-textfield__input" type="text" id="user_name" runat="server" autocomplete="off">
            <label class="mdl-textfield__label" for="user_name">Entrer Your Name...</label>
            </div>
            </div>

            <div class="input_form">
            <i class="fa password fa-unlock-alt" aria-hidden="true"></i> 
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <input class="mdl-textfield__input" type="password" id="password" runat="server" autocomplete="off" >
            <label class="mdl-textfield__label" for="password">Entrer Password...</label>
            </div>
            </div>

            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="check_password">
            <input type="checkbox" id="check_password" class="mdl-checkbox__input">
            <span class="mdl-checkbox__label" style="padding-right:25px">Remember Me</span>
            </label>

        <asp:Button runat="server" ID="enter_btn" CssClass="btn_primary" Text="CONECTE" 
               onclick="enter_btn_Click" />

       <label id="msg_error" runat="server" visible="false"><i class="fa fa-exclamation-circle" aria-hidden="true"></i>&nbsp&nbsp error information votre nom ou password incorrect !</label>
     </div>
       </div>
       </div>
    </center>
    </form>
</body>
</html>
