<div class="header navbar">
    <div class="header-container">
        <div class="nav-left" style="padding-top: 20px">
            <form>
                <div class="form-group col-md-10" style="float: left">
                    <input type="text" name="search" class="form-control" id="search" placeholder="Tìm kiếm sinh viên">
                </div>
                <div class="col-md-2" style="float: left">
                    <input id="btnSearch"  type="button" class="btn btn-primary" value="Search"/>
                </div>
            </form>
        </div>
        <ul class="nav-right">
            <li id="click-dropdown" class="dropdown">
                <a id="a-true" href="" class="dropdown-toggle no-after peers fxw-nw ai-c lh-1" data-toggle="dropdown">
                    <div class="peer mR-10"><img class="w-2r bdrs-50p" src="https://randomuser.me/api/portraits/men/10.jpg" alt=""></div>
                    <div class="peer"><span class="fsz-sm c-grey-900">John Doe</span></div>
                </a>
                <ul id="logout" class="dropdown-menu fsz-sm">
                    <li><a href="" class="d-b td-n pY-5 bgcH-grey-100 c-grey-700"><i class="ti-settings mR-10"></i> <span>Setting</span></a></li>
                    <li><a href="" class="d-b td-n pY-5 bgcH-grey-100 c-grey-700"><i class="ti-user mR-10"></i> <span>Profile</span></a></li>
                    <li><a href="email.html" class="d-b td-n pY-5 bgcH-grey-100 c-grey-700"><i class="ti-email mR-10"></i> <span>Messages</span></a></li>
                    <li role="separator" class="divider"></li>
                    <li><a href="<%=request.getContextPath()%>/logout" class="d-b td-n pY-5 bgcH-grey-100 c-grey-700"><i class="ti-power-off mR-10"></i> <span>Logout</span></a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>