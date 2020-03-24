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
import com.phong.sem4.m3demoservlet.model.ResponseRest;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nguoi
 */
public class DeleteAjaxServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {

        Gson g = new Gson();
        StudentDao dao = new StudentDaoImpl();
        try {
            String idParam = request.getParameter("id_student");
            String tParam = request.getParameter("dmmay:");
            System.out.println(tParam + "===============");
            int id = Integer.parseInt(idParam);
            Student findStudent = dao.findStudent(id);

            dao.deleteStudent(findStudent);
            ResponseRest responseRest = new ResponseRest(1, 200, "Delete Success", "");

            resp.getWriter().write(g.toJson(responseRest, ResponseRest.class));
        } catch (Exception ex) {
            ex.printStackTrace();
            ResponseRest responseRest = new ResponseRest(0, 500, "Delete fail", "");

            resp.getWriter().write(g.toJson(responseRest, ResponseRest.class));

        }

    }

}
