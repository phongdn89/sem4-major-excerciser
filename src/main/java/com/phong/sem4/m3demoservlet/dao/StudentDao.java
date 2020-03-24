/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.phong.sem4.m3demoservlet.dao;

import com.phong.sem4.m3demoservlet.entity.Student;
import java.util.List;

/**
 *
 * @author nguoi
 */
public interface StudentDao {

    void saveStudent(Student s) throws Exception;

    void deleteStudent(Student s) throws Exception;

    Student findStudent(Object id) throws Exception;

    Student findStudentByCode(String code) throws Exception;

    void editStudent(Student s) throws Exception;

    List<Student> listAllStudent() throws Exception;

    int count() throws Exception;

    List<Student> searchByKey(String key) throws Exception;

    List<Student> listAllStudentPerPage(String key, int rowPerPage, int page) throws Exception;

    int countAllStudentPerPage(String key, int rowPerPage, int page) throws Exception;

}
