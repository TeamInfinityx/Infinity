<%@ Page Language="VB" AutoEventWireup="false" CodeFile="model_library_view.aspx.vb" Inherits="user_logout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
     <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
    <style>
       
        * {
            font-family: 'Oxygen', sans-serif;
            box-sizing:border-box;
        }

        html, body, form {
            height: 100%;
            margin: 0;
            font-size: 12px;
            background-color:#fff;
            overflow:hidden;
        }

        #bx1, #bx2, #bx3, #bx4 {
            float: left;
            height: 100%;
            padding: 8px;
            border-right: 1px solid #ccc;
        }

        #bx1 {
            width: 100%;
            height:50px;
            border-bottom:solid 1px #e7e7e7;
        }
        #bx2 {
            width: 250px;
        }
        #bx3 {
            width: 200px;
        }

        table {
            border-collapse: collapse;
            font-size: 12px;
            width: 100%;
        }
            table td {
                padding: 5px;
                border-bottom: 1px solid #ccc;
            }
            table thead td {
                font-weight: bold;
                border-color:#777;
            }
           
                table thead tr:first-child td i.fa-plus-circle {
                    float: right;
                    font-size: 14px;
                    cursor: pointer;
                }
            table tbody td {
                cursor: pointer;
            }
            table tbody tr.slctd td {
                background: #f5f5f5;
            }

        #hddiv {
            display: none;
        }

        select, input[type=text], input[type=number] {
            border: 1px solid #ccc;
            padding: 4px;
            width: 100%;
        }

        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        input[type=number] {
            -moz-appearance: textfield;
            width:50px;
        }

        #bx4 table {
            margin-top: 30px;
        }
            #bx4 table thead td {
                font-size: 12px;
                border-bottom: 1px solid #777;
            }
        .add-btn {
            cursor:pointer;
        }
        .trash-btn {
            font-size:18px;
            cursor:pointer;
        }
        .jscolor {
            width:25px;
            height:25px;
        }
        .box2 {
            width:100%;
            height:calc(100% - 50px);
        }
        iframe {
            height:100%;
            width:100%;
            border:none;
        }
        #bx1 div {
            float:left;
            padding-right:5px;
            padding-top:5px;
        }
        #importbtn {
            padding: 0px;
            height: 27px;
            width: 100px;
            border-radius: 0;
        }
         #msgbox{
            width: 300px;
            height: 100px;
            position:absolute; /*it can be fixed too*/
            left:0; right:0;
            top:0; bottom:0;
            margin:auto;
            z-index:15;
            background-color:#fff;
            border:solid 1px red;
            text-align:center;
            line-height:100px;
            font-size:18px;
            display:none;
        }
        .copy-icon {
                float: right !important;
    cursor: pointer;
    font-size: 20px;
    font-weight: 600;
    color: #2196F3;
        }
    </style>
    <script>
        var projectId = <%=projectId%> ;
        var userId = <%=userId%> ;
        var userKey = '<%=userKey%>' ;
        var enterpriseId = <%=enterpriseId%> ;
    </script>
</head>
<body>
    <form runat="server">
   
        <div style="position: absolute;
    right: 50px;
    top: 11px;"><input style="border-radius: 5px;
    border: solid 1px #dadada;
    padding: 5px;" id="lnkbx" value=""/></div>

         <div id="msgbox">
            <div><span id="msg-box-ttl">Collecting Data...</span></div>
        </div>

        <div id="bx1">
           <div>
               <select id="fromOption"></select>
           </div>
            <div class="copy-icon"><span><i class="fa fa-clone" aria-hidden="true"></i></span></div>
            <!--<div>
                <select id="toOption"></select>
            </div>
            <div>
                <button id="importbtn" type="button" class="btn btn-primary">Import</button>
            </div>-->
        </div>
        <div class="box2">
            <iframe id="date-frame"></iframe>
        </div>
       
    </form>
    
   
    <script>

        var selectedObjId = 0;

        var all_3dLibrary = [];


   
        get_all_3dLibrary()
        function get_all_3dLibrary(){
            var url = "&uid=" + userId + "&pid=" + projectId + "&eid=" + enterpriseId + "&uk=" + userKey;
            url = "cms_library_upload.aspx?flag=39"+ url;
            $.ajax({
                url: url, success: function (result) {
            
                    //console.log(result)
                    eval(result);
                    all_3dLibrary = obj;
                    console.log(all_3dLibrary)
                   
                    var optionStr = getLibraryOption(all_3dLibrary)
                    $("#fromOption, #toOption").html(optionStr)
                                       
                }
            });
        }
        function getLibraryOption(data){
            var str='<option value="0">Select Library</option>'
            for (var i = 0; i < data.length; i++) {
             str+='<option value="'+data[i].id+'">'+data[i].ttl+'</option>'
            }
            return str;
        }

        $('#fromOption').on('change', function() {
            var val = this.value;
            if (val!=0) {
                $("#date-frame").attr("src",'library_model_data_collect.aspx?eid='+enterpriseId+'&pid='+projectId+'&uid='+userId+'&uk='+userKey+'&flag=0&libid='+val+'&isupdate=1')
                $("#lnkbx").val('https://aws.rimpexpmis.com/3d/ModelView.aspx?libid='+val+'')
            }
        });
        function updateObjid(objId){
            selectedObjId = objId;
        }

        $(".copy-icon").click(function(){
            copytxt();
        });
        function copytxt(){
            var copyText = document.getElementById("lnkbx");
            copyText.select();
            copyText.setSelectionRange(0, 99999)
            document.execCommand("copy");
            alert("Copied");
        }


        $("#importbtn").click(function(){

            var fromLibId = $('#fromOption').find(":selected").val();
            var toLibId = $('#toOption').find(":selected").val();
            if (selectedObjId==0) {
                alert("please select object from 3D");
                return;
            }
            if (fromLibId==0) {
                alert("please select from library");
                return;
            }
            if (toLibId==0) {
                alert("please select to library");
                return;
            }
            if (fromLibId==toLibId) {
                alert("from and to library are same");
                return;
            }

            $.confirm({
                title: 'Are You Sure?',
                content: 'Do you really want to Import',
                type: 'blue',
                typeAnimated: true,
                buttons: {
                    yes: {
                        text: 'Yes',
                        btnClass: 'btn-blue',
                        action: function(){

                            $("#msgbox").show();
                            var url = "&uid=" + userId + "&pid=" + projectId + "&eid=" + enterpriseId + "&uk=" + userKey;
                            url = "cms_library_upload.aspx?flag=78"+"&fromid="+fromLibId+"&toid="+toLibId+"&objid="+selectedObjId+ url;
                            $.ajax({
                                url: url, success: function (result) {
                                    $("#msgbox").hide();
                                    console.log(result)
                                    alert("imported")
                                       
                                }
                            });
                        }
                    },
                    no:{
                        text: 'NO',
                    }
                   
                },
                boxWidth: '350px',
                useBootstrap: false,
               
            });

            
           
        });
    </script>
</body>
</html>
