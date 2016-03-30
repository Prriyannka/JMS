<%@ page language="java" %>
<div class="navbar-default sidebar" role="navigation">
     <div class="sidebar-nav navbar-collapse">
         <ul class="nav" id="side-menu">
             
             <li>
                 <a href="<%=request.getContextPath()%>/loadPageOnMenuClick/dashboard"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
             </li>
             <li>
                 <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Masters<span class="fa arrow"></span></a>
                 <ul class="nav nav-second-level">
                     <li><a href="<%=request.getContextPath()%>/loadPageOnMenuClick/addNewItem">Add Items </a></li>
                     <li><a href="<%=request.getContextPath()%>/showItems">Show Items </a></li>
                 </ul>
                 <!-- /.nav-second-level -->
           </li>
           <li>
               <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Stock<span class="fa arrow"></span></a>
               <ul class="nav nav-second-level">
                   <li>
                       <a href="<%=request.getContextPath()%>/loadStockPage">Add Items In Stock </a>
                   </li>
                   <li>
                       <a href="<%=request.getContextPath()%>/showItemsInStock">Show Items Stock</a>
                   </li>
               </ul>
             </li>
             <li>
               <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Customer Transaction <span class="fa arrow"></span></a>
               <ul class="nav nav-second-level">
                   <li>
                       <a href="<%=request.getContextPath()%>/loadCustomerSellPage">Customer Sell Page </a>
                   </li>
                  
               </ul>
               <!-- /.nav-second-level -->
                </li>
                
            </ul>
        </div>
</div>