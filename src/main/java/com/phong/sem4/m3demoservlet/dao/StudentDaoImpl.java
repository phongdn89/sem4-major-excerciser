/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.phong.sem4.m3demoservlet.dao;

import com.phong.sem4.m3demoservlet.entity.Student;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.criteria.CriteriaQuery;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

/**
 * @author nguoi
 */
public class StudentDaoImpl implements StudentDao {

    EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();

    public void saveStudent(Student s) throws Exception {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(s);
            transaction.commit();
            entityManager.clear();
        } catch (Exception ex) {
            ex.printStackTrace();
            transaction.rollback();
            entityManager.clear();
        }

    }

    public List<Student> listAllStudent() throws Exception {
        CriteriaQuery cq = entityManager.getCriteriaBuilder().createQuery();
        cq.select(cq.from(Student.class));
        return entityManager.createQuery(cq).getResultList();
    }

    @Override
    public int count() throws Exception {
        CriteriaQuery cq = entityManager.getCriteriaBuilder().createQuery();
        Root<Student> rt = cq.from(Student.class);
        cq.select(entityManager.getCriteriaBuilder().count(rt));
        Query q = entityManager.createQuery(cq);
        return ((Long) q.getSingleResult()).intValue();
    }

    @Override
    public List<Student> searchByKey(String key) throws Exception {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<Student> cr = cb.createQuery(Student.class);

        Root<Student> root = cr.from(Student.class);

        Predicate[] conditions = {
            cb.or(cb.like(root.<String>get("code"), key),
            cb.like(root.<String>get("name"), key))
        };
        cr.where(conditions);

        Query query = entityManager.createQuery(cr);
        List<Student> resultList = query.getResultList();
        return resultList;
    }
//
//    @Override
//    public List<Student> listAllStudentPerPage(String key, int rowPerPage, int page) throws Exception {
//        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
//        CriteriaQuery<Student> cr = cb.createQuery(Student.class);
//
//        Root<Student> root = cr.from(Student.class);
//
//        Predicate[] conditions = {
//            cb.or(cb.like(root.<String>get("code"), "%" + key + "%"),
//            cb.like(root.<String>get("name"), "%" + key + "%"),
//            cb.like(root.<String>get("address"), "%" + key + "%"))
//        };
//        cr.where(conditions);
//
//        Query query = entityManager.createQuery(cr);
//        List<Student> resultList = query
//                .setFirstResult((page - 1) * rowPerPage)
//                .setMaxResults(rowPerPage)
//                .getResultList();
//        return resultList;
//    }
//
//    @Override
//    public int countAllStudentPerPage(String key, int rowPerPage, int page) throws Exception {
//        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
//        CriteriaQuery<Student> cr = cb.createQuery(Student.class);
//
//        Root<Student> root = cr.from(Student.class);
//
//        Predicate[] conditions = {
//            cb.or(cb.like(root.<String>get("code"), key),
//            cb.like(root.<String>get("name"), key))
//        };
//        cr.where(conditions);
//
//        Query query = entityManager.createQuery(cr);
//        return ((Integer) query
//                .setFirstResult((page - 1) * rowPerPage)
//                .setMaxResults(rowPerPage)
//                .getSingleResult());
//    }

    @Override
    public List<Student> listAllStudentPerPage(String key, int rowPerPage, int page) throws Exception {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<Student> cr = cb.createQuery(Student.class);

        Root<Student> root = cr.from(Student.class);

        Predicate[] conditions = {
            cb.or(cb.like(root.<String>get("code"), "%" + key + "%"),
            cb.like(root.<String>get("name"), "%" + key + "%"),
            cb.like(root.<String>get("address"), "%" + key + "%"))
        };
        cr.where(conditions);

        Query query = entityManager.createQuery(cr);
        List<Student> resultList = query
                .getResultList();
        return resultList;
    }

    @Override
    public int countAllStudentPerPage(String key, int rowPerPage, int page) throws Exception {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<Student> cr = cb.createQuery(Student.class);

        Root<Student> root = cr.from(Student.class);

        Predicate[] conditions = {
            cb.or(cb.like(root.<String>get("code"), key),
            cb.like(root.<String>get("name"), key),
            cb.like(root.<String>get("address"), key))
        };
        cr.where(conditions);

        Query query = entityManager.createQuery(cr);
        return ((Integer) query
                .getSingleResult());
    }

    @Override
    public void deleteStudent(Student s) throws Exception {

        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.remove(s);
            transaction.commit();
        } catch (Exception ex) {
            ex.printStackTrace();
            transaction.rollback();
        }
    }

    @Override
    public void editStudent(Student s) throws Exception {

        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.merge(s);
            transaction.commit();
        } catch (Exception ex) {
            ex.printStackTrace();
            transaction.rollback();
        }
    }

    @Override
    public Student findStudent(Object id) throws Exception {
        try {
            return entityManager.find(Student.class, id);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Student findStudentByCode(String code) throws Exception {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<Student> cr = cb.createQuery(Student.class);

        Root<Student> root = cr.from(Student.class);

        Predicate[] conditions = {
            cb.equal(root.<String>get("code"), code)

        };
        cr.where(conditions);

        Query query = entityManager.createQuery(cr);
        List<Student> resultList = query.getResultList();
        return resultList.get(0);
    }

}
