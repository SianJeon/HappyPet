package com.happypet.animal.Repository;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class AnimalDao {

	@Autowired
	SqlSession sqlSession;
	

	
	
}
