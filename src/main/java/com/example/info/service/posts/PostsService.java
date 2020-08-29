//package com.example.info.service.posts;
//
//import javax.transaction.Transactional;
//
//import org.springframework.stereotype.Service;
//
//import com.example.info.domain.posts.Posts;
//import com.example.info.domain.posts.PostsRepository;
//import com.example.info.web.dto.PostsResponseDto;
//import com.example.info.web.dto.PostsSaveRequestDto;
//import com.example.info.web.dto.PostsUpdateRequestDto;
//
//import lombok.RequiredArgsConstructor;
//@RequiredArgsConstructor
//@Service
//public class PostsService {
//	private final PostsRepository postsRepository;
//	
//	@Transactional
//	public Long save(PostsSaveRequestDto requestDto) {
//		return postsRepository.save(requestDto.toEntity()).getId();
//	}
//	
//	@Transactional
//	public Long update(Long id, PostsUpdateRequestDto requestDto) {
//		Posts posts = postsRepository.findById(id).orElseThrow(()->new IllegalArgumentException("해당 글이 없습니다. id= "+id));
//		posts.update(requestDto.getTitle(), requestDto.getContent());
//		
//		return id;
//	}
//	
//	public PostsResponseDto findById(Long id) {
//		Posts entity = postsRepository.findById(id).orElseThrow(()->new IllegalArgumentException("해당 글이 없습니다. id= "+id));
//		
//		return new PostsResponseDto(entity);
//	}
//}
