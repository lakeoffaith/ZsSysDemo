<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html>
<head>
   <meta charset="utf-8" />
   <!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame -->
   <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
   <!-- Mobile viewport optimized: h5bp.com/viewport -->
   <meta name="viewport" content="width=device-width">

   <title>BootMetro Demo - Hub</title>

   <meta name="robots" content="noindex, nofollow">
   <meta name="description" content="BootMetro : Simple and complete web UI framework to create web apps with Windows 8 Metro user interface." />
   <meta name="keywords" content="bootmetro, modern ui, modern-ui, metro, metroui, metro-ui, metro ui, windows 8, metro style, bootstrap, framework, web framework, css, html" />
   <meta name="author" content="AozoraLabs by Marcello Palmitessa"/>
   <link rel="publisher" href="https://plus.google.com/117689250782136016574">

   <!-- remove or comment this line if you want to use the local fonts -->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700' rel='stylesheet' type='text/css'>

   <link rel="stylesheet" type="text/css" href="${ctxStatic}/bootmetro/css/bootmetro.css">
   <link rel="stylesheet" type="text/css" href="${ctxStatic}/bootmetro/css/bootmetro-responsive.css">
   <link rel="stylesheet" type="text/css" href="${ctxStatic}/bootmetro/css/bootmetro-icons.css">
   <link rel="stylesheet" type="text/css" href="${ctxStatic}/bootmetro/css/bootmetro-ui-light.css">
   <link rel="stylesheet" type="text/css" href="${ctxStatic}/bootmetro/css/datepicker.css">


   <link rel="stylesheet" type="text/css" href="${ctxStatic}/bootmetro/css/demo.css">
   <!-- Le fav and touch icons -->
   <link rel="shortcut icon" href="${ctxStatic}/bootmetro/ico/favicon.ico">
   <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${ctxStatic}/bootmetro/ico/apple-touch-icon-144-precomposed.png">
   <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${ctxStatic}/bootmetro/ico/apple-touch-icon-114-precomposed.png">
   <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${ctxStatic}/bootmetro/ico/apple-touch-icon-72-precomposed.png">
   <link rel="apple-touch-icon-precomposed" href="${ctxStatic}/bootmetro/ico/apple-touch-icon-57-precomposed.png">
  
   <!-- All JavaScript at the bottom, except for Modernizr and Respond.
      Modernizr enables HTML5 elements & feature detects; Respond is a polyfill for min/max-width CSS3 Media Queries
      For optimal performance, use a custom Modernizr build: www.modernizr.com/download/ -->
   <script src="${ctxStatic}/bootmetro/js/modernizr-2.6.2.min.js"></script>

   
</head>

