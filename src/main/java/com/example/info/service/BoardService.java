package com.example.info.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.info.domain.BoardVO;
import com.example.info.domain.Criteria;
import com.example.info.domain.DashInfo;
import com.example.info.mapper.BoardMapper;

@Service("com.example.info.service.BoardService")
public class BoardService {
    @Resource(name="com.example.info.mapper.BoardMapper")
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
    
    public int boardReInsertService(BoardVO board) throws Exception{
        
        return mBoardMapper.boardReInsert(board);
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
