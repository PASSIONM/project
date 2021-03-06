package com.kte.project.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kte.project.VO.CustomVO;
import com.kte.project.VO.ReservationVO;

@Service
public class adminDAO {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql = null;
	
	public int usercount() {
		return sql.selectOne("admin.UserCount");
	}

	public int today() {
		return sql.selectOne("admin.today");
	}
	public int yesterday() {
		return sql.selectOne("admin.yesterday");
	}
	
	public int block_chk(String id) {
		return sql.selectOne("admin.block_chk",id);
	}
	


}	
