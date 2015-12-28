var onlyOnImages = false;
var isIE5 = document.all && document.getElementById;  // IE 5 or higher
var isMoz = !isIE5 && document.getElementById;  // Mozilla/Firefox
function cancelContextMenu(e) {
    return false;
}
function onContextMenu(e) {
    if (onlyOnImages = false
     || (isIE5 && event.srcElement.tagName == "IMG")
     || (isMoz && e.target.tagName == "IMG")) {
        return cancelContextMenu(e);
    }
}
if (document.getElementById) {
    // Register event handler
    document.oncontextmenu = onContextMenu;
    document.onkeyup = DisAllowSplCharacters;
}
function DisAllowSplCharacters(a){if(!a)a=window.event;if(a.target)el=a.target;else if(a.srcElement)el=a.srcElement;if(isIE5&&el.tagName=="INPUT"&&el.type=="text"||el.tagName=="TEXTAREA"||isMoz&&el.tagName=="INPUT"&&el.type=="text"||el.tagName=="TEXTAREA"){if(el.readOnly==false){if(isSplCharcheck(el.value)==false){var b=el.value;var c="!#`~$%^&*+=[]';{}|\":<>";for(var d=0;d<b.length;d++){if(c.indexOf(b.charAt(d))!=-1){var e=c.indexOf(b.charAt(d));var f=c.charAt(e);el.value=el.value.replace(f,"")}}}}}}function isSplCharcheck(a){var b="!#`~$%^&*+=[]';{}|\":<>";for(var c=0;c<a.length;c++){if(b.indexOf(a.charAt(c))!=-1){alert("Please avoid using special characters (!#`~$%^&*+=[]';{}|\":<>)");return false}}}////////////////////////////////////////////
var chk_keycode="";

function checkmail(a){var b="@";var c=".";var d;var e=a.indexOf(b);var f=a.length;var g=a.indexOf(c);var h=" \"([{}])!#$%^&*';:,/\\?|+`~<>=~";if(a.indexOf(b)==-1){alert("Please Enter a valid Email ID.");return false}if(a.indexOf(b)==-1||a.indexOf(b)==0||a.indexOf(b)==f-1){alert("Please Enter a valid Email ID.");return false}if(a.indexOf(c)==-1||a.indexOf(c)==0||a.indexOf(c)==f-1){alert("Please Enter a valid Email ID.");return false}if(a.indexOf(b,e+1)!=-1){alert("Please Enter a valid Email ID.");return false}if(a.substring(e-1,e)==c||a.substring(e+1,e+2)==c){alert("Please Enter a valid Email ID.");return false}if(a.indexOf(c,e+2)==-1){alert("Please Enter a valid Email ID.");return false}for(i=0;i<h.length-1;i++){d=h.substring(i,i+1);if(a.indexOf(d)!=-1){alert("Please Enter a valid Email ID.");return false}}return true}

