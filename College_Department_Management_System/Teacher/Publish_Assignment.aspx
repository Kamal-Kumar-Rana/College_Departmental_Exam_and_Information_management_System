<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Publish_Assignment.aspx.cs" Inherits="Admin_Publish_assignment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/Publish_Assignment.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
     <h1>Assignment Submission Page</h1>
    <form action="" method="post" enctype="multipart/form-data">
      <label for="subject">Semester:</label>
      <select id="subject" name="subject">
        <option value="">Please select a semester</option>
        <option value="Sem-I">Sem-I</option>
        <option value="Sem-II">Sem-II</option>
        <option value="Sem-III">Sem-III</option>
        <option value="Sem-IV">Sem-IV</option>
        <option value="Sem-V">Sem-V</option>
        <option value="Sem-VI">Sem-VI</option>
      </select>
      <label for="assignment">Paper Code:</label>
      <select id="assignment" name="assignment">
        <option value="">Please select an paper code</option>
        <option value="BCA-101">BCA-101</option>
        <option value="BCA-102">BCA-102</option>
        <option value="BCA-103">BCA-103</option>
        <option value="BCA-104">BCA-104</option>
        <option value="BCA-105">BCA-105</option>
        <option value="BCA-106">BCA-106</option>
        <option value="BCA-107">BCA-107</option>
        <option value="BCA-201">BCA-201</option>
        <option value="BCA-202">BCA-202</option>
        <option value="BCA-203">BCA-203</option>
        <option value="BCA-204">BCA-204</option>
        <option value="BCA-205">BCA-205</option>
        <option value="BCA-206">BCA-206</option>
        <option value="BCA-207">BCA-207</option>
        <option value="BCA-301">BCA-301</option>
        <option value="BCA-302">BCA-302</option>
        <option value="BCA-303">BCA-303</option>
        <option value="BCA-304">BCA-304</option>
        <option value="BCA-305">BCA-305</option>
        <option value="BCA-306">BCA-306</option>
        <option value="BCA-307">BCA-307</option>
        <option value="BCA-401">BCA-401</option>
        <option value="BCA-402">BCA-402</option>
        <option value="BCA-403">BCA-403</option>
        <option value="BCA-404">BCA-404</option>
        <option value="BCA-405">BCA-405</option>
        <option value="BCA-406">BCA-406</option>
        <option value="BCA-407">BCA-407</option>
        <option value="BCA-501">BCA-501</option>
        <option value="BCA-502">BCA-502</option>
        <option value="BCA-503">BCA-503</option>
        <option value="BCA-504">BCA-504</option>
        <option value="BCA-505">BCA-505</option>
        <option value="BCA-506">BCA-506</option>
        <option value="BCA-507">BCA-507</option>
        <option value="BCA-601">BCA-601</option>
        <option value="BCA-602">BCA-602</option>
        <option value="BCA-603">BCA-603</option>
        <option value="BCA-604">BCA-604</option>
        <option value="BCA-605">BCA-605</option>

      </select>
      <label for="file">File:</label>
      <input type="file" id="file" name="file">
      <input type="submit" value="Submit">
    </formv
    </form>
</body>
</html>
