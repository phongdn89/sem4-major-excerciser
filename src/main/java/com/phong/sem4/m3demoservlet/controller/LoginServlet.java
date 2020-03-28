/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.phong.sem4.m3demoservlet.controller;

import com.phong.sem4.m3demoservlet.controller.utils.CommonUtils;
import com.phong.sem4.m3demoservlet.dao.UserDao;
import com.phong.sem4.m3demoservlet.dao.UserDaoImpl;
import com.phong.sem4.m3demoservlet.entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserDao dao = new UserDaoImpl();
        String validate = validateRequestParams(request);

        if (validate.length() != 0) {

            request.setAttribute("err", true);
            request.setAttribute("msg", validate);
            request.setAttribute("errReq", request.getParameter("username"));

            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        try {
//            String passEncrypted = CommonUtils.generatePassword(password, CommonUtils.getSalt());
            String passEncrypted = CommonUtils.generatePassword(password);
            User u = dao.validateUser(username, passEncrypted);

            if (u != null) {
                HttpSession session = request.getSession();
                session.setAttribute("session", u);
                response.sendRedirect("list-student");
                return;
            }
        } catch (NoSuchAlgorithmException e) {

            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();

            request.setAttribute("err", true);
            request.setAttribute("msg", "Login fail, please check username or password");
            request.setAttribute("errReq", "");

            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }

    }

    private String validateRequestParams(HttpServletRequest request) {
        StringBuilder msg = new StringBuilder("");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (CommonUtils.checkStringEmpty(username)) {
            msg.append("Usernname is empty!");
        }

        if (CommonUtils.checkStringEmpty(password)) {
            msg.append("<br/>Password is empty!");
        }

        return msg.toString();
    }

}
