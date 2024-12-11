package com.klef.jfsd.springboot.services;

import com.klef.jfsd.springboot.model.Quiz;

import java.util.List;

public interface QuizService {
    Quiz createQuiz(Quiz quiz);
    List<Quiz> getAllQuizzes();
    Quiz getQuizById(Long id);
    void deleteQuiz(Long id);
}