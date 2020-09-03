package com.example.info.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.info.domain.BoardVO;
import com.example.info.domain.Criteria;
import com.example.info.domain.DashInfo;
import com.example.info.domain.ReplyVO;
import com.example.info.mapper.BoardMapper;

import lombok.Setter;

@Service("com.example.info.service.BoardService")
public class BoardService {
	@Setter(onMethod_=@Autowired)
    BoardMapper mBoardMapper;
    
    public int boardCount() throws Exception{
    	return mBoardMapper.boardCount();
    }
    
    public List<BoardVO> boardListService() throws Exception{
        
        return mBoardMapper.boardList();
    }
    
   
    
    public List<BoardVO> boardListServiceWithCri(Criteria cri) throws Exception{
    	return mBoardMapper.boardListWithCri(cri);
    }
    
    public BoardVO boardDetailService(int bno) throws Exception{
        
        return mBoardMapper.boardDetail(bno);
    }
    
    public int boardInsertService(BoardVO board) throws Exception{
        
        return mBoardMapper.boardInsert(board);
    }
    
    
    
    
    
    public List<ReplyVO> replyListService() throws Exception{
    	
    	return mBoardMapper.replyList();
    }
    public int boardReInsertService(ReplyVO reply) throws Exception{
        
        return mBoardMapper.boardReInsert(reply);
    }
    public int replyModify(ReplyVO reply) throws Exception{
    	
    	return mBoardMapper.replyModify(reply);
    }
    public int boardReRemoveService(int rno) throws Exception{
    	
    	return mBoardMapper.boardReRemove(rno);
    }
    
    public ReplyVO replyRead(ReplyVO reply) throws Exception{
    	
    	return mBoardMapper.replyRead(reply);
    }
    
    
    
    
    
    
    
    public int boardOriginUpdateService(BoardVO board) throws Exception{
    	
    	return mBoardMapper.boardOriginUpdate(board);
    }
    
    public int boardUpdateService(BoardVO board) throws Exception{
        
        return mBoardMapper.boardUpdate(board);
    }
    
    public int boardDeleteService(int bno) throws Exception{
        
        return mBoardMapper.boardDelete(bno);
    }
    //dash
    public DashInfo dashInfo() throws Exception{ 
    	
         return mBoardMapper.dashInfo();
    }


}
