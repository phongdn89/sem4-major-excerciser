/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.phong.sem4.m3demoservlet.controller;

import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;
import com.phong.sem4.m3demoservlet.dao.StudentDao;
import com.phong.sem4.m3demoservlet.dao.StudentDaoImpl;
import com.phong.sem4.m3demoservlet.entity.Student;
import com.phong.sem4.m3demoservlet.entity.User;
import com.phong.sem4.m3demoservlet.model.RequestFormStudent;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author nguoi
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    StudentDao dao = new StudentDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession();
            User userSession = (User) session.getAttribute("session");
            if (userSession == null) {
                response.sendRedirect("login");
                return;
            }
            String stdId = request.getParameter("id");
            int idNum = Integer.parseInt(stdId);
            Student findStudent = dao.findStudent(idNum);

            if (findStudent != null) {
                request.setAttribute("stdEdit", findStudent);
                request.getRequestDispatcher("/edit-student.jsp").forward(request, response);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("err", true);
            request.setAttribute("msg", "Edit student fail!");
            request.getRequestDispatcher("/list-student.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        RequestFormStudent form = new RequestFormStudent();
        form.setId(request.getParameter("_id").trim());
        form.setName(request.getParameter("name").trim());
        form.setCode(request.getParameter("code").trim());
        form.setAddress(request.getParameter("address").trim());
        form.setBirthDay(request.getParameter("birthday").trim());
        form.setEmail(request.getParameter("email").trim());
        form.setPhone(request.getParameter("phone").trim());
        System.out.println(form);

        String folderUpload = "upload";

        Part part = request.getPart("avatar");
        try {
            int idStd = Integer.parseInt(form.getId());

            String msg = validateRequestParams(form);
            String msgFile = validateRequestFile(part, 1024 * 1024 * 2);

            String responseMsg = String.join("", msg, msgFile);

            if (responseMsg.length() != 0) {
                System.out.println("Co loi " + responseMsg);
//                String message = "hello";
                request.setAttribute("err", true);
                request.setAttribute("msg", responseMsg);
                request.setAttribute("errReq", form);

                request.getRequestDispatcher("/edit-student.jsp").forward(request, response);
                return;
            }
            String fileName = "";
            String realFileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            fileName = form.getCode() + "_" + realFileName;

            if (realFileName != null && !realFileName.equals("")) {

                String pathAppRuntime = this.getClass().getClassLoader().getResource("").getPath();
                String fullPath = pathAppRuntime;
                String pathArr[] = fullPath.split("/WEB-INF/classes/");
                String folderName = pathArr[0].trim() + File.separator + folderUpload;

                File file = new File(folderName);
                if (!file.exists()) {
                    file.mkdirs();
                }

                part.write(folderName + File.separator + fileName);
            }

            Student s = dao.findStudent(idStd);

            if (s != null) {

                String startDateString = form.getBirthDay();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
                DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                String stringBirth = LocalDate.parse(startDateString, formatter).format(formatter2);

                s.setBirthDay(new Timestamp(new SimpleDateFormat("yyyy-MM-dd").parse(stringBirth).getTime()));
                s.setAddress(form.getAddress());
                if (realFileName != null && !realFileName.equals("")) {
                    s.setAvatar(folderUpload + "/" + fileName);
                }
                s.setName(form.getName());
                s.setPhone(form.getPhone());
                s.setCode(form.getCode());
                s.setEmail(form.getEmail());

                dao.editStudent(s);
            }

            response.sendRedirect("list-student");
        } catch (MySQLIntegrityConstraintViolationException e) {
            System.out.println("Vao day MySQLIntegrityConstraintViolationException");
            e.printStackTrace();
            request.setAttribute("err", true);
            request.setAttribute("msg", "Student code is exists!");
            request.setAttribute("errReq", form);

            request.getRequestDispatcher("/edit-student.jsp").forward(request, response);
            return;
        } catch (FileNotFoundException e) {
            System.out.println("Vao day FileNotFoundException");
            e.printStackTrace();
            request.setAttribute("err", true);
            request.setAttribute("msg", "An error occurred, try again!");
            request.setAttribute("errReq", form);

            request.getRequestDispatcher("/edit-student.jsp").forward(request, response);
            return;
        } catch (Exception e) {
            System.out.println("Vao day Exception");
            e.printStackTrace();
            request.setAttribute("err", true);
            request.setAttribute("msg", "An error occurred, try again!");
            request.setAttribute("errReq", form);

            request.getRequestDispatcher("/edit-student.jsp").forward(request, response);
            return;
        }

    }

    private static String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1); // MSIE fix.
            }
        }
        return null;
    }

    private String validateRequestParams(RequestFormStudent request) {
        StringBuilder msg = new StringBuilder("");
        if (checkStringEmpty(request.getName())) {
            msg.append("Full name is empty!");
        }
        if (checkStringEmpty(request.getCode())) {
            msg.append("<br/>Code student is empty!");
        }
        if (checkStringEmpty(request.getBirthDay())) {
            msg.append("<br/>Birth date student is empty!");
        } else if (!isValidDateddMMyyyy(request.getBirthDay())) {
            msg.append("<br/>Birth date format invalid!");
        } else if (Integer.parseInt(request.getBirthDay().split("/")[2].trim()) >= Calendar.getInstance().get(Calendar.YEAR)) {
            msg.append("<br/>Birth year invalid!");
        }
        if (checkStringEmpty(request.getAddress())) {
            msg.append("<br/>Address student is empty!");
        }
        if (!request.getPhone().matches("\\d{10,12}")) {
            msg.append("<br/>Phone number format invalid!");
        }

        return msg.toString();
    }

    private String validateRequestFile(Part part, long maxSize) throws IOException, ServletException {
        StringBuilder msg = new StringBuilder("");
        if (part != null) {
            System.out.println("part ko null");
            if (part.getSize() > maxSize) {
                msg.append("<br/>File size cound not more than 2MB!");
            }
//            if (part == null) {
//                msg.append("<br/>File not found!");
//            }
            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            if (!(fileName.endsWith(".jpg") || fileName.endsWith(".JPG")
                    || fileName.endsWith(".png") || fileName.endsWith(".PNG"))) {
                msg.append("<br/>File format is't image !");
            }

            return "";
        }
        System.out.println("part null");
        return msg.toString();
    }

    private boolean checkStringEmpty(String name) {
        return name.isEmpty() || name.equals("") || name == null;
    }

    public boolean isValidDateddMMyyyy(String dateStr) {
        DateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        sdf.setLenient(false);
        try {
            sdf.parse(dateStr);
        } catch (ParseException e) {
            return false;
        }
        return true;
    }

}
