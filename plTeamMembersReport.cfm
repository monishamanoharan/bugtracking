
<cfdocument format="PDF">
   <cfoutput>
       <cfquery name="getbugID" datasource="bugTracking">
        select projectID from projectUsers where userID=#session.userID# and isLead=1 and hide=0
       </cfquery>
       <cfquery name="selectData" datasource="bugTracking">
                select u.userName name,u.userID id,p.projectName, p.projectID pid,designations.name
                from users u inner join projectUsers pu inner join projects p inner join designations
                on u.userID=pu.userID and pu.projectID=p.projectID and designations.designationID=u.designationID 
       </cfquery>
                <html>
                    <head><link href="report.css" rel="stylesheet"></head>
                    <body>
                        <div class="divHeading"><h2>Team Member Report</h2></div>
                        <div>
                            
                            <br /><br />
                            <hr>
                            <table class="report" align="center">
                                <tr class="trBackground">
                                
                                <th class="tdClass">Employee Name</th>
                                <th class="tdClass">Designation</th>
                                 <th class="tdClass">Project</th>
                                
                                
                                   </tr>
                                
                                <cfloop query="selectData">
                                    <cfoutput>
                                <tr> 
                            <td class="tdClass">#name#</td>
                            <td class="tdClass">#name#</td>
                            <td class="tdClass">#projectName#</td>
                         
                                                                                                        </tr>
                                    </cfoutput>
                                 </cfloop>
                            </table>
                       
                        </div>
                    </body>
       </html>
   </cfoutput>
</cfdocument>
