package com.khsdc.repository;
import com.khsdc.model.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public interface UserRepository extends CrudRepository<User, Long>{

    User findByUsername(String username);

    List<User> findByName(String name);
}
