/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.phong.sem4.m3demoservlet.controller;

import com.phong.sem4.m3demoservlet.entity.Student;
import com.phong.sem4.m3demoservlet.dao.StudentDao;
import com.phong.sem4.m3demoservlet.dao.StudentDaoImpl;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nguoi
 */
public class ListStudentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        StudentDao dao = new StudentDaoImpl();
        try {
            List<Student> listAllStudent = dao.listAllStudent();
            request.setAttribute("users", listAllStudent);
            request.getRequestDispatcher("list-student.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ListStudentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