<body>
   <!--[if lt IE 7]>
   <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
   <![endif]-->
	
   <div id="wrap">
   
      <!-- Header
      ================================================== -->
      <div id="nav-bar" class="">
         <div class="pull-left">
            <div id="header-container">
               
               <div style="padding-top: 5px">
                  <header><h1>追溯系统</h1></header>
               </div>
              
            </div>
         </div>
         <div class="pull-right">
            <div id="top-info" class="pull-right">
            <a id="settings" href="#" class="win-command pull-right">
               <span class="win-commandicon win-commandring icon-cog-3"></span>
            </a>
            <a id="logged-user" href="#" class="win-command pull-right">
               <span class="win-commandicon win-commandring icon-user"></span>
            </a>
            <div class="pull-left" style="padding-top: 10px">
               <header><h2>admin</h2></header>
               
            </div>
         </div>
      </div>
      </div>
   
     
   
      <!--<div id="metro-container" class="-container">-->
         <!--<div class="row">-->
            <!--<div id="hub" class="metro">-->
               <div class="metro panorama">
                  <div class="panorama-sections">
   
   					 <c:if test="${manageBlock!=null && fn:length(manageBlock)>0}">
   					 <div class="panorama-section ">
   
                        <h2>管理模块</h2>
                        <c:forEach var="item" items="${manageBlock}" step="3" varStatus="v">
                        
                        		<div class="tile-column-span-2">
                        		
                        	
                        		<c:forEach var="i" begin="${v.index}" end="${v.index+2}">
                        			<c:if test="${manageBlock[i]!=null}">
                        				<a class="tile wide imagetext bg-color-orange" href="${manageBlock[i].url}">
		                              <div class="image-wrapper">
		                                 <span class="${manageBlock[i].icon}" style="font-size: 80px"></span>
		                              </div>
		                              <div class="column-text">
		                                 <div class="text-header3">${manageBlock[i].name}</div>
		                              </div>
		                           </a>
                        			</c:if>
                        			
                        		</c:forEach>
                        		</div>
                        	
                        </c:forEach>
                        
                      </div>
   					 </c:if>
                    <%--  <c:if test="${manageBlock[i]!=null}">
                        				<a class="tile wide imagetext bg-color-orange" href="${manageBlock[i].url}">
		                              <div class="image-wrapper">
		                                 <span class="${manageBlock[i].icon}" style="font-size: 80px"></span>
		                              </div>
		                              <div class="column-text">
		                                 <div class="text-header3">${manageBlock[i].name}</div>
		                              </div>
		                           </a>
                        			</c:if> --%>
                    <%--  <a class="tile wide imagetext bg-color-orange" href="${item.url}">
                              <div class="image-wrapper">
                                 <span class="${item.icon}" style="font-size: 80px"></span>
                              </div>
                              <div class="column-text">
                                 <div class="text-header3">${item.name}</div>
                              </div>
                           </a> --%>
   
                     <div class="panorama-section ">
   
                        <h2>流程模块</h2>
                        <div class="tile-column-span-2">
                           <a class="tile wide imagetext bg-color-orange" href="./list-detail.html">
                              <div class="image-wrapper">
                                 <span class="icon-comment" style="font-size: 80px"></span>
                              </div>
                              <div class="column-text">
                                 <div class="text-header3">应用主页</div>
                              </div>
                           </a>
   
                        <a class="tile wide imagetext tile-double bg-color-green" href="#">
                           <div class="image-wrapper">
                              <span class="icon-comment" style="font-size: 80px"></span>
                           </div>
                           <div class="column-text">
                              <div class="text-header3">系统设计</div>
                           </div>
                        </a>
                           <a class="tile wide imagetext tile-double bg-color-green" href="#">
                              <div class="image-wrapper">
                                 <span class="icon-comment" style="font-size: 80px"></span>
                              </div>
                              <div class="column-text">
                                 <div class="text-header3">系统设计</div>
                              </div>
                           </a>
                
                        </div>
                        <div class="tile-column-span-2">
                           <a class="tile wide imagetext bg-color-orange" href="./list-detail.html">
                              <div class="image-wrapper">
                                 <span class="icon-comment" style="font-size: 80px"></span>
                              </div>
                              <div class="column-text">
                                 <div class="text-header3">应用主页</div>
                              </div>
                           </a>
   
                        <a class="tile wide imagetext tile-double bg-color-green" href="#">
                           <div class="image-wrapper">
                              <span class="icon-comment" style="font-size: 80px"></span>
                           </div>
                           <div class="column-text">
                              <div class="text-header3">系统设计</div>
                           </div>
                        </a>
                           <a class="tile wide imagetext tile-double bg-color-green" href="#">
                              <div class="image-wrapper">
                                 <span class="icon-comment" style="font-size: 80px"></span>
                              </div>
                              <div class="column-text">
                                 <div class="text-header3">系统设计</div>
                              </div>
                           </a>
                        </div>
                 
                        <div class="tile-column-span-2">
                           <a class="tile wide imagetext bg-color-orange" href="./list-detail.html">
                              <div class="image-wrapper">
                                 <span class="icon-comment" style="font-size: 80px"></span>
                              </div>
                              <div class="column-text">
                                 <div class="text-header3">应用主页</div>
                              </div>
                           </a>
   
                        <a class="tile wide imagetext tile-double bg-color-green" href="#">
                           <div class="image-wrapper">
                              <span class="icon-comment" style="font-size: 80px"></span>
                           </div>
                           <div class="column-text">
                              <div class="text-header3">系统设计</div>
                           </div>
                        </a>
                           <a class="tile wide imagetext tile-double bg-color-green" href="#">
                              <div class="image-wrapper">
                                 <span class="icon-comment" style="font-size: 80px"></span>
                              </div>
                              <div class="column-text">
                                 <div class="text-header3">系统设计</div>
                              </div>
                           </a>
                        </div>
                       
   
                     </div>
   
                     <div class="panorama-section">
   
                        <h2>定制模块</h2>
   
                        <div class="tile-column-span-2">
                           <a class="tile wide imagetext bg-color-orange" href="./list-detail.html">
                              <div class="image-wrapper">
                                 <span class="icon-comment" style="font-size: 80px"></span>
                              </div>
                              <div class="column-text">
                                 <div class="text-header3">应用主页</div>
                              </div>
                           </a>
   
                        <a class="tile wide imagetext tile-double bg-color-green" href="#">
                           <div class="image-wrapper">
                              <span class="icon-comment" style="font-size: 80px"></span>
                           </div>
                           <div class="column-text">
                              <div class="text-header3">系统设计</div>
                           </div>
                        </a>
                           <a class="tile wide imagetext tile-double bg-color-green" href="#">
                              <div class="image-wrapper">
                                 <span class="icon-comment" style="font-size: 80px"></span>
                              </div>
                              <div class="column-text">
                                 <div class="text-header3">系统设计</div>
                              </div>
                           </a>
                
                        </div>
                        <div class="tile-column-span-2">
                           <a class="tile wide imagetext bg-color-orange" href="./list-detail.html">
                              <div class="image-wrapper">
                                 <span class="icon-comment" style="font-size: 80px"></span>
                              </div>
                              <div class="column-text">
                                 <div class="text-header3">应用主页</div>
                              </div>
                           </a>
   
                        
                
                        </div>
   
                     </div>
   
                  </div>
               </div>
               <a id="panorama-scroll-prev" href="#"></a>
               <a id="panorama-scroll-next" href="#"></a>
               <div id="panorama-scroll-prev-bkg"></div>
               <div id="panorama-scroll-next-bkg"></div>
            <!--</div>-->
         <!--</div>-->
      <!--</div>-->
   
   </div>


   
   <script type="text/javascript" src="${ctxStatic}/bootmetro/js/jquery-1.10.0.min.js"></script>
   <!--[if IE 7]>
   <script type="text/javascript" src="scripts/bootmetro-icons-ie7.js">
   <![endif]-->

   <script type="text/javascript" src="${ctxStatic}/bootmetro/js/min/bootstrap.min.js"></script>
   <script type="text/javascript" src="${ctxStatic}/bootmetro/js/bootmetro-panorama.js"></script>
   <script type="text/javascript" src="${ctxStatic}/bootmetro/js/bootmetro-pivot.js"></script>
   <script type="text/javascript" src="${ctxStatic}/bootmetro/js/bootmetro-charms.js"></script>
   <script type="text/javascript" src="${ctxStatic}/bootmetro/js/bootstrap-datepicker.js"></script>

   <script type="text/javascript" src="${ctxStatic}/bootmetro/js/jquery.mousewheel.min.js"></script>
   <script type="text/javascript" src="${ctxStatic}/bootmetro/js/jquery.touchSwipe.min.js"></script>

   


   <script type="text/javascript">

      $('.panorama').panorama({
         //nicescroll: false,
         showscrollbuttons: true,
         keyboard: true,
         parallax: true
      });

//      $(".panorama").perfectScrollbar();

      $('#pivot').pivot();

   </script>
</body>
</html>