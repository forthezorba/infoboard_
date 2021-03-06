package com.example.info.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.info.domain.BoardVO;
import com.example.info.domain.Criteria;
import com.example.info.domain.DashInfo;
import com.example.info.domain.ReplyVO;

@Repository("com.example.info.mapper.BoardMapper")
public interface BoardMapper {
 
	
	public int boardCount() throws Exception;
    
   //답글 목록  
    public List<ReplyVO> replyList() throws Exception;
	
    //게시글 목록  
    public List<BoardVO> boardList() throws Exception;
    public List<BoardVO> boardListWithCri(Criteria cri) throws Exception;
    
    //게시글 상세
    public BoardVO boardDetail(int bno) throws Exception;
    
    //게시글 작성  
    public int boardInsert(BoardVO board) throws Exception;
    //답변
    public int boardReInsert(ReplyVO reply) throws Exception;
    //답변시 원글 업데이트
    public int boardOriginUpdate(BoardVO board) throws Exception;
    //답변 삭제
    public int boardReRemove(int rno) throws Exception;
    //답변 수정
    public int replyModify(ReplyVO reply) throws Exception;
    //답변 디테일
    public ReplyVO replyRead(ReplyVO reply) throws Exception;
    
    //게시글 수정  
    public int boardUpdate(BoardVO board) throws Exception;
    
    //게시글 삭제  
    public int boardDelete(int bno) throws Exception;

    //dash
    public DashInfo dashInfo() throws Exception;

}


