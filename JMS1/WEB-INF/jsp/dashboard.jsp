<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/jsp/common.jsp" %>

</head>


<body>

    <div id="wrapper">
		<%@ include file="/WEB-INF/jsp/header.jsp" %>
		
		
        <div id="page-wrapper">
            <div class="row" >
                <div class="col-lg-12"><h3 class="page-header">Dashboard</h3></div>
	        </div>
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"></div>
                                    <div></div>
                                </div>
                            </div>
                        </div>
                        <a href="<%=request.getContextPath()%>/showGoldItems">
                            <div class="panel-footer">
                                <span class="pull-left">Gold</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"></div>
                                    <div></div>
                                </div>
                            </div>
                        </div>
                        <a href="<%=request.getContextPath()%>/showSilverItems">
                            <div class="panel-footer">
                                <span class="pull-left">Silver</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"></div>
                                    <div></div>
                                </div>
                            </div>
                        </div>
                        <a href="<%=request.getContextPath()%>/showArtificialItems">
                            <div class="panel-footer">
                                <span class="pull-left">Artificial</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                
            </div>
          </div>
           
           
</div>

</body>

</html>
