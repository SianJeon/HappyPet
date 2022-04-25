package com.happypet.animal.Service.MarketService.Comment;

import com.happypet.animal.Repository.MarketRepository.Comment.MarketCommentDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MarketCommentService {

    @Autowired
    MarketCommentDAO marketCommentDAO;
}
