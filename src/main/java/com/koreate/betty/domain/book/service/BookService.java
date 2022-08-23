package com.koreate.betty.domain.book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreate.betty.domain.book.dao.BookRepository;
import com.koreate.betty.domain.book.dto.BookSearchForm;
import com.koreate.betty.domain.book.dto.BookUpdateForm;
import com.koreate.betty.domain.book.vo.Book;

@Service
public class BookService {

	@Autowired
	BookRepository bookRepository;
	
	// 나중에 @Valid 검증 객체 앞에 추가
	// bookUpdate Form에 맞게 수정할 것
	public int update(String targetCode, BookUpdateForm form) {	
		
		Book book = form.createBook();		
		return bookRepository.update(targetCode, book);
	}

	public List<Book> jBooksList() {
		return bookRepository.jBooksList();
	}
	
	public List<Book> jBooksSearch(BookSearchForm form) {
		return bookRepository.jBooksSearch();
	}

	public int insertByCrawler(Book book) {
		return bookRepository.insertByCrawler(book);		
	}
}
