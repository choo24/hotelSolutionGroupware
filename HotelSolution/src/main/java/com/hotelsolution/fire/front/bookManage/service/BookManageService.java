package com.hotelsolution.fire.front.bookManage.service;

import java.util.List;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.front.bookManage.vo.BookManageVo;

public interface BookManageService {

	List<BookManageVo> list(PageVo pv, String searchType, String searchValue);

	int getBookCnt();

	BookManageVo getBookByNo(int no);

}
