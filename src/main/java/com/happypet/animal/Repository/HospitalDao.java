package com.happypet.animal.Repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.happypet.animal.Entity.HospitalVo;


@Repository
public class HospitalDao {
	@Autowired
	SqlSession ss;
	
	public int insertData(HospitalVo vo) {
		return ss.insert("hospital.insertOne", vo);
	}
	
	public HospitalVo findDataByNo(int no) {
		return ss.selectOne("hospital.findDataByNo", no);
	}
}
