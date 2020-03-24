<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
        <title>Danh sách sinh viên</title>
        <link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/css/pagination.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/css/customize.css" rel="stylesheet" type="text/css">
    </head>
    <body class="app">
        <%@include file="loading.jsp" %>
        <div>
            <div class="col-md-12 ">
                <c:if test="${err}">
                    <div style="color: red">
                        <script>
                            window.addEventListener("load", function () {
                                popupNotify('Lỗi ', "${msg}", 'Đóng');
                            });
                            var idModalAlert = '#modalAlert';
                            function popupNotify(title, body, btnClose) {
                                $(idModalAlert + ' .modal-title').html(title);
                                $(idModalAlert + ' .modal-body').html(body);
                                $(idModalAlert + ' .btn-secondary').html(btnClose);
                                $(idModalAlert).modal('show');
                            }
                        </script>
                    </div>
                </c:if>
            </div>
            <div class="page-container">
                <div class="header navbar">
                    <div class="header-container">
                        <div class="mT-30">
                            <form>
                                <div class="form-group col-md-10" style="float: left">
                                    <input type="text" name="search" class="form-control" id="search" placeholder="Tìm kiếm sinh viên">
                                </div>
                                <div class="col-md-2" style="float: left">
                                    <input id="btnSearch"  type="button" class="btn btn-primary" value="Submit"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <main class="main-content bgc-grey-100">
                    <div id="mainContent">
                        <div class="container-fluid">
                            <h4 class="c-grey-900 mT-10 mB-30"></h4>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="bgc-white bd bdrs-3 p-20">
                                        <h4 class="c-grey-900 mB-20 pull-left">Danh sách sinh viên</h4>
                                        <a href="student"><input type="button" class="btn btn-primary pull-right" value="Thêm mới sinh viên"/></a>
                                        <table class="table table-hover" id="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">Full Name</th>
                                                    <th scope="col">Birthday</th>
                                                    <th scope="col">Code</th>
                                                    <th scope="col">Email</th>
                                                    <th scope="col">Avatar</th>
                                                    <th scope="col">Phone</th>
                                                    <th scope="col">Address</th>
                                                    <th scope="col">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody id="data-container">
                                            </tbody>
                                        </table>
                                        <div id="pagination-container" ></div>

                                        <!--<input onclick='deleteRow()' type='button' value='delete' class='deleteBtn' />-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <%@include file="footer.jsp" %>
                <!--Modal alert-->
                <div class="modal fade" id="modalAlert">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title"></h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal"></button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Modal confirm-->
                <div class="modal fade" id="modalConfirm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel"></h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                            </div>
                            <div class="modal-footer">
                                <button type="button" id="btn-cancel" class="btn btn-secondary" data-dismiss="modal"></button>
                                <button type="button" id="btn-ok" class="btn btn-primary"></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.3.2.1.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.twbsPagination.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/pagination.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/vendor.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/bundle.js"></script>
        <script type="text/javascript">
                            $(document).ready(function () {

                                var total = 0;
                                var pageNum = 0;
                                var record = [];
                                $('#pagination-container').pagination({
                                    dataSource: function (done) {
                                        $.ajax({
                                            type: 'GET',
                                            data: {
                                                page: 1,
                                                rowPerPage: 10,
                                                key: ''
                                            },
                                            async: true,
                                            dataType: 'json',
                                            url: 'student-ajax',
                                            success: function (response) {
                                                total = response.data.total_row;
                                                record = response.data.result;
                                                done(response.data.result);
                                            }
                                        });
                                    },
                                    locator: record,
                                    totalNumber: total,
                                    pageSize: 10,
                                    ajax: {
                                        beforeSend: function () {
                                            dataContainer.html('Loading data server ...');
                                        }
                                    },
                                    callback: function (data, pagination) {
                                        var html = simpleTemplating(data);
                                        $('#data-container').html(html);
                                    }
                                });
                                function simpleTemplating(data) {
                                    var html = '';
                                    $.each(data, function (index, item) {
                                        html += '<tr>';
                                        html += "<td>" + (index + 1) + "</td>";
                                        html += "<td hidden>" + item.id + "</td>";
                                        html += "<td>" + item.name + "</td>";
                                        html += "<td>" + item.birthDay + "</td>";
                                        html += "<td>" + item.code + "</td>";
                                        html += "<td>" + item.email + "</td>";
                                        html += "<td><image style='width: 100px; height:auto' src=" + item.avatar + "/></td>";
                                        html += "<td>" + item.phone + "</td>";
                                        html += "<td>" + item.address + "</td>";
                                        html += "<td><input onclick='deleteRow(this)' type='button' value='delete' class='deleteBtn' /><a href=edit-student?id=" + item.id + "><input type='button' value='edit' /><a></td>";
                                        html += '</tr>';
                                    });
                                    return html;
                                }

                                $('#btnSearch').click(function () {

                                    var keyS = $("input[name=search]").val().trim();
                                    $('#data-container').html("");
                                    $('#pagination-container').pagination({
                                        dataSource: function (done) {
                                            $.ajax({
                                                type: 'GET',
                                                data: {
                                                    page: 1,
                                                    rowPerPage: 10,
                                                    key: keyS
                                                },
                                                async: true,
                                                dataType: 'json',
                                                url: 'student-ajax',
                                                success: function (response) {
                                                    total = response.data.total_row;
                                                    record = response.data.result;
                                                    done(response.data.result);
                                                }
                                            });
                                        },
                                        locator: record,
                                        totalNumber: total,
                                        pageSize: 10,
                                        ajax: {
                                            beforeSend: function () {
                                                dataContainer.html('Loading data server ...');
                                            }
                                        },
                                        callback: function (data, pagination) {
                                            var html = simpleTemplating(data);
                                            $('#data-container').html(html);
                                        }
                                    });
                                    function simpleTemplating(data) {
                                        var html = '';
                                        $.each(data, function (index, item) {
                                            html += '<tr>';
                                            html += "<td>" + (index + 1) + "</td>";
                                            html += "<td hidden>" + item.id + "</td>";
                                            html += "<td>" + item.name + "</td>";
                                            html += "<td>" + item.birthDay + "</td>";
                                            html += "<td>" + item.code + "</td>";
                                            html += "<td>" + item.email + "</td>";
                                            html += "<td><image style='width: 100px; height:auto' src=" + item.avatar + "/></td>";
                                            html += "<td>" + item.phone + "</td>";
                                            html += "<td>" + item.address + "</td>";
                                            html += "<td><input onclick='deleteRow(this)' type='button' value='delete' class='deleteBtn' /><a href=edit-student?id=" + item.id + "><input type='button' value='edit' /><a></td>";
                                            html += '</tr>';
                                        });
                                        return html;
                                    }

                                });

                            });

                            function deleteRow(a) {

//                alert($(a).closest("tr")
//                        .prop('outerHTML')
//                );

                                var arrayRow = $(a).closest("tr")
                                        .html()
                                        .replace('<tr>', '').replace('</tr>', '').replace('<td>', '').replace('</td>', '_')
                                        .replace('<td hidden="">', '').replace('<tr>', '').replace('</tr>', '').replace('<td>', '')
                                        .replace('</td>', '_').replace('<td hidden="">', '').replace('<tr>', '').replace('</tr>', '')
                                        .replace('<td>', '').replace('</td>', '_').replace('<tr>', '').replace('</tr>', '')
                                        .replace('<td>', '').replace('</td>', '_').replace('<tr>', '').replace('</tr>', '')
                                        .replace('<td>', '').replace('</td>', '_').replace('<tr>', '').replace('</tr>', '')
                                        .replace('<td>', '').replace('</td>', '_').replace('<tr>', '').replace('</tr>', '')
                                        .replace('<td>', '').replace('</td>', '_').split('<input onclick="deleteRow(this)" type="button" value="delete" class="deleteBtn">')[0]
                                        .split('_')
                                        ;

                                //Su kien bam nut delete
                                var idModalConfirm = '#modalConfirm';
                                var total = 0;
                                var pageNum = 0;
                                var record = [];

                                var modalConfirm = function (callback) {
                                    $(idModalConfirm + ' .modal-title').html('Lưu ý!');
                                    $(idModalConfirm + ' .modal-body').html('Bạn có chắc chắn xóa sinh viên ' + arrayRow[2] + '-' + arrayRow[4] + ' ?');
                                    $(idModalConfirm + ' #btn-cancel').html('Không');
                                    $(idModalConfirm + ' #btn-ok').html('Có');
                                    $(idModalConfirm).modal('show');
                                    $("#btn-ok").on("click", function () {
                                        callback(true);
                                        $(idModalConfirm).modal('hide');
                                    });
                                };
                                modalConfirm(function (confirm) {
                                    if (confirm) {
                                        $.ajax({
                                            type: 'GET',
                                            data: {
                                                id_student: arrayRow[1]
                                            },
                                            async: true,
                                            dataType: 'json',
                                            url: 'delete-ajax',
                                            success: function (response) {
                                                if (response.status === 1) {
                                                    var keyS = $("input[name=search]").val().trim();
                                                    $('#data-container').html("");
                                                    $('#pagination-container').html("");
                                                    $('#pagination-container').pagination({
                                                        dataSource: function (done) {
                                                            $.ajax({
                                                                type: 'GET',
                                                                data: {
                                                                    page: 1,
                                                                    rowPerPage: 10,
                                                                    key: keyS
                                                                },
                                                                async: true,
                                                                dataType: 'json',
                                                                url: 'student-ajax',
                                                                success: function (response) {
                                                                    total = response.data.total_row;
                                                                    record = response.data.result;
                                                                    done(response.data.result);
                                                                }
                                                            });
                                                        },
                                                        locator: record,
                                                        totalNumber: total,
                                                        pageSize: 10,
                                                        ajax: {
                                                            beforeSend: function () {
                                                                dataContainer.html('Loading data server ...');
                                                            }
                                                        },
                                                        callback: function (data, pagination) {
                                                            var html = simpleTemplating(data);
                                                            $('#data-container').html(html);
                                                        }
                                                    });
                                                    function simpleTemplating(data) {
                                                        var html = '';
                                                        $.each(data, function (index, item) {
                                                            html += '<tr>';
                                                            html += "<td>" + (index + 1) + "</td>";
                                                            html += "<td hidden>" + item.id + "</td>";
                                                            html += "<td>" + item.name + "</td>";
                                                            html += "<td>" + item.birthDay + "</td>";
                                                            html += "<td>" + item.code + "</td>";
                                                            html += "<td>" + item.email + "</td>";
                                                            html += "<td><image style='width: 100px; height:auto' src=" + item.avatar + "/></td>";
                                                            html += "<td>" + item.phone + "</td>";
                                                            html += "<td>" + item.address + "</td>";
                                                            html += "<td><input onclick='deleteRow(this)' type='button' value='delete' class='deleteBtn' /><a href=edit-student?id=" + item.id + "><input type='button' value='edit' /><a></td>";
                                                            html += '</tr>';
                                                        });
                                                        return html;
                                                    }

                                                    return;
                                                } else {

                                                    return;
                                                }

                                            }
                                        });

                                    }
                                });

                                var count = $("#pagination-container").children().length;

                                if (count >= 2) {
                                    var insert = $("#pagination-container :first-child").html();
                                    $('#pagination-container :nth-child(1)').remove();
                                    $('#pagination-container').html(insert);

                                }


                            }

        </script>
    </body>
</html>


