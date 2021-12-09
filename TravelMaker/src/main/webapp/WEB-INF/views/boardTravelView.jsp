<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테마 여행 뷰</title>
</head>
<body>
<h1 style="text-align:center">새글 쓰기</h1>
   <table border = "0" align = "center">
      <tr>
         <td align = "right">글제목: </td>
         <td colspan = "2"><input type = "text" size = "67" maxlength="500"
                                                               name="title" /></td>
      </tr>
      <tr>
         <td align = "right" valign = "top"><br>글내용: </td>
         <td colspan = 2><textarea name = "content" rows = "10" cols = "65"
                                                   maxlength = "4000"></textarea> </td>
      </tr>
      <tr>
         <td align = "right">이미지파일 첨부: </td>
         <td> <input type = "file" name = "imageFileName" onchange = "readURL(this);" /></td>
         <td><img id = "preview" src = "#" width = 200 height = 200 /></td>
         </tr>
         <tr>
            <td align = "right"> </td>
            <td colspan = "2">
               <input type = "submit" value = "글쓰기" />
               <input type = button value = "목록보기" onClick = "backToList(this.form)" />         
         </td>
      </tr>                                                                                                         
   </table>
</body>
</html>