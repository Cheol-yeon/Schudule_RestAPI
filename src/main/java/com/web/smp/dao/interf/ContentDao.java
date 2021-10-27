package com.web.smp.dao.interf;

import java.util.List;

import com.web.smp.di.entity.Content;

public interface ContentDao {
	Content getContent(int content_seq);

	List<Content> getContentList(String query);

	List<String> getMainCategory(int menu_no);

	List<String> getMSubCategory(int menu_no);

}
