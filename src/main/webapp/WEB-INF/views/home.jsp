<!DOCTYPE HTML>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>


<html>
    <head>
        <title>JQUERY UI Widget Home</title>
        
       <!-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/scripts/plupload/jquery.plupload.queue/css/jquery.plupload.queue.css"/>   -->
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/scripts/jquery-ui-1.10.2/themes/base/minified/jquery-ui.min.css"/>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/scripts/plupload/jquery.ui.plupload/css/jquery.ui.plupload.css"/>

		<script type="text/javascript" src="<%=request.getContextPath()%>/scripts/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/scripts/jquery-ui-1.10.2/ui/minified/jquery-ui.min.js"></script>

		<!-- Load plupload and all it's runtimes and finally the jQuery queue widget -->
		<script type="text/javascript" src="<%=request.getContextPath()%>/scripts/plupload/plupload.full.js"></script>

		<!-- <script type="text/javascript" src="<%=request.getContextPath()%>/scripts/plupload/jquery.plupload.queue/jquery.plupload.queue.js"></script>    -->
        <script type="text/javascript" src="<%=request.getContextPath()%>/scripts/plupload/jquery.ui.plupload/jquery.ui.plupload.js"></script>


		<script type="text/javascript">
			// Convert divs to queue widgets when the DOM is ready
			$(function() {
				 $("#uploader").plupload({
        			// General settings
        			runtimes : 'html5,gears,silverlight,flash,browserplus',
        			url : 'upload',
        			max_file_size : '60mb',
        			chunk_size : '1mb',
        			unique_names : true,
        			// Resize images on clientside if we can
        			resize : {width : 320, height : 240, quality : 90},
        			// Specify what files to browse for
        			filters : [
            			{title : "Image files", extensions : "jpg,gif,png"},
            			{title : "Zip files", extensions : "zip"}
        			],
        			// Flash settings
       				flash_swf_url : '<%=request.getContextPath()%>/scripts/plupload/plupload.flash.swf',
        			// Silverlight settings
        			silverlight_xap_url : '<%=request.getContextPath()%>/scripts/plupload/plupload.silverlight.xap'
    			});

	    		// Client side form validation
	    		$('form').submit(function(e) {
	    			var uploader = $('#uploader').plupload('getUploader');
	 	       		// Files in queue upload them first
	        		if (uploader.files.length > 0) {
	            		// When all files are uploaded submit form
	            		uploader.bind('StateChanged', function() {
	                		if (uploader.files.length === (uploader.total.uploaded + uploader.total.failed)) {
	                   			 $('form')[0].submit();
	                		}
	            		});
	            		uploader.start();
	        		} else {
			            alert('You must queue at least one file.');
	        		}
	       	 		return false;
	    		});
			});
		</script>

    </head>
    <body>
        <h1>File upload test</h1>
    
    	<form>
    		<div id="uploader">
        		<p>You browser doesn't have Flash, Silverlight, Gears, BrowserPlus or HTML5 support.</p>
		    </div>
		</form>
    
    </body>
</html>
