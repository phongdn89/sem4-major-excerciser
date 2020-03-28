<%@page contentType="text/html; charset=utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
        <title>Sign In</title>
        <link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/css/css-login.css" rel="stylesheet" type="text/css">
    </head>

    <body class="app">
        <div id="loader">
            <div class="spinner"></div>
        </div>
        <script>
            window.addEventListener('load', function load() {
                const loader = document.getElementById('loader');
                setTimeout(function () {
                    loader.classList.add('fadeOut');
                }, 300);
            });
        </script>
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
        <div class="peers ai-s fxw-nw h-100vh">
            <div class="d-n@sm- peer peer-greed h-100 pos-r bgr-n bgpX-c bgpY-c bgsz-cv" style="background-image:url(<%=request.getContextPath()%>/image/bg.jpg)">
            </div>
            <div class="col-12 col-md-4 peer pX-40 pY-80 h-100 bgc-white scrollable pos-r" style="min-width:320px">
                <h4 class="fw-300 c-grey-900 mB-40">Login</h4>
                <form action="login" method="POST">
                    <div class="form-group">
                        <label class="text-normal text-dark">Username</label>
                        <input type="username" name="username" class="form-control" placeholder="phongdn">
                    </div>
                    <div class="form-group">
                        <label class="text-normal text-dark">Password</label>
                        <input type="password" name="password" class="form-control" placeholder="Password">
                    </div>
                    <div class="form-group">
                        <div class="peers ai-c jc-sb fxw-nw">
                            <div class="peer">
                                <div class="checkbox checkbox-circle checkbox-info peers ai-c">
                                    <input type="checkbox" id="inputCall1" name="inputCheckboxesCall" class="peer">
                                    <label for="inputCall1" class="peers peer-greed js-sb ai-c"><span class="peer peer-greed">Remember Me</span></label>
                                </div>
                            </div>
                            <div class="peer">
                                <button class="btn btn-primary">Login</button>
                            </div>
                        </div>
                    </div>
                </form>
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
        </div>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.3.2.1.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.twbsPagination.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/pagination.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/vendor.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/bundle.js"></script>
    </body>

</html>