function checkjunkchar(str,fieldname){var invalidchar=" \"([{}])!#$%^&*';:,/\\?|+-`~<>=~@.0123456789"
for(i=0;i<(invalidchar.length-1);i++){temp=invalidchar.substring(i,i+1);if(str.indexOf(temp)!=-1)
{alert("Special characters/spaces are not allowed in "+fieldname+".");return false}}
return true;}
function validateform(strValidateStr,command,fieldname)
{var strError="";var epos=command.search("=");var newcommand="";var cmdvalue="";if(epos>=0){newcommand=command.substring(0,epos);cmdvalue=command.substr(epos+1);}
else{newcommand=command;}
switch(newcommand){case"req":case"required":{if((strValidateStr.length)==0){strError=fieldname+" is a  Required Field";alert(strError);strError="";return false;}
break;}
case"maxlength":case"max":{if(strValidateStr.length>cmdvalue){strError=fieldname+" has more than allowed ";strError=strError+"["+cmdvalue+"]";strError=strError+" characters ";strError=strError+"\n[Current length = "+strValidateStr.length+" ]"
alert(strError);strError="";return false;}
break;}
case"minlength":case"min":{if(strValidateStr.length<cmdvalue){strError=fieldname+" : has less than allowed minimum characters  ";alert(strError+"\n[Current length = "+strValidateStr.length+" ]");return false;}
break;}
case"alnum":case"alphanumeric":{var charpos=strValidateStr.search("[^A-Za-z0-9-/,.  ]");if(strValidateStr.length>0&&charpos>=0){strError=fieldname+" : allows Only alpha-numeric characters  ";alert(strError+"\n [Error character position "+eval(charpos+1)+"]");strError="";return false;}
break;}
case"num":case"numeric":{var charpos=strValidateStr.search("[^0-9]");if(strValidateStr.length>0&&charpos>=0){strError=fieldname+" : allows Only numbers ";alert(strError+"\n [Error character position "+eval(charpos+1)+"]");strError="";return false;}
break;}
case"alphabetic":case"alpha":{var charpos=strValidateStr.search("[^A-Za-z ]");if(strValidateStr.length>0&&charpos>=0){strError=fieldname+" : allows Only alphabetic characters  ";alert(strError+"\n [Error character position "+eval(charpos+1)+"]");strError="";return false;}
break;}
case"email":{if(!checkmail(strValidateStr)){return false;}
break;}
case"lt":case"lessthan":{if(isNaN(strValidateStr)){alert(fieldname+" : Should be a number ");return false;}
if((strValidateStr)>=eval(cmdvalue)){strError=fieldname+" : value should be less than "+cmdvalue;alert(strError);strError="";return false;}
break;}
case"gt":case"greaterthan":{if(isNaN(strValidateStr)){alert(objValue.name+" : Should be a number ");return false;}
if(strValidateStr<=eval(cmdvalue)){strError=fieldname+" : value should be greater than "+cmdvalue;alert(strError);strError="";return false;}
break;}
case"regexp":{if(!strValidateStr.match(cmdvalue)){strError=fieldname+" : Invalid characters found ";alert(strError);return false;}
break;}
case"UT":{if(strValidateStr.search("UT")<0&&strValidateStr.search("ut")<0&&strValidateStr.search("uT")<0&&strValidateStr.search("Ut")<0){strError=fieldname+" : must start with UT";alert(strError);return false;}
break;}}
return true;}
function validateData(strValidateStr,command,fieldname)
{var newcommand=command.split(",");for(var i=0;i<newcommand.length;i++){var val=validateform(strValidateStr,newcommand[i],fieldname)
if(val==false){return val;}}
return val;}
function validatemsg(str)
{var comm
comm=str
if(comm!="")
{return true;}
else
{alert("Message is a  Required Field");return false;}}
function submitMessage()
{var val="false";var str
str=document.getElementById('nametxt').value;val=validateData(str,'required,max=30,alpha','Name')
if(val==true)
{str=document.getElementById('emailtxt').value;val=validateData(str,'required,max=50,email','Email ID')
if(val==true)
{str=document.getElementById('msg').value;val=validatemsg(str);if(val==true)
{centerWindowX('../../store/submit.aspx?custemail='+document.getElementById('emailtxt').value+'&custname='+document.getElementById('nametxt').value+'&mode=queryhtml'+'&comments='+document.getElementById('msg').value);document.getElementById('msg').value="";document.getElementById('emailtxt').value="";document.getElementById('nametxt').value="";}
else
{document.getElementById('msg').focus();}}
else
{document.getElementById('emailtxt').focus();}}
else
{document.getElementById('nametxt').focus();}}
function changebuttoncolor(e,mouse)
{var color="";if(mouse=="OVER")
{color="#C13100";}
else
{color="#CC6600";}
var el=window.event?event.srcElement:e.target
if(el.tagName=="INPUT"&&el.type=="submit"||el.tagName=="INPUT"&&el.type=="button")
el.style.backgroundColor=color}
function changebuttoncolor(e,mouse)
{var color="";if(mouse=="OVER")
{color="#C13100";}
else
{color="#CC6600";}
var el=window.event?event.srcElement:e.target
if(el.tagName=="INPUT"&&el.type=="submit"||el.tagName=="INPUT"&&el.type=="button")
el.style.backgroundColor=color}
function verifysearchkeyword() {
    var keyword = ""; keyword = document.getElementById("q").value;
    String.prototype.replaceAll = function(s1, s2) { return this.split(s1).join(s2) }
    keyword = keyword.replaceAll('.', ' ').replaceAll(',', ' ').replaceAll('/', ' ').replaceAll('?', ' ').replaceAll('-', ' ').replaceAll('_', ' ').replace(/(^[\s]+|[\s]+$)/g, '');
    document.getElementById('q').focus();
    if (keyword == "" || keyword == "Search keyword or item code")
    { document.getElementById('q').value = ''; alert("Please enter keyword for search!"); return false; }
    else {
        var c = keyword.replace(/\s\s+/g, ' ');
        c = c.replaceAll(' ', '-').toLowerCase();
        document.getElementById('q').value = c;
        document.search.submit();
    }
}
function verifysearchkeywords(pageloc)
{ 
var keyword="";keyword=document.search.q.value;
String.prototype.replaceAll=function(s1, s2) {return this.split(s1).join(s2)}
keyword = keyword.replaceAll('.', ' ').replaceAll(',',' ').replaceAll('/',' ').replaceAll('?',' ').replaceAll('-',' ').replaceAll('_',' ').replace(/(^[\s]+|[\s]+$)/g, '');
document.getElementById('q').focus();
document.getElementById('q').value='';
var c=keyword.replace(/\s\s+/g,' ');
 c= c.replaceAll(' ','-').toLowerCase();
 if(keyword=="" ||keyword=="Search keyword or item code")
{alert("Please enter keyword for search!");return false;}
else
{if(pageloc=='search'){window.location.href='../store/search.aspx?q='+c;return false;}
else if(pageloc=='adsearch'){window.location.href='../store/textsearch.aspx?cx=002358820920287544434:u8s_gv1wjbk&cof=FORID:11&q='+c;}
else if(pageloc=='tag'){window.location.href='../tags/'+c;}
return true;}
}
function make_blanknmail(dis,q)
{if(dis=="hide")
{if(document.getElementById(q).value=="Enter email address")
{document.getElementById(q).value="";}}
else if(dis=="show")
{if(document.getElementById(q).value=="")
{document.getElementById(q).value="Enter email address";}}}
function make_blank(dis,q)
{if(dis=="hide")
{if(document.getElementById(q).value=="Search")
{document.getElementById(q).value="";}}
else if(dis=="show")
{if(document.getElementById(q).value=="")
{document.getElementById(q).value="Search";}}}
function MM_openBrWindow(theURL,winName,features){window.open(theURL,winName,features);}
function centerWindowX(fname){if(document.all)
var xMax=screen.width,yMax=screen.height;else
if(document.layers)
var xMax=window.outerWidth,yMax=window.outerHeight;else
var xMax=640,yMax=480;var xOffset=(xMax-490)/2,yOffset=(yMax-190)/2;MM_openBrWindow(fname,'info','width=400,height=150,screenX='+xOffset+',screenY='+yOffset+',top='+yOffset+',left='+xOffset+'');}
function MM_openBrWindow(theURL,winName,features){window.open(theURL,winName,features);}
function centerWindowX(fname){if(document.all)
var xMax=screen.width,yMax=screen.height;else
if(document.layers)
var xMax=window.outerWidth,yMax=window.outerHeight;else
var xMax=640,yMax=480;var xOffset=(xMax-490)/2,yOffset=(yMax-190)/2;MM_openBrWindow(fname,'info','width=400,height=150,screenX='+xOffset+',screenY='+yOffset+',top='+yOffset+',left='+xOffset+'');}
function submitLetterindexaspx_n(opt){if(opt=='F'){var giftcode="";giftcode=document.surveyfeedback.surveycode.value;if(document.surveyfeedback.Email.value=="")
{alert("Please Enter Email ID");document.surveyfeedback.Email.focus();}
else if(validate_new(document.surveyfeedback.Email.value)){val=document.surveyfeedback.Email.value
if(opt=='F')
{centerWindowX('../store/submit.aspx?Email='+val+'&mode=surveyfeedback&giftcode='+giftcode);}
document.surveyfeedback.Email.value=''}}
else
{if(document.newsletter.Email.value=="")
{alert("Please Enter Email ID");document.newsletter.Email.focus();}
else if(validate_new(document.newsletter.Email.value)){val=document.newsletter.Email.value
if(opt=='Y')
{centerWindowX('../store/submit.aspx?Email='+val+'&mode=letter');}
else if(opt=='N')
{centerWindowX('../store/submit.aspx?Email='+val+'&mode=letter');}
document.newsletter.Email.value=''}}}
var giftaddsban;function loadadgiftadd(pagepart){if(window.XMLHttpRequest){giftaddsban=new XMLHttpRequest();}
else{giftaddsban=new ActiveXObject("Microsoft.XMLHTTP");}
giftaddsban.onreadystatechange=function(){if(giftaddsban.readyState==4&&giftaddsban.status==200){document.getElementById("giftbannerhead").innerHTML=giftaddsban.responseText;}}
var datime;datime=new Date().getSeconds();giftaddsban.open("GET","../../include/addrotater2.aspx?p="+pagepart+"&d="+datime,true);giftaddsban.send();}
function DisAllowApostrophe(e,id)
{var val1=DisAllowSpaceAsFirstChar(e,id);if(val1==false)return false;var browserchk=window.event?e.keyCode:e.which;if(browserchk==39)return false;}
function DisAllowSpaceAsFirstChar(e,id)
{var browserchk=window.event?e.keyCode:e.which;var chkfirstchar=document.getElementById(id).value;if(chkfirstchar.length<1)
{if(browserchk==32)
return false;}}
function PostalCodeFormat(e,id)
{var val1=DisAllowApostrophe(e,id);var val2=DisAllowSpaceAsFirstChar(e,id);if(val1==false)return false;if(val2==false)return false;var browserchk=window.event?e.keyCode:e.which;if((browserchk>=48&&browserchk<=57)||(browserchk>=65&&browserchk<=90)||(browserchk>=97&&browserchk<=122)||browserchk==32)
{return true;}
if(browserchk>=33&&browserchk<=255)
{return false;}}
function showhead()
{var cname;cname=get_cookie('custname');if(cname!=null)
{ document.getElementById("signcust").innerHTML = "Hi. <span class='redprice' style='padding:0px;' >"+cname+"</span>";
  	 	    document.getElementById("sign").innerHTML=",&nbsp;&nbsp;<a href='../../account/loginform.aspx' title='My Account'>My Account<\/a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='../../account/logout.aspx' title='Sign Out'>Sign Out<\/a>" ;}
else
{document.getElementById("sign").innerHTML="<a href='../../account/loginform.aspx' title='My Account'>My Account<\/a>";}}
function get_cookie(cookie_name)
{var results=document.cookie.match(cookie_name+'=(.*?)(;|$)');if(results)
return(unescape(results[1]));else
return null;}
function messageval(str)
{if(str!="")
{return true;}}
function contactquery()
{var val=false;var str;var custname;var fmail;var oid;var message;var querysub;var ccmail;if(document.form1.con_sub.value==0)
{alert("select the Subject")
val=false}
else
{val=true;if(val==true)
str=document.form1.qemail.value;val=validateData(str,'max=50,email','Email Address');if(val==true)
{str=document.form1.fullname.value;val=validateData(str,'required,alpha','Full Name')
if(val==true)
{str=document.form1.message.value;val=messageval(str)
if(val==true)
{custname=document.form1.fullname.value;fmail=document.form1.qemail.value;oid=document.form1.ordernumber.value;message=document.form1.message.value;querysub=document.form1.con_sub.value;if(document.form1.concheck.checked==true)
{ccmail="Yes";}
else
{ccmail="No";}
centerWindowX('../store/submit.aspx?custname='+custname+'&fmail='+fmail+'&oid='+oid+'&message='+message+'&querysub='+querysub+'&ccmail='+ccmail+'&mode=contactquery');document.form1.reset();}
else
{document.form1.message.focus();alert("Message Can Not Be Blank!")
return false}}
else
{document.form1.fullname.focus();}}
else
{document.form1.qemail.focus();}}
return false;}
var feedbackshow;var pageview;var classid;function showtestimonailindex(page,classifyid)
{var chk;classid=classifyid;chk=new Date().getDay();pageview=page;feedbackshow=feedbackshowpop();if(feedbackshow==null){alert("Your browser does not support AJAX!");return;}
var url;if(pageview=="mainpage"){url="../store/testimonialindexshowaspx.aspx?classfyid="+classid+"&chk="+chk;}
else if(pageview=="ajaxpage"){url="../store/customerfeedback.aspx?classfyid="+classid+"&chk="+chk;}
feedbackshow.onreadystatechange=feedbackshowstatus;feedbackshow.open("GET",url,true);feedbackshow.send(null);}
function feedbackshowstatus(){if(feedbackshow.readyState==4){if(pageview=="mainpage"){document.getElementById('feedbackshowdiv_'+classid).innerHTML=feedbackshow.responseText;}
else if(pageview=="ajaxpage"){document.getElementById('customerfeedbackshowdiv_'+classid).style.display="";document.getElementById('customerfeedbackshowdiv_'+classid).innerHTML=feedbackshow.responseText;}}
else{if(pageview=="mainpage"){document.getElementById('feedbackshowdiv_'+classid).innerHTML="<table cellpadding='0' cellspacing='0' width='200' border='0' style='background:#ffffff;padding-left:5px'><tr><td width='200' class='carttext'><img src='../images/loadingstatus.gif' alt='' /> Loading, Please wait.....</td></tr></table>"}
else if(pageview=="ajaxpage")
{document.getElementById('customerfeedbackshowdiv_'+classid).innerHTML="<table cellpadding='0' cellspacing='0' width='200' border='0' style='background:#ffffff;padding-left:5px'><tr><td width='200' class='carttext'><img src='../images/loadingstatus.gif' alt='' /> Loading, Please wait.....</td></tr></table>"}}}
function feedbackshowpop(){var feedbackshow=null;try{feedbackshow=new XMLHttpRequest();}
catch(e){try{feedbackshow=new ActiveXObject("Msxml2.XMLHTTP");}
catch(e){feedbackshow=new ActiveXObject("Microsoft.XMLHTTP");}}
return feedbackshow;}
function show(id)
{
document.getElementById(id).style.display="";
}
function hide(id)
{
document.getElementById(id).style.display="none";
}
function showmain_menu(id)
{ 
document.getElementById('More').style.display=""; 
document.getElementById('More')
}

