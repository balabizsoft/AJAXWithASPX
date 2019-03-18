<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestPrg01.aspx.cs" Inherits="WebApplication16.TestPrg01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="jquery-3.2.1.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            User Name:
            <input type="text" id="txtUserName" name="$UserName" />
            Password :
            <input type="text" id="txtPassword" name="$Password" />
            UserType :
            <input type="text" id="txtUserType" name="$UserType" />
            <input type="hidden" id="hidParam" runat="server" />
            <input type="button" id="btnSubmit" value="submit" onclick="fnSave();" />
        </div>
    </form>
    <script>
    //    function fnSave() {
    //                    //document.getElementById('hidParam').value = 'UserName:' + document.getElementById('txtUserName').value + '$Password:' + document.getElementById('txtPassword').value + '$UserType:' + document.getElementById('txtUserType').value;

    //        var data = $("#form1").serializeArray().filter(x => { return x.name.toString().startsWith("$"); }).map(x => { return { name: x.name.toString().substring(1), value: x.value }; });
    //        console.log(data);
    //        jQuery.ajax({
    //url: 'TestPrg01.aspx/Save',
    //type: "GET",
    //data: data ,
    //contentType: "application/json; charset=utf-8",
    //dataType: "json",
    //beforeSend: function () {
    //              alert("Start!!! ");
    //           },
    //success: function (res) {
    //             alert(res);
    //          },
    //failure: function (msg) { alert("Sorry!!! "); }
    //});
    //    }
    </script>

    <script>
        function fnSave() {
            var sdata = { datas: $("#form1").serializeArray().filter(x => { return x.name.toString().startsWith("$"); }).map(x => { return { name: x.name.toString().substring(1), value: x.value }; }) };

            $.ajax({
                type: "POST",
                url: "TestPrg01.aspx/Save",
                contentType: "application/json; charset=utf-8",
                data:JSON.stringify(sdata) ,
                dataType: "json",
                success: function (response) {
                    console.log(response.d);  
                    alert(response.d);
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }
    </script>
</body>
</html>
