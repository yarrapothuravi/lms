package com.klef.jfsd.springboot.repository;

import com.klef.jfsd.springboot.model.Question;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuestionRepository extends JpaRepository<Question, Long> {
}