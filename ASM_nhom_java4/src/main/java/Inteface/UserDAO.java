package Inteface;

import Model.User;

public interface UserDAO extends GenericDAO<User, String> {

	 public User login(String email, String password);

}
