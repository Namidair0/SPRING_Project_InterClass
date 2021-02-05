package com.spring.proj.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.spring.proj.domain.MemberVO;

public interface MemberService {
	
	//1. 회원가입
	public void register(MemberVO vo);
	
	//2. 회원삭제(탈퇴)
	public void unregister(MemberVO vo);
	
	//3. 회원전체목록
	public List<MemberVO> getAllUsers();
	
	//4. 회원상세정보
	public MemberVO getOneUser(String mId);
	
	//5. 회원정보수정
	public void modifyInfo(MemberVO vo);
	
	//6. 로그인
	public MemberVO login(MemberVO vo);

	//7. 아이디 찾기
	public String findId(HttpServletResponse response, String email) throws Exception;
	
	//8. 비밀번호 찾기
	public String findPwd(HttpServletResponse response, String id) throws Exception;
	
}