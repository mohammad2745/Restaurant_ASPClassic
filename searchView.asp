
<table class="table" id="searchDisplay">
  <thead>
      <tr>
          <th scope="col">Name</th>
          <th scope="col">Email</th>
          <th scope="col">Phone</th>
          <th scope="col">Staffs</th>
          <th scope="col">Date</th>
          <th scope="col">Action</th>
      </tr>
  </thead>
    <tbody>
    <%  
    set ObjData = new c_Data
    ObjData.OpenConnection "ResumeView", strErr 

    ' Form Data 
    RName = Request.Form("RName")
    RStaff = Request.Form("members")
    SDate = Request.Form("Sdate")
    EDate = Request.Form("Edate")

    ' Search Data 
    Search = ""
    ' -------Date-----------
    if SDate <> "" AND EDate <> "" then
      Search = Search & "rDate between #"& SDate &"#  and  #"& EDate &"#"

    elseif SDate <> "" AND EDate = "" then    
      Search = Search & "rDate >=  #"& SDate &"#  "

    elseif SDate = "" AND EDate <> "" then 
      Search = Search & "rDate <= #"& EDate &"#"
    end if

    ' --------Name-----------
    if RName <> "" then
      if Search <> "" Then
        Search = Search &  " and "
      End If
      Search = Search & " Instr( rName, '" & RName & "')"
    end if       

    ' ---------Staffs--------
    if RStaff <> "" then
      if Search <> "" Then
        Search = Search &  " and "
      End If
      Search = Search & " rStaff='"& RStaff &"'"
    end if 

    if Search <> "" Then
      Search = " where " & Search
    End If
    SQL = "Select id, rName, rEmail, rPhone, rStaff, rDate from restaurant"&Search&" "
    rs = ObjData.RetrieveData(SQL, strErr)
    

    if strErr <> "" then
          response.write strErr
        end if

        Dim row, rows

        If IsArray(rs) Then
          rows = UBound(rs, 2)
          For row = 0 To rows
            id = rs(0, row)      
      %>
      <tr style='background: none;' id="<%=(id)%>">
          <td><%=(rs(1, row))%></td>
          <td><%=(rs(2, row))%></td>
          <td><%=(rs(3, row))%></td>
          <td><%=(rs(4, row))%></td>
          <td><%=(rs(5, row))%></td>
          <td>
            <a href="edit.asp?id=<%Response.Write(id)%>" class="btn btn-success" >Edit</a>
            <button id="delete" class="btn btn-danger" onClick=deleteRow(<%Response.Write(id)%>)> Delete</button>
          </td>
      </tr>
      <%
      Next
      End If
      ObjData.CloseConnection
      %>
    
  </tbody>
</table>