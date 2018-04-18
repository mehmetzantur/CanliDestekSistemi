<%@ Page Language="C#" AutoEventWireup="true" CodeFile="onoffbutton.aspx.cs" Inherits="veriler" %>

<%@ Register assembly="C1.Web.UI.Controls.2" namespace="C1.Web.UI.Controls.C1Window" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.2.6.pack.js" type="text/javascript"></script>
    <link type="text/css" href="./images/docs.css" rel="stylesheet" media="all" />
	<link type="text/css" href="./images/jquery.ibutton.css" rel="stylesheet" media="all" />

	<!---// load jQuery from the GoogleAPIs CDN //--->
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
  <script type="text/javascript" src="Scripts/jquery.ibutton.js"></script>
  <script type="text/javascript" src="Scripts/jquery.easing.1.3.js"></script>
  <script type="text/javascript" src="Scripts/jquery.metadata.js"></script>

	<style type="text/css">
		h4, h5 {
			margin-bottom: 0;
		}
		
		.examples pre {
			margin-top: 0;
		}
		
		label.label {
			display: block;
			width: 120px;
			float: left;
			padding-top: 5px;
			font-weight: bold;
			height: 30px;
		}
		
		div.row {
			margin-top: -8px;
			margin-left: -8px;
		}
		
		input.button {
			margin-top: 0px;
		}
		
		/* shows overwriting styles via CSS */
		#css .ibutton-container {
			width: 175px;
		}

		#css .ibutton-container .ibutton-handle {
			width: 5px;
		}
	</style>

	<script type="text/javascript">
	<!--	    //
	    function debug() {
	        if (window.console && window.console.log) console.log(arguments);
	    }

	    // on DOM ready
	    $(document).ready(function () {
	        $(".group").iButton({
	            init: function () {
	                debug("init", arguments);
	            }
			, change: function () {
			    debug("change", arguments);
			}
			, click: function () {
			    debug("click", arguments);
			}
			, disable: function () {
			    debug("disable", arguments);
			}
			, destroy: function () {
			    debug("destroy", arguments);
			}
	        });

	        $("#ex10")
	        // attach the iButton behavior
			.iButton({
			    labelOn: "Yes"
			 , labelOff: "No"
			 , change: function ($input) {
			     // update the text based on the status of the checkbox
			     $("#send-email").html($input.is(":checked") ? "Yes, send me more e-mail!" : "Ugh... no more e-mail already!");
			 }
			})
	        // trigger the change event (to update the text)
			.trigger("change");
	    });
	//-->

	</script>
   
</head>

<body>
    <form id="form1" runat="server">
<div id="simple" class="group">
  <div class="row">
    <input type="checkbox" id="ex02" checked="checked" />
  </div>
</div>

    </form>


</body>
</html>
