package Inteface;

import java.util.List;

public interface GenericDAO <T, IdType> {
    List<T> findAll();
    T findById(IdType id);
    void create(T entity);
    void update(T entity);
    void deleteById(IdType id);
}