function hidemain_menu(id)
{ 
document.getElementById('More').style.display="none";
document.getElementById('More')
}
function cstimedivshow()
{
document.getElementById('cstimediv').style.display=""; 
}

function cstimedivhide()
{
document.getElementById('cstimediv').style.display='none'; 
}
var cstime;

function showcstimediv() {

	cstime = checkajax();
	
	if (cstime == null) {
		alert("Your browser does not support AJAX!");
		return;
	}
	var url;

	url = "../store/cstime.aspx" ;

	cstime.onreadystatechange = fetchCStimediv;
	cstime.open("GET", url, true);
	cstime.send(null);
}
function fetchCStimediv() {
	if (cstime.readyState == 4) {
	    document.getElementById('cstimediv').style.display=""; 
		document.getElementById("cstimediv").innerHTML = cstime.responseText;
	}

	}
function checkajax() {
	var check = null;
	try {
		// Firefox, Opera 8.0+, Safari
		check = new XMLHttpRequest();
	}
	catch (e) {
		// Internet Explorer
		try {
			check = new ActiveXObject("Msxml2.XMLHTTP");
		}
		catch (e) {
			check = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	return check;

}
function zxcByClassName(nme,el,tag){
 if (typeof(el)=='string') el=document.getElementById(el);
 el=el||document;
 for (var tag=tag||'*',reg=new RegExp('\\b'+nme+'\\b'),els=el.getElementsByTagName(tag),ary=[],z0=0; z0<els.length;z0++){
  if(reg.test(els[z0].className)) ary.push(els[z0]);
 }
 return ary;
}
//validate newsletter//
function validate_new(){
 
var reg=/^[A-Za-z0-9_\+-]+(\.[a-zA-Z0-9_\+-]+)*@[A-Za-z0-9-]+(\.[a-zA-Z0-9-]+)*\.([A-Za-z]{2,6})$/;
 
   var address = document.getElementById("Email").value;
   if(reg.test(address) == false) {
 
  document.getElementById("Email").focus();
      alert('Please Enter valid Email ID');
      return false;
   }
   return true;
  }
  
function rotate(){var prev =1, next =2;setInterval(function(){document.getElementById("rotate"+prev).style.display="none";document.getElementById("rotate"+next).style.display="block";
prev++; next++;
 if(next==6){
                    next=1;
               }
               if(prev==6){
                    prev=1;
               }
            },5000);
        }
        
function verifysearchkeywords_new(pageloc,searchId){
var keyword="";
keyword = document.getElementById(searchId).value;

String.prototype.replaceAll=function(s1, s2) {return this.split(s1).join(s2)}
keyword = keyword.replaceAll('.', ' ').replaceAll(',',' ').replaceAll('/',' ').replaceAll('?',' ').replaceAll('-',' ').replaceAll('_',' ').replace(/(^[\s]+|[\s]+$)/g, '');
var c=keyword.replace(/\s\s+/g,' ')
c= c.replaceAll(' ','-').toLowerCase();
document.getElementById(searchId).focus();
document.getElementById(searchId).value='';
        if (keyword=="" || keyword=="Search")
            {alert("Please enter keyword for search!");
            
            return false; 
            }
        else    
        { if(pageloc=='search') {   window.location.href='../search/'+c ; return false;}
           else if(pageloc=='tag') { window.location.href='../tags/'+c.replace(/ /g,'-');}
            return true;}
}
function disallowspecialchars(a){if(!a)a=window.event;if(a.target)el=a.target;
else if(a.srcElement)el=a.srcElement;if(isIE5&&el.tagName=="INPUT"&&el.type=="text"||el.tagName=="TEXTAREA"||isMoz&&el.tagName=="INPUT"&&el.type=="text"||el.tagName=="TEXTAREA"){if(el.readOnly==false){if(isSplCharcheck(el.value)==false){var b=el.value;var c="!#`~$%^&*+=[]';{}|\":<>";for(var d=0;d<b.length;d++){if(c.indexOf(b.charAt(d))!=-1){var e=c.indexOf(b.charAt(d));var f=c.charAt(e);el.value=el.value.replace(f,"")}}}}}}
function onContextMenu(a){if(onlyOnImages=false||isIE5&&event.srcElement.tagName=="IMG"||isMoz&&a.target.tagName=="IMG"){return cancelContextMenu(a)}}
function cancelContextMenu(a){return false}
var onlyOnImages=false;
var isIE5=document.all&&document.getElementById;var isMoz=!isIE5&&document.getElementById;if(document.getElementById){document.oncontextmenu=onContextMenu;document.onkeyup=disallowspecialchars}var xmlHttpobj;var itemSize;var sizeIcode="";var xmlHttpNew;var icdNew;var xmlHttpsize;var sizeICD;var giftaddsban;var notifyrules;
var Imgs=[];
//Fade.prototype.fade=function(){if(this.opc==0)this.img.src=this.src;zxcOpacity(this.img,this.opc++);var a=this;if(this.opc<101)setTimeout(function(){a.fade()},20)};
var cstime
function submitLetterindexaspx_n(opt)
{  
     if(document.getElementById('Email').value=="" || document.getElementById('Email').value=="Enter email address" )
   		{alert("Please Enter Email ID"); 
   		 return false;
   		}
         else if (checkmail(document.getElementById('Email').value))
         {
                 val=document.getElementById('Email').value 
                 if (opt=='Y') 
                 {centerWindowX('../store/submit.aspx?Email='+val+'&mode=letter');document.getElementById('Email').value='Enter email address';   return false;}
                 else if(opt=='N')
                 {
                 centerWindowX('../store/submit.aspx?Email='+val+'&mode=letter');document.getElementById('Email').value='Enter email address';  return false;
                 } 
           document.getElementById('Email').value='';    return false;       
         }
          
         return false;
  } 
function showheadNew(a){var b;b=get_cookie("custname");if(b!=null)
{//document.getElementById("signcust").innerHTML="Hi. <span  style='padding:0px;' >"+b+"</span>";
document.getElementById("sign").innerHTML="<a href='../../account/logout.aspx' title='Sign Out'>Sign Out</a> | <a href='../../account/loginform.aspx' title='My Account'>My Account</a>"}else{document.getElementById("sign").innerHTML=" <a href='../account/loginform.aspx' title='Sign In / Register'>Sign In / Register</a>"}}


function errorMsg(current, val, top, left) {
     $('.errorWrap').remove();
     $("<span style='float:left; position:relative;' class='errorWrap'><span class='alert'><span class='upArrow'></span>" + val + "</span></span>").insertAfter(current);
     left = 0+(356-$('.alert').width()-20)/2;
     
     if($(current).prop('id')=='message'){
        top = 112;
        left = 0+(765-$('.alert').width()-20)/2;
        
     }
     if($.browser.msie && $.browser.version==7){
     	top = 7;
     }
     $('.alert').css({ left: left, top: top });
     $(current).css({'border-color':'#da433b'}).focus();
     $(current).bind('keypress focusout change', function() {
          $('.errorWrap').remove();
          $(current).css({'border-color':'#C4C4C4'});
     });
}
function emailCheck(current) {
            var $email = $(current).val();
            if ($email == '') {
                return true;
            }
            var emailReg = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
            if (!emailReg.test($email)) {
                emailFlag = 1;
                return false;
            } else {
                return true;
            }
        }
        
function contactUsNew(){
    if($('#con_sub').find(':selected').index()!=0){
        if($.trim($('#qemail').val())!=''){
            if(emailCheck('#qemail')){
                if($.trim($('#fullname').val())!=''){
                    if($.trim($('#message').val())!=''){
                        ccmail="No";
                        centerWindowX('../store/submit.aspx?custname='+$('#fullname').val()+'&fmail='+$('#qemail').val()+'&oid='+$('#orderID').val()+'&message='+$('#message').val()+'&querysub='+$('con_sub').val()+'&ccmail='+ccmail+'&mode=contactquery');document.form1.reset();
                    }
                    else{
                        errorMsg('#message','Please enter message',48,0);
                    }
                }
                else{
                    errorMsg('#fullname','Please enter name',48,0);
                }
            }
            else{
                errorMsg('#qemail','Please enter valid email',48,0);
            }
        }
        else{
            errorMsg('#qemail','Please enter email',48,0);
        }
    }
    else{
        errorMsg('#con_sub','Please select the subject',48,0);
    }

}