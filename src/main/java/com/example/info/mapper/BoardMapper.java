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
    
   //��� ���  
    public List<ReplyVO> replyList() throws Exception;
	
    //�Խñ� ���  
    public List<BoardVO> boardList() throws Exception;
    public List<BoardVO> boardListWithCri(Criteria cri) throws Exception;
    
    //�Խñ� ��
    public BoardVO boardDetail(int bno) throws Exception;
    
    //�Խñ� �ۼ�  
    public int boardInsert(BoardVO board) throws Exception;
    //�亯
    public int boardReInsert(ReplyVO reply) throws Exception;
    //�亯�� ���� ������Ʈ
    public int boardOriginUpdate(BoardVO board) throws Exception;
    //�亯 ����
    public int boardReRemove(int rno) throws Exception;
    //�亯 ����
    public int replyModify(ReplyVO reply) throws Exception;
    //�亯 ������
    public ReplyVO replyRead(ReplyVO reply) throws Exception;
    
    //�Խñ� ����  
    public int boardUpdate(BoardVO board) throws Exception;
    
    //�Խñ� ����  
    public int boardDelete(int bno) throws Exception;

    //dash
    public DashInfo dashInfo() throws Exception;

}


