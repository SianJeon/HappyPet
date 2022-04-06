package com.happypet.animal.Repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.happypet.animal.Entity.AccountVo;

@Repository
public class AccountDao {
	
	@Autowired
	SqlSession ss;
	
	public int insertAccount(AccountVo vo) {
		return ss.insert("account.insertOne", vo);
	}
	
	public String selectPassById(String id) {
		return ss.selectOne("account.selectPassById", id);
	}
	
	public AccountVo selectOneById(String id) {
		return ss.selectOne("account.selectOneById", id);
	}
	
	public int updateOne(AccountVo vo) {
		return ss.update("account.updateOne", vo);
	}
	
	public int idCheck(String id) {
        int cnt = ss.selectOne("account.idCheck", id);
        return cnt;
    }
	
	public void deleteId(String id) {
		ss.update("account.deleteOne", id);
	}
}
