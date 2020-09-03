package com.example.info.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.info.domain.BoardVO;
import com.example.info.domain.ReplyVO;
import com.example.info.service.BoardService;

import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@RestController
public class ReplyController {
	@Autowired
    BoardService mBoardService;

    @Transactional
    @PostMapping(value="/re_insert",produces= {MediaType.APPLICATION_JSON_VALUE})   
	  private ResponseEntity<ReplyVO> boardInsert(HttpServletRequest request,@RequestBody ReplyVO vo) throws Exception{
    	BoardVO board = new BoardVO();
  	  	board.setRef(vo.getBno());
  	  	int insertCount = mBoardService.boardReInsertService(vo);
    	mBoardService.boardOriginUpdateService(board);
    	
    	return insertCount==1? new ResponseEntity<>(mBoardService.replyRead(vo),HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
    
    @GetMapping(value="/replies",produces= {MediaType.APPLICATION_ATOM_XML_VALUE,MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<ReplyVO>> getList() throws Exception{ 
		return new ResponseEntity<>(mBoardService.replyListService(),HttpStatus.OK);
	}  
    
    
    
    @DeleteMapping(value="/re_remove/{rno}/{bno}",produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") int rno,@PathVariable("bno")int bno) throws Exception{ 
    	
    	BoardVO board = new BoardVO(); 
  	  	board.setRef(bno);
  	  	
  		int insertCount = mBoardService.boardReRemoveService(rno);
  		mBoardService.boardOriginUpdateService(board);
  		
		return insertCount==1 ? new ResponseEntity<>("success",HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	} 
    
    
    
    @RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH},value="/re_update/{rno}",consumes="application/json",produces= {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ReplyVO> modify(@RequestBody ReplyVO vo, @PathVariable("rno") Long rno,RedirectAttributes rttr) throws Exception{
		if(mBoardService.replyModify(vo)==1) {
			rttr.addFlashAttribute("result","success");	
		}
		System.out.println("update"+vo);
	
	return mBoardService.replyModify(vo)==1? new ResponseEntity<>(mBoardService.replyRead(vo),HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
