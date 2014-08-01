package com.gtao.dao;

import java.util.List;

/**
 * Created by root on 14-7-31.
 */
public interface SwitchDAO {
    public <T> void save(T t);
    public <T> void delete(T t);
    public <T> void delete(Class<T> entityClass, Integer id);
    public <T> void update(T t);
    public <T> T get(Class<T> entityClass, Integer id);
    public <T> List<T> findAll(String hql, Class<T> entityClass);
    public <T> List<T> findAll(String hql, Class<T> entityClass,Object param);
    public <T> List<T> findAll(String hql, Class<T> entityClass,Object[] params);
    public <T> List<T> nativeFindAll(String sql, Class<T> entityClass);
    public <T> List<T> nativeFindAll(String sql, Class<T> entityClass,Object param);
    public <T> List<T> nativeFindAll(String sql, Class<T> entityClass,Object[] param);
    public <T> List<T> findByPage(final String hql, final Class<T> entityClass, final int firstResult, final int maxResult);
    public <T> List<T> findByPage(final String hql, final Class<T> entityClass, final Object param, final int firstResult,final int maxResult);
    public <T> List<T> findByPage(final String hql, final Class<T> entityClass, final Object[] params,final int firstResult, final int maxResult);
}
