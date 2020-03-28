/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.phong.sem4.m3demoservlet.dao;

import com.phong.sem4.m3demoservlet.entity.User;
import java.util.List;

/**
 *
 * @author nguoi
 */
public interface UserDao {

    void saveUser(User u) throws Exception;

    void deleteUser(User u) throws Exception;

    User findUser(Object id) throws Exception;

    void editUser(User u) throws Exception;

    List<User> listAllUser() throws Exception;

    int count() throws Exception;

    public User validateUser(String username, String passEncrypted) throws Exception;

}
