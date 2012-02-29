<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/> 
        <meta name="layout" content="genesigmain" />
        <title>Gene Signature Search</title>
        
		<!-- override main.css -->
		<style type="text/css">		
			.detail td a {
			    background: '';
			    padding-left: 10px;
			    vertical-align: top;			    
			 }		

			.detail td a:hover {
			    white-space: normal;		    
			 }		
		</style>    
		
		<script language="javascript" type="text/javascript">

			function handleActionItem(actionItem, id) {
				var action = actionItem.value;
				var url 
				if(action=="") return false;
				
				// clone existing object and bring into edit wizard
				if(action=="clone") {
					url = "/${grailsApplication.metadata['app.name']}/geneSignature/cloneWizard/"+id+"";
				}
				
				// set delete flag
				if(action=="delete") {
					var del=confirm("Are you sure you want to delete?")

					if(del) {
						url="/${grailsApplication.metadata['app.name']}/geneSignature/delete/"+id;
						window.location.href=url;
					} else {
						return false;
					}
				}

				// edit wizard
				if(action=="edit") {
					url = "/${grailsApplication.metadata['app.name']}/geneSignature/editWizard/"+id+"";
				}				

				if(action=="showEditItems") {
					url = "/${grailsApplication.metadata['app.name']}/geneSignature/showEditItems/"+id+"";
				}
				
				// export to Excel 
				if(action=="export") {
					url = "/${grailsApplication.metadata['app.name']}/geneSignature/downloadExcel/"+id+"";
				}

				// public action
				if(action=="public") {
					url = "/${grailsApplication.metadata['app.name']}/geneSignature/makePublic/"+id;
				}

				// send to url
				window.location.href=url;
			}
		
		</script>
	
    </head>
    <body>
    <div class="body">   
  		<g:form frm="GenSignatureFrm" method="post">
  		<g:hiddenField name="id" value="" />
		 
	    <!--  show message -->
    	<g:if test="${flash.message}"><div class="message">${flash.message}</div><br></g:if>
 		
		<p style="text-align: right;"><span class="button"><g:actionSubmit class="edit" action="createWizard" value="New Signature"/></span></p>
    	<h1>Gene Signature List</h1>
	
    	<!-- show my signatures -->   	
       	<table id="mySignatures"  class="detail" style="width: 100%">
		<g:tableHeaderToggle label="My Signatures (${myItems.size()})" divPrefix="my_signatures" status="open" colSpan="${12}"/>
       	
    	<tbody id="my_signatures_detail" style="display: block;">
             <tr>	                
        	 	<th>Name</th>          	   	                
        	    <th>Author</th>
        	    <th>Date Created</th>
        	    <th>Species</th>
        	    <th>Tech Platform</th>
				<th>Tissue Type</th>           	                   	        
        	    <th>Public</th>
        	    <th>Gene List</th>
        	    <th># Genes</th>
        	    <th># Up-Regulated</th>
        	    <th># Down-Regulated</th>              	        
        	    <th>&nbsp;</th>
        	</tr>

	       	<g:each var="gs" in="${myItems}" status="idx">      		 	       		
				<g:render template="/geneSignature/summary_record" model="[gs:gs, idx: idx]" /> 	       		
			</g:each> 		
		</tbody>
       	</table>     
       	
       	<!--  public signatures -->
       	<br>
      	<table id="publicSignatures"  class="detail" style="width: 100%">      	
		<g:tableHeaderToggle label="${adminFlag ? ('Other Signatures ('+pubItems.size()+')') : ('Public Signatures ('+pubItems.size()+')')}" divPrefix="pub_signatures" colSpan="${12}" />
       	
    	<tbody id="pub_signatures_detail" style="display: none;">
             <tr>	                
        	 	<th>Name</th>          	   	                
        	    <th>Author</th>
        	    <th>Date Created</th>
        	    <th>Species</th>
        	    <th>Tech Platform</th>
				<th>Tissue Type</th>           	                   	        
        	    <th>Public</th>
        	    <th>Gene List</th>
        	    <th># Genes</th>
        	    <th># Up-Regulated</th>
        	    <th># Down-Regulated</th>              	        
        	    <th>&nbsp;</th>
        	</tr>

	       	<g:each var="gs" in="${pubItems}" status="idx">      		 	       		
				<g:render template="/geneSignature/summary_record" model="[gs:gs, idx: idx]" /> 	       		
			</g:each>

		</tbody>
       	</table>       	   	

       	</g:form>
    </div>
	</body>
</html>