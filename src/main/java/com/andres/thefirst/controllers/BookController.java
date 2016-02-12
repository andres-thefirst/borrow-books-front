package com.andres.thefirst.controllers;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.andres.thefirst.books.entity.Book;
import com.andres.thefirst.books.entity.User;
import com.andres.thefirst.books.service.IBookBo;
import com.andres.thefirst.books.service.IBookGenreBo;
import com.andres.thefirst.books.service.ISystemFileBo;
import com.andres.thefirst.books.service.IUserBo;
import com.andres.thefirst.dto.BookDto;
import com.andres.thefirst.dto.ResponseDto;
import com.andres.thefirst.request.BookFindRqt;
import com.andres.thefirst.request.BookRegisterRqt;
import com.andres.thefirst.request.BookSearchRqt;
import com.andres.thefirst.response.BookConsultRsp;
import com.andres.thefirst.response.BookRegisterRsp;
import com.andres.thefirst.session.NewBook;

@Controller
public class BookController {
	
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	
	@Autowired
	private IUserBo userBo;
	
	@Autowired
	private IBookBo bookBo;
	
	@Autowired
	private ISystemFileBo fileBo;
	
	public UserDetails currentUserDetails(){
	    SecurityContext securityContext = SecurityContextHolder.getContext();
	    Authentication authentication = securityContext.getAuthentication();
	    if (authentication != null) {
	        Object principal = authentication.getPrincipal();
	        return principal instanceof UserDetails ? (UserDetails) principal : null;
	    }
	    return null;
	}
	

	 
	@RequestMapping(value="/book/register", method=RequestMethod.POST)
	public @ResponseBody ResponseDto register(@RequestBody BookRegisterRqt rqt){
		ResponseDto rsp = new ResponseDto();
		try{
			logger.info("::register::Starting process");
			Book b = new Book();
			b.setBook(rqt.getBook());
			b.setAuthor(rqt.getAuthor());
			b.setEditorial(rqt.getEditorial());
			b.setIsbn(rqt.getIsbn());
			b.setResume(rqt.getResume());
			
			UserDetails userDetails = currentUserDetails();
			User user = userBo.findByUser(userDetails.getUsername());
			b.setUser(user);
			
			b = bookBo.save(b);
			
			BookRegisterRsp bookRsp = new BookRegisterRsp();
			bookRsp.setId(b.getId());
			rsp.setContent(bookRsp);
		}catch(Exception e){
			e.printStackTrace();
			rsp.setCode(-1);
			rsp.setMessage("It wasn't possible register the book, try again");
			logger.info("::register::Failed register of book");
		}
		
		logger.info("::register::Ending process");
		
		return rsp;
	}
	
	@RequestMapping(value="/book/missingImage", method=RequestMethod.POST)
	public @ResponseBody ResponseDto missingImage(){
		ResponseDto rsp = new ResponseDto();
		
		logger.info("::missingImage::Starting process");
		try{
			UserDetails userDetails = currentUserDetails();
			User user = userBo.findByUser(userDetails.getUsername());
			
			Book book = bookBo.findByUserIdAndImageNull(user.getId());
			if(book!=null){
				NewBook newBook = new NewBook();
				newBook.setId(book.getId());
				rsp.setContent(newBook);
			}
			
		}catch(Exception e){
			e.printStackTrace();
			logger.info("::missingImage::Error to consult the info");
			rsp.setCode(-1);
			rsp.setMessage("Error");
		}
		
		logger.info("::missingImage::Ending process");
		return rsp;
	}
	
	@RequestMapping(value="/book/uploadImage", method=RequestMethod.POST)
	public @ResponseBody ResponseDto uploadImage(@RequestParam("image") MultipartFile files, @RequestParam("id") int id){
		ResponseDto rsp = new ResponseDto();
		
		
		logger.info("::uploadImage::Starting process");
		try{
			byte[] bytesImage = files.getBytes();
			String pathName = id + File.separator + files.getOriginalFilename();
			fileBo.saveFile(bytesImage, pathName);
			
			Book book = bookBo.findById(id);
			book.setImage(pathName.replace("\\", "/"));
			bookBo.save(book);
			
		}catch(Exception e){
			e.printStackTrace();
			logger.info("::uploadImage::Error to save the image");
		}
		
		logger.info("::uploadImage::Ending process");
		return rsp;
	}
	
	@RequestMapping(value="/book/consultAll", method=RequestMethod.POST)
	public @ResponseBody ResponseDto consultAll(@RequestBody BookSearchRqt rqt){
		ResponseDto rsp = new ResponseDto();
		
		
		logger.info("::consultAll::Starting process");
		try{
			
			Page<Book> pageData = bookBo.findAll(rqt.getPage(), 15);
			List<Book> listBook = pageData.getContent();
			List<BookDto> listBookDto = new ArrayList<BookDto>();
			
			for(Book item : listBook)
				listBookDto.add(new BookDto(item));
			
			BookConsultRsp bookRsp = new BookConsultRsp();
			bookRsp.setListBooks(listBookDto);
			bookRsp.setPages(pageData.getTotalPages());
			bookRsp.setTotal(pageData.getTotalElements());
			
			rsp.setContent(bookRsp);
			
		}catch(Exception e){
			e.printStackTrace();
			logger.info("::consultAll::Error to consult the books");
			rsp.setCode(-1);
			rsp.setMessage("Error to consult the books");
		}
		
		logger.info("::consultAll::Ending process");
		return rsp;
	}
	
	@RequestMapping(value="/book/image/{id}/{path:.+}", method=RequestMethod.GET, produces = { MediaType.IMAGE_JPEG_VALUE,
	        MediaType.IMAGE_GIF_VALUE, MediaType.IMAGE_PNG_VALUE })
	public @ResponseBody byte [] getImage(@PathVariable String id, @PathVariable String path){
		byte [] data = null;
		
		logger.info("::getImage::Starting process");
		try{
			data = fileBo.getBytes(id + File.separator + path);
		}catch(IOException e){
			logger.info("::getImage::Error to consult the image");
		}
		
		logger.info("::getImage::Ending process");
		return data;
	}
	
	@RequestMapping(value="/book/findById", method=RequestMethod.POST)
	public @ResponseBody ResponseDto findById(@RequestBody BookFindRqt rqt){
		ResponseDto response = new ResponseDto();
		
		logger.info("::findById::Starting process");
		try{
			Book book = bookBo.findById(rqt.getId());
			BookDto dto = new BookDto(book);
			response.setContent(dto);
		}catch(Exception e){
			logger.info("::findById::Error to consult the book");
		}
		
		logger.info("::findById::Ending process");
		return response;
	}
}
