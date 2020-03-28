/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.phong.sem4.m3demoservlet.dao;

import com.phong.sem4.m3demoservlet.entity.User;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

/**
 *
 * @author nguoi
 */
public class UserDaoImpl implements UserDao {

    EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();

    @Override
    public void saveUser(User u) throws Exception {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(u);
            transaction.commit();
            entityManager.clear();
        } catch (Exception ex) {
            ex.printStackTrace();
            transaction.rollback();
            entityManager.clear();
        }
    }

    @Override
    public void deleteUser(User u) throws Exception {

        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.remove(u);
            transaction.commit();
        } catch (Exception ex) {
            ex.printStackTrace();
            transaction.rollback();
        }
    }

    @Override
    public User findUser(Object id) throws Exception {
        try {
            return entityManager.find(User.class, id);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public void editUser(User u) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<User> listAllUser() throws Exception {
        CriteriaQuery cq = entityManager.getCriteriaBuilder().createQuery();
        cq.select(cq.from(User.class));
        cq.orderBy(entityManager.getCriteriaBuilder().desc(cq.from(User.class).get("id")));
        return entityManager.createQuery(cq).getResultList();
    }

    @Override
    public int count() throws Exception {
        CriteriaQuery cq = entityManager.getCriteriaBuilder().createQuery();
        Root<User> rt = cq.from(User.class);
        cq.select(entityManager.getCriteriaBuilder().count(rt));
        Query q = entityManager.createQuery(cq);
        return ((Long) q.getSingleResult()).intValue();
    }

    @Override
    public User validateUser(String username, String passEncrypted) throws Exception {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<User> cr = cb.createQuery(User.class);

        Root<User> root = cr.from(User.class);

        Predicate[] conditions = {
            cb.and(cb.equal(root.get("username"), username),
            cb.equal(root.get("password"), passEncrypted)
            )
        };
        cr.where(conditions);

        Query query = entityManager.createQuery(cr);
        List<User> resultList = query.getResultList();
        return resultList.get(0);
    }

//        @Override
//    public Student findStudentByCode(String code) throws Exception {
//        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
//        CriteriaQuery<Student> cr = cb.createQuery(Student.class);
//
//        Root<Student> root = cr.from(Student.class);
//
//        Predicate[] conditions = {
//            cb.equal(root.<String>get("code"), code)
//
//        };
//        cr.where(conditions);
//
//        Query query = entityManager.createQuery(cr);
//        List<Student> resultList = query.getResultList();
//        return resultList.get(0);
//    }
}
