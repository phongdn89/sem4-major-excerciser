<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html; charset=utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
        <title>Thêm sinh viên</title>
        <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/css/customize.css" rel="stylesheet" type="text/css">
    </head>
    <body class="app">
        <%@include file="loading.jsp" %>

        <div>
            <div class="page-container">
                <!--<div class="masonry-item col-md-6" style="position: absolute; left: 50%; top: 0px;">-->
                <div class="bgc-white p-20 bd">
                    <h6 class="c-grey-900">Thêm mới sinh viên</h6>
                    <div class="col-md-12 ">
                        <c:if test="${err}">
                            <div style="color: red">
                                <script>
                                    window.addEventListener("load", function () {
                                        popupNotify('Lỗi nhập form', "${msg}", 'Đóng');
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
                    <div class="mT-30">
                        <form action="student" enctype="multipart/form-data" method="POST">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="name">Họ tên</label>
                                    <input type="text" <c:if test="${err}"> value="${errReq.name}"</c:if> name="name" class="form-control" id="name" placeholder="Họ và tên">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="code">Mã sinh viên</label>
                                        <input type="text" <c:if test="${err}"> value="${errReq.code}"</c:if> name="code" class="form-control" id="code" placeholder="Mã sinh viên">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputAddress">Address</label>
                                    <input type="text" <c:if test="${err}"> value="${errReq.address}"</c:if> name="address" class="form-control" id="inputAddress" placeholder="vd Số 15 Nguyễn Khánh Toàn - Quan Hoa - Hà Nội ">
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="email">Email</label>
                                        <input type="email" <c:if test="${err}"> value="${errReq.email}"</c:if> name="email" class="form-control" id="email">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="inputState">Avatar</label>
                                        <input type="file" name="avatar" class="form-control" id="avatar" placeholder="avatar">
                                    </div>
                                    <div class="form-group col-md-2">
                                        <label for="phone">Phone</label>
                                        <input type="text" <c:if test="${err}"> value="${errReq.phone}"</c:if> name="phone" class="form-control" id="phone" placeholder="sđt">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label class="fw-500">Birthdate</label>
                                        <div class="timepicker-input input-icon form-group">
                                            <div class="input-group">
                                                <!--                                                <div class="input-group-addon bgc-white bd bdwR-0">
                                                                                                    <i class="ti-calendar"></i>
                                                                                                </div>-->
                                                <input type="text" <c:if test="${err}"> value="${errReq.birthDay}"</c:if> name="birthday" class="form-control bdc-grey-200 start-date" placeholder="Chọn ngày tháng" data-provide="datepicker">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <input type="submit" value="Thêm mới" class="btn btn-primary"/>
                                <a href="list-student"><input type="button" value="Trở lại" class="btn btn-info"/></a>
                            </form>
                        </div>
                    </div>
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
                <%@include file="footer.jsp" %>
            </div>
        </div>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.3.2.1.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/vendor.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/bundle.js"></script>
    </body>
    <script type="text/javascript">
                                    $(document).ready(function () {


                                        var idModalAlert = '#modalAlert';
                                        //Ham trut du lieu vao modal
                                        function popupNotify(title, body, btnClose) {
                                            $(idModalAlert + ' .modal-title').html(title);
                                            $(idModalAlert + ' .modal-body').html(body);
                                            $(idModalAlert + ' .btn-secondary').html(btnClose);
                                            $(idModalAlert).modal('show');
                                        }

                                    });

    </script>
</html>


