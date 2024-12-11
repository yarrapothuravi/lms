package com.klef.jfsd.springboot.repository;

import com.klef.jfsd.springboot.model.Quiz;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuizRepository extends JpaRepository<Quiz, Long> {

}
