package com.example.info.web;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.info.domain.BoardVO;
import com.example.info.domain.Criteria;
import com.example.info.domain.ReplyVO;
import com.example.info.security.SessionUser;
import com.example.info.service.BoardService;

import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@Controller
public class BoardController {
	@Autowired
    BoardService mBoardService;
    private final HttpSession httpSession;

	@GetMapping("/tables")
	private String tables(Model model) throws Exception{
        
        //model.addAttribute("list", mBoardService.boardListService());
        return "template/tables"; 
    }
	@GetMapping("/index")
	private String index(Model model) throws Exception{
		
		//model.addAttribute("list", mBoardService.boardListService());
		return "template/index"; 
	}
	@RequestMapping("/dashBoard")
	private String dashBoard(Model model) throws Exception{
		
		model.addAttribute("dash",mBoardService.dashInfo());
		return "sb_dashBoard"; 
	}
	
	@GetMapping("/")
	private String mainPage(Model model,Principal principal) throws Exception{
        SessionUser user = (SessionUser)httpSession.getAttribute("user");
        if(user!=null) {
        	model.addAttribute("user",user);
        }
        model.addAttribute("list", mBoardService.boardListService());
        model.addAttribute("reply", mBoardService.replyListService());
        return "sb_list"; 
    }
    
    
    @RequestMapping(value = {"/cri_list"}) //게시판 리스트 화면 호출  
    private String boardList(Model model,Criteria cri) throws Exception{
    	model.addAttribute("list", mBoardService.boardListServiceWithCri(cri));
    	return "sb_list"; 
    }
    
    @RequestMapping("/detail/{bno}") 
    private String boardetail(@PathVariable int bno, Model model) throws Exception{
    	model.addAttribute("detail", mBoardService.boardDetailService(bno));
    	
    	ReplyVO vo = new ReplyVO();
        vo.setBno(bno);
        System.out.println(vo);
    	model.addAttribute("reply", mBoardService.replyRead(vo));
      	
    	return "sb_detail";
    }
    
    
    @Transactional
    @RequestMapping("/delete/{bno}")
    private String boardDelete(@PathVariable int bno) throws Exception{
        mBoardService.boardDeleteService(bno);
        
        //게시글에 달린 댓글 삭제 
        ReplyVO vo = new ReplyVO();
        vo.setBno(bno);
        vo = mBoardService.replyRead(vo);
        if(vo!=null) {
        	mBoardService.boardReRemoveService(vo.getRno());
        }
        return "redirect:/";
    }
    
    @RequestMapping("/sb_insert") //게시글 작성폼 호출  
    private String boardInsertForm() throws Exception{
        return "sb_insert";
    }
    @RequestMapping("/insert/{bno}")   
    private String boardInsertForm(@PathVariable int bno, Model model) throws Exception{
    	model.addAttribute("detail", mBoardService.boardDetailService(bno));
        return "sb_insert";
    }
    
    @RequestMapping("/insertProc")
    private String boardInsertProc(@RequestParam(required = false, defaultValue="0") int bno, 
    		HttpServletRequest request,RedirectAttributes rttr) throws Exception{
        
        BoardVO board = new BoardVO();
        
        board.setSubject(request.getParameter("subject"));
        board.setContent(request.getParameter("content"));
        board.setWriter(request.getParameter("writer"));
        board.setName(request.getParameter("name"));
        
        if(bno!=0) {
        	//답변
            board.setRef(bno);
            //mBoardService.boardReInsertService(board);
            mBoardService.boardOriginUpdateService(board);
        }else {
        	//문의글
        	mBoardService.boardInsertService(board);
        }
        
		rttr.addFlashAttribute("result",board.getRef());
        
        return "redirect:/";
    }


    
    @RequestMapping("/update/{bno}") //게시글 수정폼 호출  
    private String boardUpdateForm(@PathVariable int bno, Model model) throws Exception{
        
        model.addAttribute("detail", mBoardService.boardDetailService(bno));
        
        return "sb_update";
    }
    
    @RequestMapping("/updateProc")
    private String boardUpdateProc(HttpServletRequest request) throws Exception{
        
        BoardVO board = new BoardVO();
        board.setSubject(request.getParameter("subject"));
        board.setContent(request.getParameter("content"));
        board.setBno(Integer.parseInt(request.getParameter("bno")));
        
        mBoardService.boardUpdateService(board);
        
        System.out.println(board.getContent());
        
        return "redirect:/detail/"+request.getParameter("bno"); 
    }
    
    
 

}
