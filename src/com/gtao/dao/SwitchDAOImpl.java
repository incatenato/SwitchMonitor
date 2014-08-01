package com.gtao.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.util.List;

/**
 * Created by root on 14-7-31.
 */
public class SwitchDAOImpl implements SwitchDAO {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getSession(){
        return sessionFactory.getCurrentSession();
    }

    @Override
    public <T> void save(T t) {
        getSession().save(t);
    }

    @Override
    public <T> void delete(T t) {
        getSession().delete(t);
    }

    @Override
    public <T> void delete(Class<T> entityClass, Integer id) {
        getSession().delete(get(entityClass,id));
    }

    @Override
    public <T> void update(T t) {
        getSession().update(t);
    }

    @Override
    public <T> T get(Class<T> entityClass, Integer id) {
        return (T)getSession().get(entityClass,id);
    }

    @Override
    public <T> List<T> nativeFindAll(String sql, Class<T> entityClass) {
        return nativeFindAll(sql,entityClass,new Object[]{});
    }

    @Override
    public <T> List<T> nativeFindAll(String sql, Class<T> entityClass, Object param) {
        return nativeFindAll(sql,entityClass,new Object[]{param});
    }

    @Override
    public <T> List<T> nativeFindAll(String sql, Class<T> entityClass, Object[] param) {
        Query query = getSession().createSQLQuery(sql).addEntity(entityClass);
        for(int i=0;i<param.length;i++){
            query.setParameter(i,param[i]);
        }
        return (List<T>)query.list();
    }

    @Override
    public <T> List<T> findAll(String hql, Class<T> entityClass) {
        return findAll(hql,entityClass,new Object[]{});
    }

    @Override
    public <T> List<T> findAll(String hql, Class<T> entityClass, Object param) {
        return findAll(hql,entityClass,new Object[]{param});
    }

    @Override
    public <T> List<T> findAll(String hql, Class<T> entityClass, Object[] params) {
        Query query = getSession().createQuery(hql);
        for (int i = 0; i < params.length; i++) {
            query.setParameter(i, params[i]);
        }
        return (List<T>) query.list();
    }

    @Override
    public <T> List<T> findByPage(String hql, Class<T> entityClass, int firstResult, int maxResult) {
        return findByPage(hql, entityClass, new Object[] {}, firstResult,
                maxResult);
    }

    @Override
    public <T> List<T> findByPage(String hql, Class<T> entityClass, Object param, int firstResult, int maxResult) {
        return findByPage(hql, entityClass, new Object[] { param },
                firstResult, maxResult);
    }

    @Override
    public <T> List<T> findByPage(String hql, Class<T> entityClass, Object[] params, int firstResult, int maxResult) {
        Query query = getSession().createQuery(hql);
        for (int i = 0; i < params.length; i++) {
            query.setParameter(i, params[i]);
        }
        query.setFirstResult(firstResult);
        query.setMaxResults(maxResult);
        return (List<T>) query.list();
    }
}
