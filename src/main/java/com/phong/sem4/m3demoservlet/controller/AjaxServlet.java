/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.phong.sem4.m3demoservlet.controller;

import com.google.gson.Gson;
import com.phong.sem4.m3demoservlet.dao.StudentDao;
import com.phong.sem4.m3demoservlet.dao.StudentDaoImpl;
import com.phong.sem4.m3demoservlet.entity.Student;
import com.phong.sem4.m3demoservlet.entity.User;
import com.phong.sem4.m3demoservlet.model.ResponseRest;
import com.phong.sem4.m3demoservlet.model.ResponseRestStudent;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nguoi
 */
public class AjaxServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Gson g = new Gson();
        try {
            HttpSession session = request.getSession();
            User userSession = (User) session.getAttribute("session");
            if (userSession == null) {
                response.sendRedirect("login");
                return;
            }
            String pageParam = request.getParameter("page");
            String rowPerPageParam = request.getParameter("rowPerPage");
            String key = request.getParameter("key");

            int page;
            int rowPerPage;
            if (pageParam.equals("") || pageParam == null) {
                page = 1;
            } else {
                page = Integer.parseInt(pageParam);
            }

            if (rowPerPageParam.equals("") || rowPerPageParam == null) {
                rowPerPage = 10;
            } else {
                rowPerPage = Integer.parseInt(rowPerPageParam);
            }

            StudentDao dao = new StudentDaoImpl();
            List<Student> listAllStudent = dao.listAllStudentPerPage(key, rowPerPage, page);
//            int totalRow = dao.countAllStudentPerPage(key, rowPerPage, page);
            int totalRow = listAllStudent.size();

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            ResponseRestStudent rrs = new ResponseRestStudent(totalRow, listAllStudent);
            ResponseRest responseRest = new ResponseRest(1, 200, "Success", rrs);

            response.getWriter().write(g.toJson(responseRest, ResponseRest.class));
        } catch (Exception ex) {
            ex.printStackTrace();
            ResponseRest responseRest = new ResponseRest(0, 500, "fail", "");

            response.getWriter().write(g.toJson(responseRest, ResponseRest.class));
        }
    }

//    @Override
//    protected void doDelete(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
//
//        Gson g = new Gson();
//        StudentDao dao = new StudentDaoImpl();
//        try {
//            String idParam = request.getParameter("id_student");
//            String tParam = request.getParameter("dmmay:");
//            System.out.println(tParam + "===============");
//            int id = Integer.parseInt(idParam);
//            Student findStudent = dao.findStudent(id);
//
//            dao.deleteStudent(findStudent);
//            ResponseRest responseRest = new ResponseRest(1, 200, "Delete Success", "");
//
//            resp.getWriter().write(g.toJson(responseRest, ResponseRest.class));
//        } catch (Exception ex) {
//            ex.printStackTrace();
//            ResponseRest responseRest = new ResponseRest(0, 500, "Delete fail", "");
//
//            resp.getWriter().write(g.toJson(responseRest, ResponseRest.class));
//
//        }
//
//    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
