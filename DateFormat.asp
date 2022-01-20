<!DOCTYPE html>
<html lang="en">
<head>
  <title>Date Format</title>
</head>

<body >
  <form action="" method="post">
    <label>Date</label>   
    <input type="" name="fromDate" id="fromDate" value="">
    <br>
    <input type="submit" value="Submit" class="btn btn-success">
  </form>

  <script>
    function myFunction() {
    var x = document.getElementById("fromDate");
    x.setAttribute("type", "date");
    x.setAttribute("value", "");
  }
  </script>
</body>

</html>

<!--#include virtual="\class\c_data_batch.asp"-->

<%
strDateFormat = Request.Form("fromDate")
if IsDate(strDateFormat) then
  Response.Write "Correct format"
else 
  Response.Write "Incorrect format"
end if
' strDate1 = "02/29/2023"
' Response.Write GetDateInfo(strDate1)
'   Function GetDateInfo(strDateFormat)
'     strDateFormat = Request.Form("fromDate")
'     minYear=1900
'     currentDate = Date()
'     maxYear = Year(currentDate) + 5
    
'     formatedDate = CDate(strDateFormat)

'     if strDateFormat <> "" Then
'       ' strDateSplit = Split(strDateFormat,"-")
'       ' count = UBound(strDateSplit)

'       strDate = Day(formatedDate)
'       strMonth = Month(formatedDate)
'       strYear = Year(formatedDate)

'       if strYear > minYear And strYear < maxYear And strMonth > 0 And strMonth < 13 then 'Year and Month Limit Check'
'         ' Leaf Year Check
'         if (strYear Mod 4 = 0 And strYear Mod 100 <> 0) Or strYear Mod 400 = 0 Then
'           if strMonth = 2 Then ' February Month Check
'             if strDate<30 And strDate>0 Then
'               strDateCheck = strMonth&"-"&strDate&"-"&strYear
'             else 
'               strDateCheck=""
'             End if

'           Elseif strMonth=4 Or strMonth=6 or strMonth=9 or strMonth=11 Then ' Month With 30 days
'             if strDate<31 And strDate>0 Then
'               strDateCheck = strMonth&"-"&strDate&"-"&strYear
'             Else 
'               strDateCheck=""
'             End if 

'           Else ' Month With 31 days
'             if strDate<32 And strDate>0 Then
'               strDateCheck = strMonth&"-"&strDate&"-"&strYear
'             Else 
'               strDateCheck="" 
'             End if 
'           End if
'           ' Leaf Year Check End
'         Else 
'           if strMonth = 2 Then ' February Month Chck
'             if strDate<29 And strDate>0 Then
'               strDateCheck = strMonth&"-"&strDate&"-"&strYear
'             else 
'               strDateCheck=""
'             End if

'           Elseif strMonth=4 Or strMonth=6 or strMonth=9 or strMonth=11 Then ' Month With 30 days 
'             if strDate<31 And strDate>0 Then
'               strDateCheck = strMonth&"-"&strDate&"-"&strYear
'             Else 
'               strDateCheck=""
'             End if

'           Else ' Month With 31 days
'             if strDate<32 And strDate>0 Then
'               strDateCheck = strMonth&"-"&strDate&"-"&strYear
'             Else 
'               strDateCheck="" 
'             End if      
'           End if
'         End If 

'       Else 
'         strDateCheck=""
'       End if

'     End if
'   GetDateInfo = strDateCheck
'   End Function
%>
